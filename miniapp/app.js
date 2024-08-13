import {getCacheItem, setCacheItem} from "./utils/cache";
import {userLogin} from "./utils/backEndApi";
App(
  {
    onLaunch:function(){
      
    //检查缓存中是否存在了用户,不存在则获取用户信息
    // var user = getCacheItem("userInfo");
    // console.log("user statu", user)
    // if(user === undefined){
    //   userLogin();
    //   setCacheItem("isMarkReload", true, 24)
    // }
    //检查是否存在用户id，存在就直接渲染
    
      //获取用户基本信息
      wx.getUserProfile({
        desc: '获取用户信息',
        success:res=>{
          console.log(res);
          this.setData({
            nickName:res.userInfo.nickName,
            avatar:res.userInfo.avatarUrl
          })
        }
      })
      
      //微信登录功能
      wx.login({
      //获取凭证
      success: (res) => {
        console.log("code: ",res.code);
        //传给后台
        wx.request({
          url: `http://49.232.136.246:8080/wx/user/login/${res.code}`,
          success:res2=>{
            console.log(res2.data.data);
            //存储到本地
            // wx.setStorageSync('userId',res2.data.data.userId);
            //请求登录接口

          }

        })
      },
    })
    //插入到数据库当中
    }
  }
)