// pages/userProfile/user.js
import {getRequest} from "../../utils/wxRequest";
const defaultAvatarUrl ='https://tdesign.gtimg.com/mobile/demos/avatar1.png'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    avatar:'https://tdesign.gtimg.com/mobile/demos/avatar1.png',
    // avatar:'',
    nickName:'test',
    pic:defaultAvatarUrl,
    messages:[],
    recentOrder:[],
    orders:[],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
   
    
      
  
  },
  OnchooseAvatar:function(e){
    console.log(e.detail.avatarUrl);
    var pic=e.detail.avatarUrl
    this.setData({
      pic
    })
  },
  goToNextPage: function() {
    wx.navigateTo({
      url: '/pages/userCenter/editProfile/editProfile'  // 确保路径与你的小程序页面结构一致
    });
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {
    // wx.getUserInfo({
    //   success:(res)=>{
    //     console.log(res.userInfo),
    //     this.setData({
    //       nickName:res.userInfo.nickName,
    //       avatar:res.userInfo.avatarUrl
    //     })
    //   }
    // })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    wx.request({
      url: 'http://49.232.136.246:8090/wx/order/selectorder',
      method: 'get',
      data:{
        userId:'200021'
      },
      success:res=>{
        console.log("获取订单信息成功==>",res.data.data.records);

        var lastIndex = res.data.data.records.length-1;
        console.log("list==>",typeof(res.data.data.records[lastIndex].list),res.data.data.records[lastIndex].list);
        this.setData({
          recentOrder: res.data.data.records[lastIndex].list,
          orders: res.data.data.records
        });

        //订单信息写入缓存
        wx.setStorage({
          key: "userOrder",
          data:res.data.data.records
        });

        //获取最新订单消息
  
        console.log("recentOrder==>",this.data.recentOrder,"==>", res.data.data.records[lastIndex]);
       
      },
      fail:err=>{
        console.log("获取订单信息出错误==>",res.data.data.records[res.data.data.records.length-1]);
      }
    })
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  },

  getWxcode(){
    wx.login({
      success: (res) => {
        console.log("code: ",res.code);
      },
    })
    
  },
})