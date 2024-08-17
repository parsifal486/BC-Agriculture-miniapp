package com.sky.service.impl;

import com.sky.mapper.OrderMapper;
import com.sky.pojo.dto.OrderDto;
import com.sky.pojo.entity.Commodity;
import com.sky.pojo.entity.Order;
import com.sky.pojo.entity.OrderItems;
import com.sky.pojo.vo.OrderVo;
import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.OrderService;
import com.sky.utils.ThreadLocalUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.sky.utils.DateUtils.getNowDate;


@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;


    @Override
    public void insertOrders(List<OrderDto> list) {
        List<OrderDto> res=new ArrayList<>();
        double totalAmount=new Double(0.0);
        for (OrderDto order : list) {
            OrderDto orderDto = new OrderDto();
            orderDto.setPrice(orderMapper.getPriceById(order.getCommondityId()));
            orderDto.setQuantity(order.getQuantity());
            orderDto.setCommondityId(order.getCommondityId());
            res.add(orderDto);
            totalAmount+=orderMapper.getPriceById(order.getCommondityId())*order.getQuantity();

        }
        Order order = new Order();
        order.setUserId(ThreadLocalUtils.getCurrentId());

        order.setPrice(totalAmount);
        order.setCreateTime(getNowDate());
        order.setUpdateTime(getNowDate());
        order.setCommodityId(1092034917L);
        order.setFlag(0L);
        order.setPermission(1L);
        order.setQuantity(1.0F);

        Long orderId=orderMapper.insertOrders(order);

        for (OrderDto re : res) {
            re.setOrderId(orderId);
            orderMapper.insertOrdersItems(re);
        }


    }

    @Override
    public List<OrderVo> selectOrderByUserId(Long userId) {

        //查询用户所有的总订单信息
        List<Order> orderList = new ArrayList<>();
        orderList=orderMapper.selectOrderById(userId);
        List<OrderVo> orderVoList = new ArrayList<>();
        for (Order order:orderList) {
            //将订单的第一部分放进去
            OrderVo orderVo1 = new OrderVo();
            orderVo1.setCreateTime(order.getCreateTime());
            orderVo1.setPrice(order.getPrice());
            //将订单的第二部分放进去
            List<OrderDto> orderDtoList=new ArrayList<>();
            orderDtoList=orderMapper.selectOrderItems(order.getOrdersId());
            List<OrderItems> orderItemsList=new ArrayList<>();
            for (OrderDto orderDto : orderDtoList) {
                OrderItems orderItems = new OrderItems();
                orderItems.setCommodityName(orderMapper.selectNameById(orderDto.getCommondityId()));
                orderItems.setProfile(orderMapper.selectProfileById(orderDto.getCommondityId()));
                orderItems.setPrice(orderDto.getPrice());
                orderItems.setQuantity(orderDto.getQuantity());
                orderItemsList.add(orderItems);
            }
            orderVo1.setList(orderItemsList);
        }
        return orderVoList;




















//        //查询每一个订单的详细信息
//        for (Order order : orderList) {
//            for (OrderVo orderVo : orderVoList) {
//
//
//
//
//            }
//
//
//
//        }
//
//

//        orderVo.setCreateTime(order.getCreateTime());
//        orderVo.setPrice(order.getPrice());
//
//        //查询订单的很多个商品信息
//        List<OrderDto> list=orderMapper.selectOrderItems();
//
//        List<OrderItems> finalList =new ArrayList<>();
//
//        for (OrderDto orderDto : list) {
//            //查询商品的详细信息并且放在list当中
//            Commodity commodity =orderMapper.selectCommodityById(order.getCommodityId());
//            OrderItems orderItems = new OrderItems();
//            orderItems.setCommodityName(commodity.getCommodityName());
//            orderItems.setProfile(commodity.getProfileImage());
//            orderItems.setPrice(orderDto.getPrice());
//            orderItems.setQuantity(orderDto.getQuantity());
//            finalList.add(orderItems);
//        }
//
//        orderVo.setList(finalList);

    }
}
