package com.sky.service;

import com.sky.pojo.dto.OrderDto;
import com.sky.pojo.entity.Order;
import com.sky.pojo.vo.OrderVo;
import com.sky.result.PageResult;
import com.sky.result.Result;

import java.util.List;

public interface OrderService {

    void insertOrders(List<OrderDto> list);

    List<OrderVo> selectOrderByUserId(Long userId);
}
