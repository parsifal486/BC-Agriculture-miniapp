// pages/home.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    postlist:["https://tax-test.oss-cn-qingdao.aliyuncs.com/%E6%96%B0%E5%BB%BA%E6%96%87%E4%BB%B6%E5%A4%B9/post1.png","https://tax-test.oss-cn-qingdao.aliyuncs.com/%E6%96%B0%E5%BB%BA%E6%96%87%E4%BB%B6%E5%A4%B9/post2.png","https://tax-test.oss-cn-qingdao.aliyuncs.com/%E6%96%B0%E5%BB%BA%E6%96%87%E4%BB%B6%E5%A4%B9/post3.png"],
  },
  
  
  goShop(e) {
    console.log(e);
  },
  
  QRscan(e) {
    console.log(e);
    wx.scanCode({
      success (res) {
        console.log(res.rawData)
        const decodedString = atob(res.rawData); // 使用 atob() 解码 Base64
        console.log(decodedString)
        wx.setStorageSync('scanResult', decodedString);
        wx.navigateTo({
            url: '/pages/QRcode/QRcode'
          });
          
      },fail(err){
        console.log("扫描失败",err)
      }
      
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    
    
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


  toArticlePage(){
    wx.navigateTo({
      url: '/pages/home/article/article',
    })
  }
})