package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.wx.mappers.UserMapper;
import com.ruoyi.wx.pojo.entity.User;
import com.ruoyi.wx.pojo.vo.UserVo;
import com.ruoyi.wx.properties.JwtProperties;
import com.ruoyi.wx.result.Result;
import com.ruoyi.wx.service.UserService;
import com.ruoyi.wx.service.WxUserService;

import com.ruoyi.wx.utils.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
    //微信小程序登录授权
    @PostMapping("/login/{code}")
    public Result login(@PathVariable String code){
        log.info("code值："+code);
        User login = wxUserService.login(code);
        Map<String,Object> claims = new HashMap<>();
        claims.put("userId",login.getUserId());


        String jwt = JwtUtil.createJWT(jwtProperties.getAdminSecretKey(), jwtProperties.getAdminTtl(), claims);
        UserVo userVo =new UserVo();
        userVo= (UserVo) login;
        userVo.setToken(jwt);
        return Result.success(userVo);
    }
    @PostMapping("/userInformation/{id}")
    public Result queryInformationById(@PathVariable String id){
        User user=userService.selectById(id);
        return Result.success(user);
    }
}
