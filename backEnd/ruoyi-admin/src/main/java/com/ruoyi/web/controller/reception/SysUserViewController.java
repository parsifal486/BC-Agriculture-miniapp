package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.mapper.SysUserViewMapper;
import com.ruoyi.web.service.ISysUserViewService;
import com.ruoyi.web.service.impl.WebCommodityDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2024-01-30
 */
@RestController
//@RequestMapping("/sys/view")
public class SysUserViewController extends BaseController
{
    @Autowired
    private SysUserViewMapper sysUserViewMapper;
    @Autowired
    private WebCommodityDetailServiceImpl webCommodityDetailService;

    @Autowired
    private ISysUserViewService sysUserViewService;

    /**
     * 查询【请填写功能名称】列表
     */
//    @PreAuthorize("@ss.hasPermi('system:view:list')")
    @GetMapping("/sys/view/list")
    public TableDataInfo list(SysUserView sysUserView)
    {
        startPage();
        List<SysUserView> list = sysUserViewService.selectSysUserViewList(sysUserView);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
//    @PreAuthorize("@ss.hasPermi('system:view:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/sys/view/export")
    public void export(HttpServletResponse response, SysUserView sysUserView)
    {
        List<SysUserView> list = sysUserViewService.selectSysUserViewList(sysUserView);
        ExcelUtil<SysUserView> util = new ExcelUtil<SysUserView>(SysUserView.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:view:query')")
    @GetMapping(value = "/sys/view/{viewId}")
    public AjaxResult getInfo(@PathVariable("viewId") Long viewId)
    {
        return success(sysUserViewService.selectSysUserViewByViewId(viewId));
    }



    /**
     * 新增【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:view:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/sys/view/add")
    public AjaxResult add(@RequestBody SysUserView sysUserView)
    {
        return toAjax(sysUserViewService.insertSysUserView(sysUserView));
    }

    /**
     * 修改【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:view:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/sys/view/edit")
    public AjaxResult edit(@RequestBody SysUserView sysUserView)
    {
        return toAjax(sysUserViewService.updateSysUserView(sysUserView));
    }

    /**
     * 删除【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:view:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/sys/view/{viewIds}")
    public AjaxResult remove(@PathVariable Long[] viewIds)
    {
        return toAjax(sysUserViewService.deleteSysUserViewByViewIds(viewIds));
    }


    /**
     * 修改【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/sys/view/editPermission")
    public AjaxResult editPermission(@RequestBody SysUserView sysUserView)
    {
        return toAjax(sysUserViewService.editPermission(sysUserView));
    }

//    @GetMapping("/sysView/popularList")
//    public AjaxResult getPopularList()
//    {
//        List<WebCommodityDetail> list = new ArrayList<>();
//        for (Long l:sysUserViewMapper.selectWebCommodityByLoveFlag())
//        {
//            list.add(webCommodityDetailService.selectWebCommodityDetailByCommodityId(l));
//        }
//        return AjaxResult.success(list);
//    }


    @PostMapping("/front/view/add")
    public AjaxResult frontAdd(@RequestParam("commodityId")Long commodityId,@RequestParam("userId") Long userId,@RequestParam("viewContext")String viewContext )
    {
        return toAjax(sysUserViewService.insertFrontView(commodityId,userId,viewContext));
    }



}
