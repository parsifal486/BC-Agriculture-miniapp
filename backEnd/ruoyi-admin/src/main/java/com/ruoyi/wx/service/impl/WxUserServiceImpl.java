package com.ruoyi.wx.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;

import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.wx.pojo.entity.User;
import com.ruoyi.wx.mappers.WxUserMapper;
import com.ruoyi.wx.service.WxUserService;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@Slf4j
public class WxUserServiceImpl implements WxUserService {
    @Resource
    private WxMaService wxMaService;
    @Resource
    public WxUserMapper wxUserMapper;
    //登录接口
    @Override
    public User login(String code) {
        String openId=null;

        //产生oenid
        System.out.println("________________________________openid生成中_____________________________________");
        try {
            WxMaJscode2SessionResult sessionInfo = wxMaService.getUserService().getSessionInfo(code);
            openId=sessionInfo.getOpenid();
        } catch (WxErrorException e) {
            throw new RuntimeException(e);
        }
        //根据用户openid查信息
        System.out.println("________________________________openid:  "+openId+"_____________________________________");


        User webUserDetail= wxUserMapper.queryUserByOpenId(openId);

        //判断是否
        //是 添加信息 返回id
        if(webUserDetail==null){
            User user = new User();
            user.setOpenId(openId);
            user.setCreateTime(DateUtils.getNowDate());
            user.setUpdateTime(DateUtils.getNowDate());
            wxUserMapper.insert(user);
            user.setUserId(wxUserMapper.getUserIdByOpenId(openId));
            return user;
        }
            return webUserDetail;


    }
}
