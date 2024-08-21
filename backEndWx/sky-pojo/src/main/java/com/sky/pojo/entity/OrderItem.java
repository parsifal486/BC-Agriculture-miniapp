package com.sky.pojo.entity;

import lombok.Data;

@Data
public class OrderItem {
    private Long orderId;
    private Long userId;
    private Long commodityId;
    private double price;
    private Long quantity;
}
