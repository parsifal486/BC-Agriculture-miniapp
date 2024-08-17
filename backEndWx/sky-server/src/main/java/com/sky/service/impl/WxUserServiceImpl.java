package com.sky.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import com.sky.mapper.WxUserMapper;
import com.sky.pojo.entity.User;
import com.sky.result.PageResult;
import com.sky.service.WxUserService;
import com.sky.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
        String openId = null;

        //产生oenid
        try {
            WxMaJscode2SessionResult sessionInfo = wxMaService.getUserService().getSessionInfo(code);
            openId = sessionInfo.getOpenid();
        } catch (WxErrorException e) {
            throw new RuntimeException(e);
        }
        //根据用户openid查信息
        User webUserDetail = wxUserMapper.queryUserByOpenId(openId);

        //判断是否
        //是 添加信息 返回id
        if (webUserDetail == null) {
            User user = new User();
            user.setOpenId(openId);
            user.setCreateTime(DateUtils.getNowDate());
            user.setUpdateTime(DateUtils.getNowDate());
            user.setUserId(wxUserMapper.insert(user));

            return user;
        }
        return webUserDetail;


    }

    @Override
    public void setLovelist(String[] loveList, Long userId) {
        if (loveList != null) {
            String res = "";
            for (int i = 0; i < loveList.length; i++) {
                res += loveList[i];
                for (int j = 0; j < loveList.length - 1; j++) {
                    res += ",";
                }
            }
            WxUserMapper.setLovelist(res, userId);
        }
    }
    @Override
    public User selectById(String id) {
        User user = new User();
        user=wxUserMapper.selectById(id);
        return user;
    }
    @Override
    public void update(User user) {
        wxUserMapper.update(user);
    }
    @Override
    public PageResult selectCouponsById(Long userId) {
        PageResult pageResult = new PageResult();
        pageResult.setRecords(wxUserMapper.selectCouponsById(userId));


        return pageResult;
    }


}
