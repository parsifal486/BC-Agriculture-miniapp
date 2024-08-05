package com.ruoyi.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 web_commodity_detail
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public class WebCommodityDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long commodityId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long partitionId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String partitionName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Float commodityPrice;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String commodityName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String profileImage;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String origin;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long selling;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long expirationFlag;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long expirationTime;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long permission;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Float lossRate;

    private Boolean perm;

    private    Float score;

    public Boolean getPerm() {
        return perm;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    public void setCommodityId(Long commodityId)
    {
        this.commodityId = commodityId;
    }

    public Long getCommodityId() 
    {
        return commodityId;
    }
    public void setPartitionId(Long partitionId) 
    {
        this.partitionId = partitionId;
    }

    public Long getPartitionId() 
    {
        return partitionId;
    }
    public void setPartitionName(String partitionName) 
    {
        this.partitionName = partitionName;
    }

    public String getPartitionName() 
    {
        return partitionName;
    }
    public void setCommodityPrice(Float commodityPrice)
    {
        this.commodityPrice = commodityPrice;
    }

    public Float getCommodityPrice()
    {
        return commodityPrice;
    }
    public void setCommodityName(String commodityName) 
    {
        this.commodityName = commodityName;
    }

    public String getCommodityName() 
    {
        return commodityName;
    }
    public void setProfileImage(String profileImage) 
    {
        this.profileImage = profileImage;
    }

    public String getProfileImage() 
    {
        return profileImage;
    }
    public void setOrigin(String origin) 
    {
        this.origin = origin;
    }

    public String getOrigin() 
    {
        return origin;
    }
    public void setSelling(Long selling) 
    {
        this.selling = selling;
    }

    public Long getSelling() 
    {
        return selling;
    }
    public void setExpirationFlag(Long expirationFlag) 
    {
        this.expirationFlag = expirationFlag;
    }

    public Long getExpirationFlag() 
    {
        return expirationFlag;
    }
    public void setExpirationTime(Long expirationTime) 
    {
        this.expirationTime = expirationTime;
    }

    public Long getExpirationTime() 
    {
        return expirationTime;
    }
    public void setPermission(Long permission) 
    {
        this.permission = permission;
    }

    public Long getPermission() 
    {
        return permission;
    }
    public void setLossRate(Float lossRate)
    {
        this.lossRate = lossRate;
    }

    public Float getLossRate()
    {
        return lossRate;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "WebCommodityDetail{" +
                "commodityId=" + commodityId +
                ", partitionId=" + partitionId +
                ", partitionName='" + partitionName + '\'' +
                ", commodityPrice=" + commodityPrice +
                ", commodityName='" + commodityName + '\'' +
                ", profileImage='" + profileImage + '\'' +
                ", origin='" + origin + '\'' +
                ", selling=" + selling +
                ", expirationFlag=" + expirationFlag +
                ", expirationTime=" + expirationTime +
                ", permission=" + permission +
                ", lossRate=" + lossRate +
                ", perm=" + perm +
                ", score=" + score +
                '}';
    }
}
