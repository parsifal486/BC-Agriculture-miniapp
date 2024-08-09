package com.ruoyi.wx.mappers;

import com.ruoyi.wx.pojo.entity.Commodity;
import com.ruoyi.wx.result.PageResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommodityMapper {

    @Select("select * from web_commodity_detail")
    List<Commodity> queryAll();
    @Select("select * from web_commodity_detail where partition_name=#{partitionName}")
    List<Commodity> queryByType(String partitionName);
}
