package com.ruoyi.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 web_user_detail
 * 
 * @author ruoyi
 * @date 2024-01-31
 */
public class WebUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long userId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String nickname;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String pwd;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String profileImage;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String age;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String love;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String sex;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String phone;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long permission;


    public WebUser() {
    }

    public WebUser(String nickname, String pwd) {
        this.nickname = nickname;
        this.pwd = pwd;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }
    public void setPwd(String pwd) 
    {
        this.pwd = pwd;
    }

    public String getPwd() 
    {
        return pwd;
    }
    public void setProfileImage(String profileImage) 
    {
        this.profileImage = profileImage;
    }

    public String getProfileImage() 
    {
        return profileImage;
    }
    public void setAge(String age) 
    {
        this.age = age;
    }

    public String getAge() 
    {
        return age;
    }
    public void setLove(String love) 
    {
        this.love = love;
    }

    public String getLove() 
    {
        return love;
    }
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
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
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("nickname", getNickname())
            .append("pwd", getPwd())
            .append("profileImage", getProfileImage())
            .append("age", getAge())
            .append("love", getLove())
            .append("sex", getSex())
            .append("phone", getPhone())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("permission", getPermission())
            .toString();
    }
}
