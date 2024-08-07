package com.ruoyi.wx.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;

import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.wx.info.WebUserDetail;
import com.ruoyi.wx.mappers.WxUserMapper;
import com.ruoyi.wx.service.WxUserService;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WxUserServiceImpl implements WxUserService {
    @Resource
    private WxMaService wxMaService;
    @Resource
    public WxUserMapper wxUserMapper;
    //登录接口
    @Override
    public WebUserDetail login(String code) {
        String openId=null;

        //产生oenid

        try {
            WxMaJscode2SessionResult sessionInfo = wxMaService.getUserService().getSessionInfo(code);
            openId=sessionInfo.getOpenid();
        } catch (WxErrorException e) {
            throw new RuntimeException(e);
        }
        //根据用户openid查信息

        WebUserDetail webUserDetail=wxUserMapper.queryUserByOpenId(openId);

        //判断是否
        //是 添加信息 返回id
        if(webUserDetail==null){
            webUserDetail.setCreateTime(DateUtils.getNowDate());
            webUserDetail.setUpdateTime(DateUtils.getNowDate());
            wxUserMapper.insert(webUserDetail);
        }
        return webUserDetail;
    }
}
