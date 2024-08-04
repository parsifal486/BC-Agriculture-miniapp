package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.domain.WebUserMessage;
import com.ruoyi.web.service.IWebUserMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
//@RequestMapping("/web/message")
public class WebUserMessageController extends BaseController
{
    @Autowired
    private IWebUserMessageService webUserMessageService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/web/message/list")
    public TableDataInfo list(WebUserMessage webUserMessage)
    {
        startPage();
        List<WebUserMessage> list = webUserMessageService.selectWebUserMessageList(webUserMessage);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:message:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/web/message/export")
    public void export(HttpServletResponse response, WebUserMessage webUserMessage)
    {
        List<WebUserMessage> list = webUserMessageService.selectWebUserMessageList(webUserMessage);
        ExcelUtil<WebUserMessage> util = new ExcelUtil<WebUserMessage>(WebUserMessage.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:message:query')")
    @GetMapping(value = "/web/message/{messageId}")
    public AjaxResult getInfo(@PathVariable("messageId") Long messageId)
    {
        return success(webUserMessageService.selectWebUserMessageByMessageId(messageId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:message:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/web/message")
    public AjaxResult add(@RequestBody WebUserMessage webUserMessage)
    {
        return toAjax(webUserMessageService.insertWebUserMessage(webUserMessage));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:message:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/message")
    public AjaxResult edit(@RequestBody WebUserMessage webUserMessage)
    {
        return toAjax(webUserMessageService.updateWebUserMessage(webUserMessage));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:message:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/web/message/{messageIds}")
    public AjaxResult remove(@PathVariable Long[] messageIds)
    {
        return toAjax(webUserMessageService.deleteWebUserMessageByMessageIds(messageIds));
    }



    @PutMapping("/web/message/editPermission")
    public AjaxResult editPermission(@RequestBody WebUserMessage webUserMessage)
    {
        return toAjax(webUserMessageService.editPermission(webUserMessage));
    }

    @GetMapping("/front/message/list")
    public AjaxResult list()
    {

        List<SysUserView> list = webUserMessageService.selectSysUserMessageByViewId();
        return  AjaxResult.success(list);
    }
}
