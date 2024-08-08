package com.ruoyi.wx.service.impl;

import com.github.pagehelper.PageHelper;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.wx.mappers.CommodityMapper;
import com.ruoyi.wx.pojo.entity.Commodity;
import com.ruoyi.wx.result.PageResult;
import com.ruoyi.wx.service.CommodityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
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
}
