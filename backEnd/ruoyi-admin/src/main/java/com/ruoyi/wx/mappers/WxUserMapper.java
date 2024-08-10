package com.ruoyi.wx.mappers;

import com.ruoyi.wx.pojo.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface WxUserMapper {
    @Select("select * from web_user_detail where open_id = #{openId}")
    User queryUserByOpenId(String openId);
    @Insert("insert into web_user_detail (open_id,create_time,update_time)\n" +
            "        values   (#{openId},#{createTime},#{updateTime})")
    void insert(User webUserDetail);
    @Select("select user_id from web_user_detail where open_id =#{openId}")
    Long getUserIdByOpenId(String openId);
}
