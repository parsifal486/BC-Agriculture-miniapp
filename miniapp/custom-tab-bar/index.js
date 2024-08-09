Component({
  // todo: 此处需要添加 根据个人信息数目 在我的 项目上显示未读消息数目的功能
  data: {
    value:"home",
    list: [
      { value:"home", label: '首页', icon: 'broccoli', path:"pages/home/home", props: {} },
      { value:"menu", label: '菜单', icon: 'map-edit', path:"pages/menu/menu", props: {} },
      { value:"user", label: '用户', icon: 'user', path:"pages/userCenter/user", props:{count: '2'} }
    ]
  },
  lifetimes:{
    ready(){
      const pages = getCurrentPages();
      const curPage = pages[pages.length - 1];
      console.log("curP:",curPage);
      if (curPage) {
        const nameRe = /pages\/(\w+)\/(\w+)/.exec(curPage.route);
        if (nameRe[2]) {
          this.setData({
            value: nameRe[2]
          })
        }
      }
    }
  },
  
  methods: {
    handleChange(e) {

      console.log("bindchange:e ",e);
      const pageIndex = e.detail.value;
      const pagePath = this.data.list[pageIndex].path;
      console.log("pagePath",pagePath);

      const pathRe = /pages\/(\w+)\/(\w+)/.exec(pagePath);
      const curPage = pathRe[2];
      console.log("curPage:",curPage);
      this.setData({ value: curPage });
      wx.switchTab({
        url: "/"+pagePath
      })
    }
  }
});
