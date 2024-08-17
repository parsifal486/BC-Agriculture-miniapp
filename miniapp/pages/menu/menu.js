// <!-- TDesign侧边栏 -->
import config from "../../config";
import {backendUrl} from "../../config"
const image = 'https://tdesign.gtimg.com/mobile/demos/example2.png';
const items = new Array(12).fill({ label: '标题文字', image }, 0, 12);

Page({    
  offsetTopList: [],
  data: {
    sideBarIndex: 1,
    scrollTop: 0,
    categories: [],
    commodityNames:[],
    navbarHeight: 0,
  },
  // onLoad() {
  //   this.getCustomNavbarHeight();
  // },

  getCustomNavbarHeight() {
    const query = wx.createSelectorQuery();
    query.select('.custom-navbar').boundingClientRect();
    query.exec((res) => {
      const { height = 0 } = res[0] || {};
      this.setData({ navbarHeight: height });
    });
  },

  onSideBarChange(e) {
    const {value } = e.detail;
    this.setData({ sideBarIndex: value, scrollTop: 0 });
    const selectedCategory = this.data.categories[value].label; // 获取选中的种类名称
    if (selectedCategory === "全部") {
      this.getAllCommodity(); // 获取所有商品
    } else {
      this.queryCommodityByType(selectedCategory); // 根据选中的种类加载对应商品数据
    }  // 根据选中的种类获取对应的商品
  },
// queryCommodityById(value)
// {
//   console.log(value)
//   wx.request({
//     url: 'http://49.232.136.246:8090/wx/commodity/queryCommodityByType',
//     data: {
//       partitionName: "花叶类"
//     },
//     success:(res)=>
//     {
//       console.log(res.data.data.records);
//       var information=[];
//       res.data.data.records.forEach(item=>{
//         var obj={
//           commodityName: item.commodityName,
//           commodityPrice: item.commodityPrice,
//           remark: item.remark,
//           orgin: item.orgin,
//         }
//         information.push(obj)
//       })
//       this.setData({
//         informations:information
//       })
//         console.log(information)
      
//     }
     
//   })
// },

//根据类型查询菜品信息，点不同的种类显示不同的菜品
queryCommodityByType(partitionName){
wx.request({
  url: 'http://49.232.136.246:8090/wx/commodity/queryCommodityByType',
  method:'GET',
  data: {
    partitionName: partitionName // 传递商品类型作为查询参数
  },
  success:(res)=>{
    console.log(res.data.data.records);
      var filteredCommodities = [];
      res.data.data.records.forEach(item => {
        var obj = {
          commodityName: item.commodityName,
          commodityPrice: item.commodityPrice, 
          profileImage: item.profileImage
        };
        filteredCommodities.push(obj);
      });
      this.setData({
        commodityNames: filteredCommodities  // 更新页面数据
      });
    }
  })
},

//查询菜品所有信息
getAllCommodity(){
//发请求
wx.request({
  url: 'http://49.232.136.246:8090/wx/commodity/queryAllCommodity',
  success:(res)=>{
    console.log(res.data.data.records)
    var commodity=[];
    res.data.data.records.forEach(item=>{
      var obj={
        commodityName: item.commodityName,
        commodityPrice: item.commodityPrice,
      }
      commodity.push(obj)
    })
    this.setData({
      commodityNames:commodity,
      commodityPrice:commodity,
    })
  }
})
},
//查询菜品种类信息
// getCategriess(){
//   //发请求
//   wx.request({
//     url: 'http://49.232.136.246:8090/wx/commodity/queryAllType',
//   //接收数据
//   success:(res)=>{
//     //打印数据
//     console.log(res.data.data.records)
//     //将获取的数据转化成你要的数据
//     var ojb=[];
//     var obj1={
//       label:"全部",
//       icon: 'app',
//         badgeProps: {},
//           items:items.slice(0, 9),
//     }
//   }
//   })
  
//   },

getCategories(res) {
  var categories = [];

  // 处理服务器返回的分类数据
  res.data.data.records.forEach((item) => {
    categories.push({
      label: item,  // 假设返回的数据项中有label字段
      icon: 'app',
      badgeProps: {},
      items: [] // 根据需求填充items
    });
  });
  this.setData({
    categories: categories
  });
},

  onGoHome() {
    // Code to navigate to the home page
    wx.navigateTo({
      url: '../home/home.wxml'
    });
  },
  onBack() {
    // Code to navigate back, typically using wx.navigateBack
    wx.navigateBack({
      delta: 1 // Go back by one page in the navigation stack
    });
  },
  onLoad() {
    const query = wx.createSelectorQuery().in(this);
    const { sideBarIndex } = this.data;
    query.selectAll('.title').boundingClientRect();
    query.select('.custom-navbar').boundingClientRect();
    query.exec((res) => {
      const [rects, { height: navbarHeight = 0 }] = res;
      this.offsetTopList = rects.map((item) => item.top - navbarHeight);
      this.setData({ navbarHeight, scrollTop: this.offsetTopList[sideBarIndex] });
    });
    // this.loadCategories();
    wx.request({
      url: 'http://49.232.136.246:8090/wx/commodity/queryAllType',
      method: 'get',
      success:(res2)=>{
      console.log(res2.data.data.records);
      this.getCategories(res2);
      // this.setData({
      //   categories: res2.data.data.categories
      // });
      if (res2.data.data.records.length > 0) {
        const defaultCategory = res2.data.data.records[0];
        this.queryCommodityByType(defaultCategory);
      }
    }
  });
  },

  onScroll(e) {
    const { scrollTop } = e.detail;
    const threshold = 50; // 下一个标题与顶部的距离

    if (scrollTop < threshold) {
      this.setData({ sideBarIndex: 0 });
      return;
    }

    const index = this.offsetTopList.findIndex((top) => top > scrollTop && top - scrollTop <= threshold);

    if (index > -1) {
      this.setData({ sideBarIndex: index });
    }
  },
  methods: {
    onBack() {  
      wx.navigateBack();
    },
    onGoHome() {
      wx.reLaunch({
        url: '../home/home.wxml',
      });
    },
  },
});

