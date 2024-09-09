Component({
  // todo: 此处需要添加 根据个人信息数目 在我的 项目上显示未读消息数目的功能
  data: {
    value: 0,
    list: [{
        value: "0",
        label: '首页',
        icon: 'broccoli',
        path: "pages/home/home"
      },
      {
        value: "1",
        label: '菜单',
        icon: 'map-edit',
        path: "pages/menu/menu"
      },
      {
        value: "2",
        label: '用户',
        icon: 'user',
        path: "pages/userCenter/user"
      }
    ]
  },
  // lifetimes:{
  //   ready(){
  //     const pages = getCurrentPages();
  //     const curPage = pages[pages.length - 1];
  //     console.log("curP:",curPage);
  //     if (curPage) {
  //       const nameRe = /pages\/(\w+)\/(\w+)/.exec(curPage.route);
  //       console.log("=============================>nameRe",nameRe)
  //       if (nameRe[2]) {         
  //         this.setData({
  //           value: 0
  //         })
  //       }
  //     }
  //   }
  // },



  methods: {
    // handleChange(e) {

    //   console.log("bindchange:e ",e);
    //   const pageIndex = e.detail.value;
    //   const pagePath = this.data.list[pageIndex].path;
    //   console.log("pagePath",pagePath);

    //   const pathRe = /pages\/(\w+)\/(\w+)/.exec(pagePath);
    //   const curPage = pathRe[2];
    //   console.log("curPage:",curPage);
    //   console.log("andleChange(e)",pageIndex);
    //   this.setData({ value: pageIndex });
    //   wx.switchTab({
    //     url: "/"+pagePath
    //   })
    // },

    // myInit(value) {
    //   console.log("page value==>",value)
    //   this.setData({
    //  　  value: value
    //   });
    //  }

    onChange(e) {
      console.log("bindchange:e ",e);
      const pageIndex = e.detail.value;
      const pagePath = this.data.list[pageIndex].path;
      this.setData({
        value: e.detail.value
      });
      wx.switchTab({
        url: "/" + pagePath
      })
    },
    init() {
      const page = getCurrentPages().pop();
      console.log("当前页面路径:", page.route); // 打印当前页面路径
      const pageIndex = this.data.list.findIndex(item => item.path === `/${page.route}`);
      console.log("匹配到的索引值:", pageIndex); // 打印匹配到的索引
      this.setData({
        value: pageIndex !== -1 ? pageIndex : 0 // 如果找不到匹配的页面路径，默认为第一个页面
      });
    }
  },
});