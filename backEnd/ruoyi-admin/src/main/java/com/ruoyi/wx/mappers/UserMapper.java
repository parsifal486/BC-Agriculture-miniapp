package com.ruoyi.wx.mappers;

import com.ruoyi.wx.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    @Select("select * from web_user_detail where user_id=#{id}")
    User selectById(String id);
}
