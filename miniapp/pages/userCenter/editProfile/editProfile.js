import {nickName,pic as avatar} from "../user.js";
const defaultAvatarUrl = 'https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia07jQodd2FJGIYQfG0LAJGFxM4FbnQP6yfMxBgJ0F3YRqJCJ1aPAK2dQagdusBZg/0'

Page({
data:{
  pic:defaultAvatarUrl,
  address:"",
  telephoneNumber:"189",
  userId:"",
  preference:[],
  isOpen:false,
  huaye:false,
  lajiao:false,
  shuisheng:false,
  huacai:false,
  jun:false,
  qie:false,
},

OnchooseAvatar:function(e){
  console.log(e.detail.avatarUrl);
  var pic=e.detail.avatarUrl
  this.setData({
    pic
  })
},
onLoad(options){
  this.running();
},
running(){
  wx.request({
    url:'http://49.232.136.246:8090/wx/user/userInformation/200008',
    method:'get',
    success: (res) => {
      console.log(avatar);
      this.setData({
        address:res.data.data.address,
        telephoneNumber:res.data.data.phone,
        userId:res.data.data.userId,
        preference:res.data.data.love.split(","),
      })
    } 
  })
},
changelove(){
  console.log(this.data.preference);
  this.setData({
    isOpen: true,
    huaye:this.data.preference.includes("花叶类"),
    lajiao:this.data.preference.includes("辣椒类"),
    shuisheng:this.data.preference.includes("水生根茎类"),
    huacai:this.data.preference.includes("花菜类"),
    jun:this.data.preference.includes("食用菌"),
    qie:this.data.preference.includes("茄类"),
  })
},
ok(){
  this.setData({
    isOpen: false,
  })
},

changevegetable(e){
  if (this.data.preference.indexOf(e.currentTarget.dataset.kind) == -1){
    this.data.preference.push(e.currentTarget.dataset.kind);
  }else{
    this.data.preference.splice(this.data.preference.indexOf(e.currentTarget.dataset.kind),1);
  };
  console.log(this.data.preference);
  this.setData({
  huaye:this.data.preference.includes("花叶类"),
  lajiao:this.data.preference.includes("辣椒类"),
  shuisheng:this.data.preference.includes("水生根茎类"),
  huacai:this.data.preference.includes("花菜类"),
  jun:this.data.preference.includes("食用菌"),
  qie:this.data.preference.includes("茄类"),
  })
},

onBack() {
  wx.reLaunch({
    url: 'pages/menu/menu',
  });
},
onGoHome() {
  wx.reLaunch({
    url: '/pages/home/home',
  });
},

})