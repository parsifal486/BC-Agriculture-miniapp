package com.sky.pojo.entity;

public class SysUserView extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long viewId;

    /** $column.columnComment */

    private Long commodityId;

    /** $column.columnComment */

    private Long userId;

    /** $column.columnComment */

    private String viewContext;

    /** $column.columnComment */

    private Long loveFlag;

    /** $column.columnComment */

    private Long permission;

    private Long auditFlag;

    private Boolean perm;

    private Boolean audit;

    public Boolean getAudit() {
        return audit;
    }

    public void setAudit(Boolean audit) {
        this.audit = audit;
    }

    public Long getAuditFlag() {
        return auditFlag;
    }

    public void setAuditFlag(Long auditFlag) {
        this.auditFlag = auditFlag;
    }

    public Boolean getPerm() {
        return perm;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    public void setViewId(Long viewId)
    {
        this.viewId = viewId;
    }

    public Long getViewId()
    {
        return viewId;
    }
    public void setCommodityId(Long commodityId)
    {
        this.commodityId = commodityId;
    }

    public Long getCommodityId()
    {
        return commodityId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setViewContext(String viewContext)
    {
        this.viewContext = viewContext;
    }

    public String getViewContext()
    {
        return viewContext;
    }
    public void setLoveFlag(Long loveFlag)
    {
        this.loveFlag = loveFlag;
    }

    public Long getLoveFlag()
    {
        return loveFlag;
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
        return "SysUserView{" +
                "viewId=" + viewId +
                ", commodityId=" + commodityId +
                ", userId=" + userId +
                ", viewContext='" + viewContext + '\'' +
                ", loveFlag=" + loveFlag +
                ", permission=" + permission +
                ", auditFlag=" + auditFlag +
                ", perm=" + perm +
                ", audit=" + audit +
                '}';
    }
}
