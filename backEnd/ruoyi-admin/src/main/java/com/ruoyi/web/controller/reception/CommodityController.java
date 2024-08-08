package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.wx.pojo.entity.Commodity;
import com.ruoyi.wx.result.PageResult;
import com.ruoyi.wx.result.Result;
import com.ruoyi.wx.service.CommodityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
