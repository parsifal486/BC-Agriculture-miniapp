package com.sky.controller.user;


import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.CommodityService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.ResultType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;


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
    @GetMapping("/queryAllType")
    public Result<PageResult> queryAllType(){
        log.info("查询所有的种类");
//        PageResult pageResult = commodityService.queryAllType();
        List list=commodityService.queryAllType();
        PageResult pageResult=new PageResult();
        pageResult.setRecords(list);
        return Result.success(pageResult);
    }
    @GetMapping("/selectImgById")
    public Result selectImgById(@RequestParam String commodityId){
        String url=commodityService.getImgById(commodityId);
        return Result.success(url);
    }
}
