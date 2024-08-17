package com.sky.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CommonMapper {
    @Update("update web_user_details set profile_image = #{fileAddress} where user_id = #{currentId}")
    void uploadAdressById(Long currentId, String fileAddress) ;
    @Select("select profile_image from web_user_detail where user_id=#{id}")
    String getAddressById(Long id);
}
