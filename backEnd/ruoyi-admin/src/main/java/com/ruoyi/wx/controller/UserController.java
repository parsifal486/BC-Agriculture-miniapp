package com.ruoyi.wx.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.service.WxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;

@Controller
public class UserController {
    @Resource
    private WxUserService wxUserService;

    //微信小程序登录授权
    @GetMapping("/wx/user/login/{code}")
    public AjaxResult login(@PathVariable String code){

        return AjaxResult.success("操作成功",wxUserService.login(code));
    }


}
