Page({
  data: {
    address: "",
    phone: "",
    love:"",
    isFormValid: true,  // 表单校验状态
  },

  onLoad(){
    wx.getStorage({
      key: "userInfo",
      success: res=>{
        this.setData({
          address: res.data.address,
          phone:res.data.phone,
          love:res.data.love,  
        })
      },
    })
  },

  handleBack() {
    // 使用 wx.navigateBack 返回到上一个页面
    wx.redirectTo({
      url: '/pages/userCenter/user'
    });
  },

  onInputChange(e) {
    const field = e.currentTarget.dataset.field;
    console.log("onInputChange==>",field,"===>",e.detail.value);
    this.setData({
      [field]: e.detail.value
    }, this.validateForm);
  },

  validateForm() {
    const { address, phone, love } = this.data;
    const isPhoneValid = /^1[3-9]\d{9}$/.test(phone);
    const isFormValid = address.trim() !== "" && isPhoneValid && love.trim() !== "";
    this.setData({ isFormValid });
  },

  submitChanges() {
    if (this.data.isFormValid) {
      const { address, phone, love } = this.data;
      wx.getStorage({
        key:"token",
        success:res=>{
          wx.request({
            url: 'http://49.232.136.246:8090/wx/user/update', 
            method: 'GET',
            data: {
              address,
              phone
            },
            header: {
              'token':res.data
            },
            success: (res) => {
              if (res.statusCode === 200 && res.data.success) {
                wx.showToast({
                  title: '修改成功',
                  icon: 'success',
                  duration: 2000,
                  success: () => {
                    wx.setStorage({
                      key: "userInfo",
                      data: { address, phone, love },
                      success: () => {
                        wx.redirectTo({
                          url: '/pages/userCenter/user'
                        });
                      }
                    });
                  }
                });
              } else {
                wx.showToast({
                  title: '提交失败，请重试',
                  icon: 'none',
                  duration: 2000
                });
              }
            },
            fail: () => {
              wx.showToast({
                title: '网络错误，请稍后再试',
                icon: 'none',
                duration: 2000
              });
            }
          });
        }
      })
    }
  },

  preferToast(e){
    wx.showToast({
      title: '此项暂时不可编辑,系统根据购买习惯自动生成',
      icon: 'none',
      duration: 2000
    });
  }
})