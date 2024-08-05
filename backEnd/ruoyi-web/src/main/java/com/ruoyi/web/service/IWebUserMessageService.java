package com.ruoyi.web.service;

import java.util.List;

import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.domain.WebUserMessage;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface IWebUserMessageService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param messageId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserMessage selectWebUserMessageByMessageId(Long messageId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserMessage 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUserMessage> selectWebUserMessageList(WebUserMessage webUserMessage);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserMessage 【请填写功能名称】
     * @return 结果
     */
    public int insertWebUserMessage(WebUserMessage webUserMessage);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserMessage 【请填写功能名称】
     * @return 结果
     */
    public int updateWebUserMessage(WebUserMessage webUserMessage);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param messageIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteWebUserMessageByMessageIds(Long[] messageIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param messageId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserMessageByMessageId(Long messageId);

    public int editPermission(WebUserMessage webUserMessage);

    public List<SysUserView> selectSysUserMessageByViewId();
}
