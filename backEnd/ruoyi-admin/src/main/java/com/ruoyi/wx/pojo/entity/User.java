package com.ruoyi.wx.pojo.entity;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Arrays;

/**
 * 【请填写功能名称】对象 web_user_detail
 *
 * @author ruoyi
 * @date 2024-01-31
 */
public class User extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long userId;
    private Long openId;

    public Long getOpenId() {
        return openId;
    }

    public void setOpenId(Long openId) {
        this.openId = openId;
    }

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

    private Boolean perm;

    private  String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getPerm() {
        return perm;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    private String[] loveList;


    public String[] getLoveList() {
        return loveList;
    }

    public void setLoveList(String[] loveList) {
        this.loveList = loveList;
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
        return "WebUserDetail{" +
                "userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", pwd='" + pwd + '\'' +
                ", profileImage='" + profileImage + '\'' +
                ", age='" + age + '\'' +
                ", love='" + love + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", permission=" + permission +
                ", perm=" + perm +
                ", address='" + address + '\'' +
                ", loveList=" + Arrays.toString(loveList) +
                '}';
    }
}
