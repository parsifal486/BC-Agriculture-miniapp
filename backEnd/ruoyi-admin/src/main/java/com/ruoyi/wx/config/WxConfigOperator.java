package com.ruoyi.wx.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.WxMaConfig;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class WxConfigOperator {
    @Value("${wx.miniapp.configs.appid}")
    private String appId;
    @Value("${wx.miniapp.configs.secret}")
    private String secret;
    @Bean
    public WxMaService wxMaService(){

        WxMaDefaultConfigImpl wxMaConfig = new WxMaDefaultConfigImpl();
        wxMaConfig.setAppid(appId);
        wxMaConfig.setSecret(secret);
        WxMaService service=new WxMaServiceImpl();
        service.setWxMaConfig(wxMaConfig);
        return service;
    }
}
