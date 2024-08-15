// pages/userCenter/discountTicket/discountTicket.js
Page({
  data: {
    coupons: [] // 存储优惠券的数组
  },

  onLoad: function (options) {
    // 假设在页面加载时获取优惠券数据
    this.getUserCoupons(123);
  },

  getUserCoupons: function (userId) {
    wx.request({
      url: `http://49.232.136.246:8090/wx/user/selectCouponsById`,
      method: 'GET',
      data: { userId: userId },
      header: { 'Content-Type': 'application/json' },
      success: (res) => {
        if (res.statusCode === 200) {
          // 成功获取数据后，更新 coupons 数据
          this.setData({
            coupons: res.data
          });
        } 
      },
    });
  }
});

Component({
  methods: {
    onBack() {
      wx.navigateBack();
    },
    onGoHome() {
      wx.reLaunch({
        url: '../user.js',
      });
    },
  },
});
