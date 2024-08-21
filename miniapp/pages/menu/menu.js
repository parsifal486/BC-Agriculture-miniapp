import themeChangeBehavior from 'tdesign-miniprogram/mixins/theme-change';

Page({
  behaviors: [themeChangeBehavior],
  offsetTopList: [],
  data: {
    sideBarIndex: 1,
    scrollTop: 0,
    categories: [],
    commodityNames: [],
    navbarHeight: 0,
    shoppingCart: [],
    popVisible: false,
    totalPrice: 0,
  },
   

  onLoad() {
    wx.request({
      url: 'http://49.232.136.246:8090/wx/commodity/queryAllType',
      method: 'get',
      success: (res) => {
        console.log("menu page init data ==>",res.data.data.records);
        this.getCategories(res);
        if (res.data.data.records.length > 0) {
          const defaultCategory = res.data.data.records[0];
          this.queryCommodityByType(defaultCategory);
        }
      }
    });
  },

  getCustomNavbarHeight() {
    const query = wx.createSelectorQuery();
    query.select('.custom-navbar').boundingClientRect();
    query.exec((res) => {
      const {
        height = 0
      } = res[0] || {};
      this.setData({
        navbarHeight: height
      });
    });
  },

  onSideBarChange(e) {
    const {
      value
    } = e.detail;
    this.setData({
      sideBarIndex: value,
      scrollTop: 0
    });
    const selectedCategory = this.data.categories[value].label; // 获取选中的种类名称
    if (selectedCategory === "全部") {
      this.getAllCommodity(); // 获取所有商品
    } else {
      this.queryCommodityByType(selectedCategory); // 根据选中的种类加载对应商品数据
    } // 根据选中的种类获取对应的商品
  },

  //根据类型查询菜品信息，点不同的种类显示不同的菜品
  queryCommodityByType(partitionName) {
    wx.request({
      url: 'http://49.232.136.246:8090/wx/commodity/queryCommodityByType',
      method: 'GET',
      data: {
        partitionName: partitionName // 传递商品类型作为查询参数
      },
      success: (res) => {
        console.log("commodity==>",res.data.data.records);
        var filteredCommodities = [];
        res.data.data.records.forEach(item => {
          var obj = {
            commodityId: item.commodityId,
            commodityName: item.commodityName,
            commodityPrice: item.commodityPrice,
            profileImage: item.profileImage
          };
          filteredCommodities.push(obj);
        });
        console.log("currentCate==>(commodityNames)",filteredCommodities);
        this.setData({
          commodityNames: filteredCommodities // 更新页面数据
        });
      }
    })
  },

  //查询菜品所有信息
  getAllCommodity() {
    //发请求
    wx.request({
      url: 'http://49.232.136.246:8090/wx/commodity/queryAllCommodity',
      success: (res) => {
        console.log("res==>",res.data.data.records);
        var commodity = [];
        res.data.data.records.forEach(item => {
          var obj = {
            commodityName: item.commodityName,
            commodityPrice: item.commodityPrice,
          }
          commodity.push(obj)
        })
        this.setData({
          commodityNames: commodity,
          commodityPrice: commodity,
        })
      }
    })
  },

  getCategories(res) {
    var categories = [];

    // 处理服务器返回的分类数据
    res.data.data.records.forEach((item) => {
      categories.push({
        label: item, // 假设返回的数据项中有label字段
        icon: 'app',
        badgeProps: {},
        items: [] // 根据需求填充items
      });
    });
    this.setData({
      categories: categories
    });
  },

  onGoHome() {
    wx.navigateTo({
      url: '../home/home.wxml'
    });
  },

  onBack() {
    wx.navigateBack({
      delta: 1 // Go back by one page in the navigation stack
    });
  },
  

  onScroll(e) {
    const {
      scrollTop
    } = e.detail;
    const threshold = 50; // 下一个标题与顶部的距离

    if (scrollTop < threshold) {
      this.setData({
        sideBarIndex: 0
      });
      return;
    }

    const index = this.offsetTopList.findIndex((top) => top > scrollTop && top - scrollTop <= threshold);

    if (index > -1) {
      this.setData({
        sideBarIndex: index
      });
    }
  },

  onBack() {
    wx.navigateBack();
  },
  onGoHome() {
    wx.reLaunch({
      url: '../home/home.wxml',
    });
  },
  onStepperChange(e){
    const { commodity } = e.currentTarget.dataset;
    const count = e.detail.value;
    console.log("stepperChange==>e==>",e);
    console.log("stepperChange==>",e.currentTarget.dataset);

    //购物车当前状态
    let shoppingCart = this.data.shoppingCart;
    const index = shoppingCart.findIndex(item => item.commodityId === commodity.commodityId);

    //购物车中已经存在
    if(index !== -1){
      if (count > 0) {
        shoppingCart[index].quantity = count; // 更新数量
      } else {
        shoppingCart.splice(index, 1); // 数量为 0，移除该商品
      }
    }else{
      // 如果商品不在购物车中，并且数量大于 0，则添加
    if (count > 0) {
      shoppingCart.push({
        ...commodity,
        quantity: count
      });
      this.setData({
        shoppingCart: shoppingCart
      });
      this.calculateTotalPrice();
    }
    }
  },
  handlePopup() {
    this.setData({
      visible: true,
    });
  },

  onVisibleChange(e) {
    this.setData({
      visible: e.detail.visible,
    });
  },

  calculateTotalPrice() {
    const shoppingCart = this.data.shoppingCart;
    let totalPrice = 0;

    shoppingCart.forEach(item => {
      totalPrice += item.commodityPrice * item.quantity;
    });

    this.setData({
      totalPrice: totalPrice.toFixed(2) // 保留两位小数
    });
  },

  //清空购物车
  clearCart() {
    this.setData({
      shoppingCart: [], 
      totalPrice: 0,    
    });
    console.log('Shopping cart cleared.');
  },


  //结账
  checkOut() {
    const shoppingCart = this.data.shoppingCart;
  
    if (shoppingCart.length === 0) {
      wx.showToast({
        title: '购物车为空',
        icon: 'none',
      });
      return;
    }
  
    wx.showModal({
      title: '确认结账',
      content: `总金额为：￥${this.data.totalPrice}，确认要结账吗？`,
      success: (res) => {
        if (res.confirm) {
          this.sendOrderDetail();
          console.log('Proceeding to checkout with items:', shoppingCart);
          this.clearCart();
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

  sendOrderDetail(){
    let orderToSend = [];
    this.data.shoppingCart.forEach(item=>{
      var obj = {
        commodityId: item.commodityId,
        quantity:item.quantity
      };
      orderToSend.push(obj);
    })
    wx.request({
      url: 'http://49.232.136.246:8090/wx/order/insertorder',
      method: 'post',
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