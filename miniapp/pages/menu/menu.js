// // pages/menu/menu.js
// Page({

//   /**
//    * 页面的初始数据
//    */
//   data: {
//     sideslipMenuArr: [
//       '../img/temp/menu-1.png',
//       '../img/temp/menu-2.png',
//       '../img/temp/menu-3.png'
//     ]
//   },

//   /**
//    * 生命周期函数--监听页面加载
//    */
//   onLoad(options) {

//   },

//   /**
//    * 生命周期函数--监听页面初次渲染完成
//    */
//   onReady() {

//   },

//   /**
//    * 生命周期函数--监听页面显示
//    */
//   onShow() {

//   },

//   /**
//    * 生命周期函数--监听页面隐藏
//    */
//   onHide() {

//   },

//   /**
//    * 生命周期函数--监听页面卸载
//    */
//   onUnload() {

//   },

//   /**
//    * 页面相关事件处理函数--监听用户下拉动作
//    */
//   onPullDownRefresh() {

//   },

//   /**
//    * 页面上拉触底事件的处理函数
//    */
//   onReachBottom() {

//   },

//   /**
//    * 用户点击右上角分享
//    */
//   onShareAppMessage() {

//   }
// })
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
    information:[

    ],
    categories: [
      // {
      //   label: '个性推荐',
        
      // },
      // {
      //   label: '临期特价',
      //   icon: 'app',
      //   badgeProps: {
      //     dot: true,
      //   },
      //   items: items.slice(0, 9),
      // },
      // {
      //   label: '新品上市',
      //   icon: 'app',
      //   badgeProps: {},
      //   items: items.slice(0, 9),
      // },
    ],
    navbarHeight: 0,
  },
queryCommodityById(value)
{
  console.log(value)
  wx.request({
    url: 'http://49.232.136.246:8080/wx/commodity/queryCommodityByType',
    data: {
      partitionName: "花叶类"
    },
    success:(res)=>
    {
      console.log(res.data.data.records);
      var information=[];
      res.data.data.records.forEach(item=>{
        var obj={
          commodityName: item.commodityName,
          commodityPrice: item.commodityPrice,
          remark: item.remark,
          orgin: item.orgin,
        }
        information.push(obj)
      })
      this.setData({
        informations:information
      })
        console.log(information)
      
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
        var obj = {
          label: item,
          icon: 'app',
        badgeProps: {},
          items:items.slice(0, 9),
        }
        
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
      url: 'http://49.232.136.246:8080/wx/commodity/queryAllType',
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

