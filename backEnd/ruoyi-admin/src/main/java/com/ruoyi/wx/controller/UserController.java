package com.ruoyi.wx.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.wx.pojo.entity.User;
import com.ruoyi.wx.pojo.vo.UserVo;
import com.ruoyi.wx.properties.JwtProperties;
import com.ruoyi.wx.result.Result;
import com.ruoyi.wx.service.WxCommonService;
import com.ruoyi.wx.service.UserService;
import com.ruoyi.wx.service.WxUserService;

import com.ruoyi.wx.utils.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Anonymous
@RestController
@Slf4j
@RequestMapping("/wx/user")
public class UserController {
    @Resource
    private JwtProperties jwtProperties;
    @Resource
    private WxUserService wxUserService;
    @Resource
    private UserService userService;
    @Resource
    private WxCommonService common;
    //微信小程序登录授权
    @GetMapping("/login/{code}")
    public Result login(@PathVariable String code){
        System.out.println("_________________________________"+code+"________________________________________");
        UserVo userVo =new UserVo();
        User user = wxUserService.login(code);
        //获取token
        Map<String,Object> claims = new HashMap<>();
        claims.put("userId",user.getUserId());
        String jwt = JwtUtil.createJWT(jwtProperties.getAdminSecretKey(), jwtProperties.getAdminTtl(), claims);
        System.out.println("_______________________________jwt:"+jwt+"_________________________________________");
        //读取照片
        userVo.setResponseEntity(common.getImageBytesById(user.getUserId()));
        //设置UserVo的值返回给前端
        userVo.setToken(jwt);
        userVo.setAddress(user.getAddress());
        userVo.setUserId(user.getUserId());
        userVo.setOpenId(user.getOpenId());
        userVo.setNickname(user.getNickname());
        userVo.setPwd(user.getPwd());
        userVo.setAge(user.getAge());
        userVo.setLove(user.getLove());
        userVo.setSex(user.getSex());
        userVo.setPhone(user.getPhone());
        userVo.setPermission(user.getPermission());
        userVo.setLoveList(user.getLoveList());
        return Result.success(userVo);
    }
    @GetMapping("/userInformation/{id}")
    public Result queryInformationById(@PathVariable String id){
        User user=userService.selectById(id);

        return Result.success(user);
    }

}
