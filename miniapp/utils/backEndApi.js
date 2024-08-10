
import { backendUrl } from "../config";
import { getRequest } from "./wxRequest";

async function userLogin(){
  const wx_code = (await wx.login()).code;
  console.log("wx_code:",wx_code);
  const url = backendUrl + "/user/login";
  getRequest(url,{code:wx_code}).then(res=>
    console.log(res)); 
}

module.exports = {
  userLogin
}