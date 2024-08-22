const {
  backendUrl
} = require("../../../config");

// pages/userCenter/discountTicket/discountTicket.js
Page({
  data: {
    coupons: [] // 存储优惠券的数组
  },

  onLoad(options) {
    console.log("函数已执行");
    // 在页面加载时获取优惠券数据
    this.getUserCoupons(200003);

  },


  getUserCoupons: function (userId) {

    wx.request({
      url: `http://49.232.136.246:8090/wx/user/selectCouponsById`,
      method: 'GET',
      data: {
        userId: userId
      },

      success: (res) => {
        if (res.statusCode === 200 && res.data && res.data.data && res.data.data.records) {
          console.log(res.data.data.records);

          // 处理返回的优惠券数据
          var filteredCommodities = res.data.data.records.map(item => {
            return {
              couponsName: item.couponsName,
              reductionPrice: item.reductionPrice,
              reductionFull: item.reductionFull,
              createTime: item.createTime,
              updateTime: item.updateTime
            };
          });

          // 更新页面数据
          this.setData({
            coupons: filteredCommodities
          });
        } else {
          console.error("Failed to fetch data:", res);
        }
      },
      fail: (err) => {
        console.error("Request failed:", err);
      }
    });
  },

  handleBack() {
    // 使用 wx.navigateBack 返回到上一个页面
    wx.navigateBack({
      delta: 1, // 返回的页面层级，默认为1，即返回到上一个页面
      success: (res) => {
        console.log('Successfully navigated back', res);
      },
      fail: (err) => {
        console.error('Failed to navigate back', err);
      }
    });
  },


});