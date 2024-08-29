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

  addToCart(e) {
    const pages = getCurrentPages();
    const prevPage = pages[pages.length - 2];
    let itemToCart = {
      commodityId: this.data.commodityId,
      commodityName: this.data.commodityName,
      commodityOrigin: this.data.commodityOrigin,
      commodityPartition: this.data.commodityPartition,
      commodityPrice: this.data.price,
      commodityRemark: this.data.commodityRemark,
      commodityUpdateTime: this.data.commodityUpdateTime,
      profileImage: this.data.productImg,
      quantity: this.data.total
    };
    prevPage.setData({
      itemToCart:itemToCart
    });
    wx.navigateBack();
  },



  onBack() {
    wx.navigateBack();
  },


  onGoHome() {
    wx.reLaunch({
      url: '/pages/home/home',
    });
  },


  onStepperChange(e) {
    console.log("onstepperchaneg===>", e)
    const count = e.detail.value;
    if (count > 0) {
      this.setData({
        total: count
      });
    }
  },

  // 计算总金额的函数
  calculateTotalAmount() {
    const totalAmount = this.data.total * this.data.price;
    return totalAmount;
  },

  
  onBuyNow(e) {
    const totalAmount = this.calculateTotalAmount();
    console.log('Total Amount:', totalAmount);

    wx.showModal({
      title: '确认结账',
      content: `总金额为：￥${totalAmount}，确认要结账吗？`,
      success: (res) => {
        if (res.confirm) {
          this.sendItemOrderDetail();
          wx.showToast({
            title: '结账成功',
            icon: 'success',
          });
        } else if (res.cancel) {
          console.log('Checkout cancelled.');
        }
      }
    });
  },

  sendItemOrderDetail(){
    let item = {
      commodityId: this.data.commodityId,
      quantity: this.data.total
    };
    let orderToSend = [item];
    wx.getStorage({
      key:'token',
      success:res=>{
        let token = res.data;
        wx.request({
          url: 'http://49.232.136.246:8090/wx/order/insertorder',
          method: 'post',
          header: {
            token
          },
          data:orderToSend ,
          success: res=>{
            console.log("订单提交成功!===>",res);
          } ,
          fail:err=> {
            console.error("订单提交错误!==>",err);
          }
        })    
      }
    });
  }


});