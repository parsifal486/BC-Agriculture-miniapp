package com.ruoyi.wx.mappers;

import com.ruoyi.wx.info.WebUserDetail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WxUserMapper {

    WebUserDetail queryUserByOpenId(String openId);


    void insert(WebUserDetail webUserDetail);
}
