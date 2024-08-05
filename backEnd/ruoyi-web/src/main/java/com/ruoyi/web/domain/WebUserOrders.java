package com.ruoyi.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 web_user_orders
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public class WebUserOrders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long ordersId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long userId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long commodityId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date date;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long flag;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long permission;

    private Boolean perm;

    private Float price;

    private  Float quantity;

    public Float getQuantity() {
        return quantity;
    }

    public void setQuantity(Float quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Boolean getPerm() {
        return perm;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    public void setOrdersId(Long ordersId)
    {
        this.ordersId = ordersId;
    }

    public Long getOrdersId() 
    {
        return ordersId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setCommodityId(Long commodityId) 
    {
        this.commodityId = commodityId;
    }

    public Long getCommodityId() 
    {
        return commodityId;
    }
    public void setDate(Date date) 
    {
        this.date = date;
    }

    public Date getDate() 
    {
        return date;
    }
    public void setFlag(Long flag) 
    {
        this.flag = flag;
    }

    public Long getFlag() 
    {
        return flag;
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
        return "WebUserOrders{" +
                "ordersId=" + ordersId +
                ", userId=" + userId +
                ", commodityId=" + commodityId +
                ", date=" + date +
                ", flag=" + flag +
                ", permission=" + permission +
                ", perm=" + perm +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}
