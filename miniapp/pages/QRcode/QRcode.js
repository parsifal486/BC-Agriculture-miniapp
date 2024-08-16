Page({
  onLoad(){
    const scanResult = wx.getStorageSync('scanResult');
    console.log(scanResult);
  },
  data: {
    product: {
      imageUrl: 'https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333', // 示例图片路径
      productNumber: '123456789',
      productName: '高品质商品',
      location: '山东省青岛市崂山区小麦岛',
      time: '30',
      temperature:'20',
      shippingDate: '2024-08-16',
      manager: '张三'
    }
  },

  onLoad() {
    // 可以在这里调用 wx.request 来获取真实数据
    // wx.request({
    //   url: 'https://example.com/getProduct',
    //   success: (res) => {
    //     this.setData({ product: res.data });
    //   }
    // });
  }
});
