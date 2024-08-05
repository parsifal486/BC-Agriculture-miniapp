package com.ruoyi.web.mapper;

import java.util.List;

import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.domain.WebUserMessage;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface WebUserMessageMapper 
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
     * 删除【请填写功能名称】
     * 
     * @param messageId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserMessageByMessageId(Long messageId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param messageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebUserMessageByMessageIds(Long[] messageIds);

    public List<SysUserView> selectWebUserMessage();
}
