package com.sky.service.impl;


import com.sky.mapper.CommodityMapper;
import com.sky.pojo.entity.Commodity;
import com.sky.result.PageResult;
import com.sky.service.CommodityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommodityServiceImpl implements CommodityService {
    @Resource
    private CommodityMapper commodityMapper;


    @Override
    public PageResult queryAll() {
        PageResult pageResult = new PageResult();
        pageResult.setRecords(commodityMapper.queryAll());
        return pageResult;
    }

    @Override
    public PageResult queryCommodityByType(String partitionName) {
        PageResult pageResult = new PageResult();
        pageResult.setRecords(commodityMapper.queryByType(partitionName));

        return pageResult;
    }

    @Override
    public List queryAllType() {
//        List<Commodity> commodities = commodityMapper.queryAllType();
//        PageResult pageResult = new PageResult();
//        pageResult.setRecords(commodities);
        List<String> objects = commodityMapper.queryAllType();
        return objects;
    }

    @Override
    public String getImgById(String commodityId) {
        String Url=commodityMapper.getImgById(commodityId);
        return Url;
    }
}
