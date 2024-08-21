package com.sky.pojo.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class OrderVo {

    private Date createTime;

    private double price;

    private List<OrderItemVo> list;

}
