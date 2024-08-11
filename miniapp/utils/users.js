module.exports = {  getUser}




// 获取当前用户
// 如果数据库中没有会后台自动新建并返回
async function getUser() {
  const key = "userInfo";

  const wx_code = (await wx.login()).code;
  console.log("wx_code", wx_code);
  let userRes = (await api.userOp({
    op: 'get',
    wx_code: wx_code,
    // Admin-Token: "2a5c2c43-97b1-4bb6-ba9e-303afaba0ade"
  })).result;

  console.log(userRes);
  if (userRes && userRes.userInfo) {
    userRes.userInfo.avatar = await cloud.signCosUrl(userRes.userInfo.avatar);
  }

  setCacheItem(key, userRes, 0, randomInt(25, 35))
  return userRes;
}

