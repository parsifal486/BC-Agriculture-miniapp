package com.sky.mapper;

import com.sky.pojo.entity.Commodity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommodityMapper {

    @Select("select * from web_commodity_detail")
    List<Commodity> queryAll();
    @Select("select * from web_commodity_detail where partition_name=#{partitionName}")
    List<Commodity> queryByType(String partitionName);
    @Select("select DISTINCT partition_name from web_commodity_detail ")
    List<String> queryAllType();
    @Select("select profile_image from  web_commodity_detail where commodity_id=#{commodityId}")
    String getImgById(String commodityId);
}
