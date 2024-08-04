package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
//import com.ruoyi.web.controller.cliebt.AgricultureClient;
import com.ruoyi.web.domain.WebCommodityDetail;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.web.service.IWebUserDetailService;
import com.ruoyi.web.service.impl.WebCommodityDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2024-01-30
 */
@RestController
//@RequestMapping("/web/userDetail")
public class WebUserDetailController extends BaseController
{
    @Autowired
    private IWebUserDetailService webUserDetailService;

//    @Autowired
//    private AgricultureClient agricultureClient;

    @Autowired
    private WebCommodityDetailServiceImpl webCommodityDetailService;

    /**
     * 查询【请填写功能名称】列表
     */
////    @PreAuthorize("@ss.hasPermi('system:detail:list')")
//    @GetMapping("/list")
//    public int list(WebUserDetail webUserDetail)
//    {
//        BigInteger id = new BigInteger("102900005115762");
//        Tuple7<BigInteger, String, String, BigInteger, String, BigInteger, String> set = null;
//        try {
//            set = agricultureClient.queryCommodity(id);
//        } catch (ContractException e) {
//            throw new RuntimeException(e);
//        }
//        System.out.println("商品id: " + set.getValue1());
//        System.out.println("商品名称: " + set.getValue2());+
//        System.out.println("商品产地: " + set.getValue3());
//        System.out.println("保存温度: " + set.getValue4());
//        System.out.println("种植方法: " + set.getValue5());
//        System.out.println("保存时间: " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(set.getValue6().longValue())));
//        System.out.println("负责人: " + set.getValue7());
//        System.out.println("发布成功！");
//        return 1;
//    }



    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:detail:list')")
    @GetMapping("/web/userDetail/list")
    public TableDataInfo list(WebUserDetail webUserDetail)
    {
        startPage();
        List<WebUserDetail> list = webUserDetailService.selectWebUserDetailList(webUserDetail);
        return getDataTable(list);
    }



    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:detail:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/web/userDetail/export")
    public void export(HttpServletResponse response, WebUserDetail webUserDetail)
    {
        List<WebUserDetail> list = webUserDetailService.selectWebUserDetailList(webUserDetail);
        ExcelUtil<WebUserDetail> util = new ExcelUtil<WebUserDetail>(WebUserDetail.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:query')")
    @GetMapping(value = "/web/userDetail/{userId}")
    public List<WebCommodityDetail> getInfo(@PathVariable("userId") Long userId)
    {
        WebUserDetail webUserDetail =webUserDetailService.selectWebUserDetailByUserId(userId);
        String[] dataLove=webUserDetail.getLove().split(",");
        List<WebCommodityDetail> list=new ArrayList<>();
        for(String love:dataLove)
        {
            for(WebCommodityDetail webCommodityDetail:webCommodityDetailService.selectWebCommodityDetailByPartitionName(love))
            {
                list.add(webCommodityDetail);
            }
        }
        return list;
    }

    /**
     * 新增【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:detail:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/web/userDetail/addUser")
    public AjaxResult add(@RequestBody WebUserDetail webUserDetail)
    {
        return toAjax(webUserDetailService.insertWebUserDetail(webUserDetail));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @RequestMapping("/web/userDetail/updateUser")
    public AjaxResult edit(@RequestBody WebUserDetail webUserDetail)
    {
        return toAjax(webUserDetailService.updateWebUserDetail(webUserDetail));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:detail:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/web/userDetail/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(webUserDetailService.deleteWebUserDetailByUserIds(userIds));
    }


    /**
     * 前端更改用户信息【请填写功能名称】
     */
    @RequestMapping("front/personInfo/changeUserInfo")
    public AjaxResult editInfo(@RequestBody WebUserDetail webUserDetail)
    {
        return toAjax(webUserDetailService.updateWebUserDetail(webUserDetail));
    }

}
