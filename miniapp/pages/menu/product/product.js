

Page({
  data: {
      products: [
          { price: 10.2 }
      ],
      cart: [],
      totalPrice: 0,
      total:0

  },
  addToCart(event) {
      const productId = event.currentTarget.dataset.id;
      const product = this.data.products.find(item => item.id === productId);
      if (product) {
          this.setData({
              cart: [...this.data.cart, product],
              
              total:this.data.total+1
          });
      }
  },
  removeFromCart(event) {
      const productId = event.currentTarget.dataset.id;
      const product = this.data.cart.find(item => item.id === productId);
      if (product) {
          this.setData({
              total:this.data.total-1,
              
          });
      }
     
  }
});
