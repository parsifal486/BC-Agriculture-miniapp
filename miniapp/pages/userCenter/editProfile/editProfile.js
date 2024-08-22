Page({
  data: {
    
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

})