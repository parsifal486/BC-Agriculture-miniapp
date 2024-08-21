package com.sky.pojo.entity;


import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class Order extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long ordersId;

    private Long userId;

    /** $column.columnComment */

    private Date date;

    /** $column.columnComment */

    private Long flag;

    /** $column.columnComment */

    private Long permission;

    private Boolean perm;

    private double price;

    private  Float quantity;

    private Long commodityId;

    public Long getOrdersId() {
        return ordersId;
    }

    public Long getUserId() {
        return userId;
    }

    public Date getDate() {
        return date;
    }

    public Long getFlag() {
        return flag;
    }

    public Long getPermission() {
        return permission;
    }

    public Boolean getPerm() {
        return perm;
    }

    public double getPrice() {
        return price;
    }

    public Float getQuantity() {
        return quantity;
    }

    public Long getCommodityId() {
        return commodityId;
    }

    public void setOrdersId(Long ordersId) {
        this.ordersId = ordersId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setFlag(Long flag) {
        this.flag = flag;
    }

    public void setPermission(Long permission) {
        this.permission = permission;
    }

    public void setPerm(Boolean perm) {
        this.perm = perm;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(Float quantity) {
        this.quantity = quantity;
    }

    public void setCommodityId(Long commodityId) {
        this.commodityId = commodityId;
    }
}
