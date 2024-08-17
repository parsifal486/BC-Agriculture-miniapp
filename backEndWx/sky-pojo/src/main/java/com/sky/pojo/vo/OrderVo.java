package com.sky.pojo.vo;

import com.sky.pojo.entity.OrderItems;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class OrderVo {

    private Date createTime;

    private double price;

    private List<OrderItems> list;

}
