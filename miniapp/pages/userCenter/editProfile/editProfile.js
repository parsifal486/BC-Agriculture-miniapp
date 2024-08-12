Page({
  data: {
    nickname: '你的昵称',
    showModal: false,
    newNickname: ''
  },

  // 显示修改昵称的弹出窗口
  showEditModal: function () {
    this.setData({
      showModal: true
    });
  },

  // 处理输入框内容
  onInput: function (e) {
    this.setData({
      newNickname: e.detail.value
    });
  },

  // 确认修改昵称
  onConfirm: function () {
    const { newNickname } = this.data;
    if (newNickname.trim()) {
      this.setData({
        nickname: newNickname,
        showModal: false,
        newNickname: '' // 清空输入框
      });
    } else {
      wx.showToast({
        title: '昵称不能为空',
        icon: 'none'
      });
    }
  },

  // 取消修改昵称
  onCancel: function () {
    this.setData({
      showModal: false,
      newNickname: '' // 清空输入框
    });
  }
});

// Component({
//   data: {
//     image: 'https://tdesign.gtimg.com/mobile/demos/avatar1.png',
//   },
// });
