const defaultAvatarUrl = 'https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia07jQodd2FJGIYQfG0LAJGFxM4FbnQP6yfMxBgJ0F3YRqJCJ1aPAK2dQagdusBZg/0'

Page({
data:{
  pic:defaultAvatarUrl,
  

},
OnchooseAvatar:function(e){
  console.log(e.detail.avatarUrl);
  var pic=e.detail.avatarUrl
  this.setData({
    pic
  })
},


})