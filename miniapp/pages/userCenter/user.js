// pages/userProfile/user.js
import {getRequest} from "../../utils/wxRequest";
const defaultAvatarUrl ='https://tdesign.gtimg.com/mobile/demos/avatar1.png'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    avatar:defaultAvatarUrl,
    // avatar:'',
    nickName:'test',
    messages:[],
    recentOrder:[],
    orders:[],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    wx.getStorage({
      key: 'token',
      success:res =>{
        let token = res.data;
        
        //获取用户资料
        wx.request({
          url: 'http://49.232.136.246:8090/wx/user/userInformation',
          method: 'get',
          header:{'token':token},
          success:res=>{
            console.log("userinfo==>",res);
          }
        })

        //获取订单信息
        wx.request({
          url: 'http://49.232.136.246:8090/wx/order/selectorder',
          method: 'get',
          header:{'token':token},
          data:{
            
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
      }
    });
  },
  OnchooseAvatar:function(e){
    console.log(e.detail.avatarUrl);
    var pic=e.detail.avatarUrl
    this.setData({
      pic
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

    wx.getStorage({
      key: "needFreshUser"
    });

    
    
    
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