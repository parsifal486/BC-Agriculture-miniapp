package com.sky.controller.user;


import com.sky.pojo.entity.User;
import com.sky.pojo.vo.UserVo;
import com.sky.properties.JwtProperties;
import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.WxCommonService;
import com.sky.service.WxUserService;
import com.sky.utils.JwtUtil;
import com.sky.utils.ThreadLocalUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@Slf4j
@RequestMapping("/wx/user")
public class WxUserController {
    @Resource
    private JwtProperties jwtProperties;
    @Resource
    private WxUserService wxUserService;

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
        User user= wxUserService.selectById(id);
        return Result.success(user);
    }

    //头像修改

    //昵称修改
    //地址修改
    //手机号修改
    @GetMapping("/update")
    public Result update(User user){
        wxUserService.update(user);
        return Result.success();
    }
    //个人偏好修改
    @PostMapping("/updateLovelist")
    public Result updateLovelist(String[] loveList){

        Long userId= ThreadLocalUtils.getCurrentId();
        wxUserService.setLovelist(loveList,userId);

        return Result.success();
    }



    //根据userid查询用户的优惠券
    @GetMapping("/selectCouponsById")
        public Result<PageResult> selectCouponsById(@RequestParam Long userId){
        PageResult pageResult=wxUserService.selectCouponsById(userId);


        return Result.success(pageResult);
        }



}
