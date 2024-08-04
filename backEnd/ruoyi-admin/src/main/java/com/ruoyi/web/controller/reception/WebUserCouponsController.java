package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.domain.WebUserCoupons;
import com.ruoyi.web.service.IWebUserCouponsService;
import com.ruoyi.web.service.impl.WebUserCouponsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@RestController
//@RequestMapping("/web/coupons")
public class WebUserCouponsController extends BaseController
{
    @Autowired
    private WebUserCouponsServiceImpl webUserCouponsService;

    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:coupons:list')")
    @GetMapping("/web/coupons/list")
    public TableDataInfo list(WebUserCoupons webUserCoupons)
    {
        startPage();
        List<WebUserCoupons> list = webUserCouponsService.selectWebUserCouponsList(webUserCoupons);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:coupons:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/web/coupons/export")
    public void export(HttpServletResponse response, WebUserCoupons webUserCoupons)
    {
        List<WebUserCoupons> list = webUserCouponsService.selectWebUserCouponsList(webUserCoupons);
        ExcelUtil<WebUserCoupons> util = new ExcelUtil<WebUserCoupons>(WebUserCoupons.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:coupons:query')")
    @GetMapping(value = "/web/coupons/{couponsId}")
    public AjaxResult getInfo(@PathVariable("couponsId") Long couponsId)
    {
        return success(webUserCouponsService.selectWebUserCouponsByCouponsId(couponsId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:coupons:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/web/coupons")
    public AjaxResult add(@RequestBody WebUserCoupons webUserCoupons)
    {
        return toAjax(webUserCouponsService.insertWebUserCoupons(webUserCoupons));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:coupons:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/coupons")
    public AjaxResult edit(@RequestBody WebUserCoupons webUserCoupons)
    {
        return toAjax(webUserCouponsService.updateWebUserCoupons(webUserCoupons));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:coupons:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/web/coupons/{couponsIds}")
    public AjaxResult remove(@PathVariable Long[] couponsIds)
    {
        return toAjax(webUserCouponsService.deleteWebUserCouponsByCouponsIds(couponsIds));
    }

    /**
     * 修改【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/coupons/editPermission")
    public AjaxResult editPermission(@RequestBody WebUserCoupons webUserCoupons)
    {
        return toAjax(webUserCouponsService.editPermission(webUserCoupons));
    }

    @RequestMapping("/web/coupons/getMyCoupons")
    public List<WebUserCoupons> selectByUid()
    {
        return webUserCouponsService.selectByUid();
    }

    @RequestMapping("front/personInfo/couponDetail")
    public  AjaxResult getCouponDetail(@RequestParam("userId") String userId){
//        WebUser webUser=(WebUser) session.getAttribute("user");
        WebUserCoupons webUserCoupons=new WebUserCoupons();
        webUserCoupons.setUserId(Long.valueOf(userId));
        return AjaxResult.success(webUserCouponsService.selectWebUserCouponsList(webUserCoupons));
    }

}
