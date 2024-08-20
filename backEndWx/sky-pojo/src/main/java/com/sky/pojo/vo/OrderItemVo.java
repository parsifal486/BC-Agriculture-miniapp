package com.sky.pojo.vo;

import lombok.Data;

@Data
public class OrderItemVo {
    private String commodityName;

    private String profile;

    private double price;

    private Long quantity;
}
