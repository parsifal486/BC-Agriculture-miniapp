Page({
  data: {

    price: 10.2,
    commodityName: "",
    commodityId: "",
    cart: [],
    totalPrice: 0,
    total: 0,
    autoplay: true,
    interval: 2000,
    duration: 300,
    productImg: [
      "/pages/img/temp/1.png"
    ]
  },

  onLoad: function (options) {
    
    wx.getStorage({
      key: 'currentCommodity',
      success: res => {
        const item = res.data.aimCommodity;
        this.setData({
          commodityId: item.commodityId,
          commodityName: item.commodityName,
          price: item.commodityPrice,
          commodityOrigin: item.commodityOrigin,
          commodityRemark: item.commodityRemark,
          commodityPartition: item.commodityPartition,
          commodityUpdateTime: item.commodityUpdateTime,
          productImg: [item.profileImage]
        })
      }
    });
  },

  onShow: function (options) {

  },
  addToCart(event) {
    const productId = event.currentTarget.dataset.id;
    const product = this.data.products.find(item => item.id === productId);
    if (product) {
      this.setData({
        cart: [...this.data.cart, product],
        total: this.data.total + 1,
        totalPrice: this.data.total * this.data.price
      });
    }
  },
  removeFromCart(event) {
    const productId = event.currentTarget.dataset.id;
    const product = this.data.cart.find(item => item.id === productId);
    if (product) {
      this.setData({
        total: this.data.total - 1,
        totalPrice: this.data.total * this.data.price
      });
    }

  },
  onBack() {
    wx.navigateBack();
  },
  onGoHome() {
    wx.reLaunch({
      url: '/pages/home/home',
    });
  },
});