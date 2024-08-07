Component({
  // todo: 此处需要添加 根据个人信息数目 在我的 项目上显示未读消息数目的功能
  data: {
    value:"home",
    list: [
      { id:1, value:"home", label: '首页', icon: 'broccoli', path:"pages/home/home", props: {} },
      { id:2, value:"menu", label: '菜单', icon: 'map-edit', path:"pages/menu/menu", props: {} },
      { id:3, value:"user", label: '用户', icon: 'user', path:"pages/userCenter/user", props:{count: '2'} }
    ]
  },
  methods: {
    onTabItemTap(e) {
      if(this.data.value != e.currentTarget.dataset.value){
        this.setData({
          value: e.currentTarget.dataset.value,
        });
        const path = e.currentTarget.dataset.path;
        wx.switchTab({ url: `/${path}` });
      }
    }
  }
});
