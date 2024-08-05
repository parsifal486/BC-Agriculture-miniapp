package com.ruoyi.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 web_user_message
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public class WebUserMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long messageId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long userId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long chatFlag;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String chatName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String chatContext;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long permission;

    private Boolean perm;

    private  String title;

    private String url;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Boolean getPerm() {
        return perm;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    public void setMessageId(Long messageId)
    {
        this.messageId = messageId;
    }

    public Long getMessageId() 
    {
        return messageId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setChatFlag(Long chatFlag) 
    {
        this.chatFlag = chatFlag;
    }

    public Long getChatFlag() 
    {
        return chatFlag;
    }
    public void setChatName(String chatName) 
    {
        this.chatName = chatName;
    }

    public String getChatName() 
    {
        return chatName;
    }
    public void setChatContext(String chatContext) 
    {
        this.chatContext = chatContext;
    }

    public String getChatContext() 
    {
        return chatContext;
    }
    public void setPermission(Long permission) 
    {
        this.permission = permission;
    }

    public Long getPermission() 
    {
        return permission;
    }

    @Override
    public String toString() {
        return "WebUserMessage{" +
                "messageId=" + messageId +
                ", userId=" + userId +
                ", chatFlag=" + chatFlag +
                ", chatName='" + chatName + '\'' +
                ", chatContext='" + chatContext + '\'' +
                ", permission=" + permission +
                ", perm=" + perm +
                ", title='" + title + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
