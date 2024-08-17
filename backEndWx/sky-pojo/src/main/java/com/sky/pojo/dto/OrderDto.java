package com.sky.pojo.dto;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class OrderDto {
    private Long Id;
    private Long orderId;
    private Long commondityId;
    private double price;
    private Long quantity;

}
