package com.ruoyi.wx.mappers;

import com.ruoyi.wx.pojo.entity.Commodity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommodityMapper {

    @Select("select * from web_commodity_detail")
    List<Commodity> queryAll();
}
