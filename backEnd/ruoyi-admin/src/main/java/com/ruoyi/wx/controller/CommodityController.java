package com.ruoyi.wx.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.web.domain.WebUserDetail;

import com.ruoyi.wx.pojo.entity.Commodity;
import com.ruoyi.wx.result.PageResult;
import com.ruoyi.wx.result.Result;
import com.ruoyi.wx.service.CommodityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.page;
import static com.ruoyi.common.utils.PageUtils.startPage;

@Anonymous
@Slf4j
@RestController
@RequestMapping("/wx/commodity")
public class CommodityController {
    @Resource
    private CommodityService commodityService;
    @GetMapping("/queryAllCommodity")
    public Result<PageResult> queryAllCommondity(){
        log.info("商品分页查询");
        PageResult pageResult =commodityService.queryAll();
        return Result.success(pageResult);
    }
    @GetMapping("/queryCommodityByType")
    public Result<PageResult> queryCommodityByType(@RequestParam String partitionName){
        log.info("商品分类查询");

        PageResult pageResult=commodityService.queryCommodityByType(partitionName);
        return Result.success(pageResult);
    }
}
