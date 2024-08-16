const { backendUrl } = require("../../../config");

// pages/userCenter/discountTicket/discountTicket.js
Page({
  data: {
    coupons: [] // 存储优惠券的数组
  },

  onLoad: function (options) {
    // 假设在页面加载时获取优惠券数据
    this.getUserCoupons(200003);
  },

  // success:(res)=>{
  //   console.log(res.data.data.records);
  //     var filteredCommodities = [];
  //     res.data.data.records.forEach(item => {
  //       var obj = {
  //         commodityName: item.commodityName,
  //         commodityPrice: item.commodityPrice, 
  //       };
  //       filteredCommodities.push(obj);
  //     });
  //     this.setData({
  //       commodityNames: filteredCommodities  // 更新页面数据
  //     });
  //   }

  getUserCoupons: function (userId) {
    wx.request({
      url: `http://49.232.136.246:8090/wx/user/selectCouponsById`,
      method: 'GET',
      data: { userId: 200003 },
      success: (res) => {
        console.log(res.data.data.records);
        // if (res.statusCode === 200) {
        //   // 成功获取数据后，更新 coupons 数据
        //   this.setData({
        //     coupons: res.data
        //   });
        // } 
        var filteredCommodities = [];
        res.data.data.records.forEach(item => {
        var obj = {
          couponsName: item.couponsName,
          reductionPrice: item.reductionPrice, 
          reductionFull:item.reductionFull,
          createTime:item.createTime,
          updateTime:item.updateTime
        };
        filteredCommodities.push(obj);
      });
      this.setData({
        coupons: filteredCommodities  // 更新页面数据
      });
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
