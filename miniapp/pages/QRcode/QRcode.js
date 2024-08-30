Page({
  data: {
    product: {
      imageUrl: 'https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333', // 示例图片路径
      productNumber: '123456789',
      productName: '高品质商品',
      location: '山东省青岛市崂山区小麦岛',
      time: '30',
      temperature: '20',
      originX: '',
      originY: '',
      manager: '张三'
    }
  },
  onLoad() {
    const scanResult = wx.getStorageSync('scanResult');
    // console.log(scanResult);
    wx.getStorage({
      key:'token',
      success: res => {
        let token = res.data;
        wx.request({
          url: `${scanResult}`,
          header:{token},
          success: res => {
            console.log(res.data.data.records)
            const record = res.data.data.records;
            if (record.length > 0) {
              const firstItem = record[0];
              this.setData({
                'product.productNumber': firstItem.commodityId || '',
                'product.productName': firstItem.commodityPartition || '',
                'product.location': firstItem.origin || '',
                'product.time': firstItem.weedingTime || '',
                'product.temperature': firstItem.temperature || '',
                'product.originX': firstItem.originX || '',
                'product.manager': firstItem.supervisor || '',
                'product.originY': firstItem.originY || ''
              })
            }

            wx.request({
              url: 'http://49.232.136.246:8090/wx/commodity/selectImgById',
              data: {
                commodityId: this.data.product.productNumber // 使用传递的 commodityId
                // commodityId:102900011006998
              },
              success: (res) => {

                this.setData({
                  'product.imageUrl': res.data.data
                })
              }
            })
          }
        })
      }
    })


  },

});