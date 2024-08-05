package com.ruoyi.web.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.domain.WebUserMessage;
import com.ruoyi.web.mapper.WebUserMessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.service.IWebUserMessageService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@Service
public class WebUserMessageServiceImpl implements IWebUserMessageService 
{
    @Autowired
    private WebUserMessageMapper webUserMessageMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param messageId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public WebUserMessage selectWebUserMessageByMessageId(Long messageId)
    {
        return webUserMessageMapper.selectWebUserMessageByMessageId(messageId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserMessage 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<WebUserMessage> selectWebUserMessageList(WebUserMessage webUserMessage)
    {
        return webUserMessageMapper.selectWebUserMessageList(webUserMessage);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserMessage 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWebUserMessage(WebUserMessage webUserMessage)
    {
        webUserMessage.setCreateTime(DateUtils.getNowDate());
        webUserMessage.setUpdateTime(DateUtils.getNowDate());
        return webUserMessageMapper.insertWebUserMessage(webUserMessage);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserMessage 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWebUserMessage(WebUserMessage webUserMessage)
    {
        Boolean perm=webUserMessage.getPerm();
        if(perm!=null){
            if(perm){
                webUserMessage.setPermission(0L);
            }else {
                webUserMessage.setPermission(1L);
            }
        }
        webUserMessage.setUpdateTime(DateUtils.getNowDate());

        return webUserMessageMapper.updateWebUserMessage(webUserMessage);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param messageIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserMessageByMessageIds(Long[] messageIds)
    {
        return webUserMessageMapper.deleteWebUserMessageByMessageIds(messageIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param messageId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserMessageByMessageId(Long messageId)
    {
        return webUserMessageMapper.deleteWebUserMessageByMessageId(messageId);
    }

    @Override
    public int editPermission(WebUserMessage webUserMessage) {

            Boolean perm=webUserMessage.getPerm();
            if(perm!=null){
                if(perm){
                    webUserMessage.setPermission(0L);
                }else {
                    webUserMessage.setPermission(1L);
                }
            }
            return webUserMessageMapper.updateWebUserMessage(webUserMessage);
    }

    @Override
    public List<SysUserView> selectSysUserMessageByViewId() {
        return webUserMessageMapper.selectWebUserMessage();
    }
}
