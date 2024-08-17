package com.sky.pojo.entity;

import lombok.Data;

@Data
public class OrderItems {
    private String commodityName;

    private String profile;

    private double price;

    private Long quantity;
}
