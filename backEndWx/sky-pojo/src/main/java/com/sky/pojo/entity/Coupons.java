package com.sky.pojo.entity;

public class Coupons extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long couponsId;

    /** $column.columnComment */

    private String couponsName;


    /** 保质期 */

    private Long expirationTime;

    /** 标志 */

    private Long expirationFlag;


    private Long userId;

    private Long reductionFull;

    private Long reductionPrice;

    /** $column.columnComment */

    private Long permission;

    private Boolean perm;

    public Boolean getPerm() {
        return perm;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    public void setCouponsId(Long couponsId)
    {
        this.couponsId = couponsId;
    }

    public Long getCouponsId()
    {
        return couponsId;
    }
    public void setCouponsName(String couponsName)
    {
        this.couponsName = couponsName;
    }

    public String getCouponsName()
    {
        return couponsName;
    }

    public void setExpirationTime(Long expirationTime)
    {
        this.expirationTime = expirationTime;
    }

    public Long getExpirationTime()
    {
        return expirationTime;
    }
    public void setExpirationFlag(Long expirationFlag)
    {
        this.expirationFlag = expirationFlag;
    }

    public Long getExpirationFlag()
    {
        return expirationFlag;
    }
    public void setPermission(Long permission)
    {
        this.permission = permission;
    }

    public Long getPermission()
    {
        return permission;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getReductionFull() {
        return reductionFull;
    }

    public void setReductionFull(Long reductionFull) {
        this.reductionFull = reductionFull;
    }

    public Long getReductionPrice() {
        return reductionPrice;
    }

    public void setReductionPrice(Long reductionPrice) {
        this.reductionPrice = reductionPrice;
    }

    @Override
    public String toString() {
        return "WebUserCoupons{" +
                "couponsId=" + couponsId +
                ", couponsName='" + couponsName + '\'' +
                ", expirationTime=" + expirationTime +
                ", expirationFlag=" + expirationFlag +
                ", userId=" + userId +
                ", reductionFull=" + reductionFull +
                ", reductionPrice=" + reductionPrice +
                ", permission=" + permission +
                ", perm=" + perm +
                '}';
    }
}
