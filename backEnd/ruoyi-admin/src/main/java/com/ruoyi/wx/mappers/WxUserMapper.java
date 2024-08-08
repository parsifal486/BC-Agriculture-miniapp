package com.ruoyi.wx.mappers;

import com.ruoyi.wx.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WxUserMapper {

    User queryUserByOpenId(String openId);


    void insert(User webUserDetail);
}
