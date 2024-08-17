package com.sky.mapper;

import com.sky.pojo.entity.User;
import com.sky.pojo.entity.Coupons;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface WxUserMapper {
    @Update("update web_user_detail set love= #{res} where user_id = #{userId}")
    static void setLovelist(String res,Long userId) {
    }

    @Select("select * from web_user_detail where open_id = #{openId}")
    User queryUserByOpenId(String openId);

    //todo
    long insert(User webUserDetail);
    @Select("select user_id from web_user_detail where open_id =#{openId}")
    Long getUserIdByOpenId(String openId);


    //todo
    void update(User user);

    @Select("select * from web_user_detail where user_id=#{id}")
    User selectById(String id);

    @Select("select * from web_user_coupons where user_id=#{userId}")
    List<Coupons> selectCouponsById(Long userId);
}
