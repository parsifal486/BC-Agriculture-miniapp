Page({
  onLoad(){
    const scanResult = wx.getStorageSync('scanResult');
    console.log(scanResult);
  },
  data: {
    product: {
      imageUrl: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082', // 示例图片路径
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
