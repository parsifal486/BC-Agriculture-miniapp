package com.sky.pojo.dto;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class OrderDto {
    private Long Id;
    private Long orderId;
    private Long commodityId;
    private double price;
    private Long quantity;

}