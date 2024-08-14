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
    categories: [
      
    ],
    commodityNames:[
     { commodityName: "111"}
  ,]
    ,
    navbarHeight: 0,
  },
  onLoad() {
    this.getCustomNavbarHeight();
  },

  getCustomNavbarHeight() {
    const query = wx.createSelectorQuery();
    query.select('.custom-navbar').boundingClientRect();
    query.exec((res) => {
      const { height = 0 } = res[0] || {};
      this.setData({ navbarHeight: height });
    });
  },

  onSideBarChange(e) {
    const { value } = e.detail;

    this.setData({ sideBarIndex: value, scrollTop: 0 });
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
      }
      commodity.push(obj)
    })
    this.setData({
      commodityNames:commodity
    })
     
    
   
  }
})
},
getCategriess(){
  //发请求
  wx.request({
    url: 'http://49.232.136.246:8090/wx/commodity/queryAllType',
  //接收数据
  success:(res)=>{
    //打印数据
    console.log(res.data.data.records)
    //将获取的数据转化成你要的数据
    var ojb=[];
    var obj1={
      label:"全部",
      icon: 'app',
        badgeProps: {},
          items:items.slice(0, 9),
    }
  }
  })
  
  },





  getCategries(res) {
    // todo 发请求
  
    var categries = [];
    var obj={
      label:"全部",
      icon: 'app',
        badgeProps: {},
          items:items.slice(0, 9),
    }
    categries.push(obj)
    res.data.data.records.forEach(item => {
      //把数据放进去 我们定义的变量当中：object
        var obj = {
          label: item,
          icon: 'app',
        badgeProps: {},
          items:items.slice(0, 9),
        }
        //把含有数据的obejct放入数组
        categries.push(obj)
    })
    
    this.setData({
      categories:categries
    })
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
    wx.request({
      url: 'http://49.232.136.246:8090/wx/commodity/queryAllType',
      method: 'get',
      success:(res2)=>{
      console.log(res2.data.data.records);
      this.getCategries(res2);
        
      }
    })


  },
  onSideBarChange(e) {
    const { value } = e.detail;

    this.setData({ sideBarIndex: value, scrollTop: this.offsetTopList[value] });
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

