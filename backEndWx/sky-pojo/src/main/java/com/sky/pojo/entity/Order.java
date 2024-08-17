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
}
