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
    messages:[]
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
// getInformation(){
//     wx.getUserInfo({
//       success:(res)=>{
//         console.log(res.userInfo),
//         this.setData({
//           nickName:res.userInfo.nickName,
//           avatar:res.userInfo.avatarUrl
//         })
//       }
//     })
// }
  
  

})