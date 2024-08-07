package com.ruoyi.wx.service;

import com.ruoyi.wx.info.WebUserDetail;
import org.springframework.stereotype.Service;


public interface WxUserService {

    WebUserDetail login(String code);
}
