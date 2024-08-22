package com.sky.service.impl;

import com.sky.mapper.OrderMapper;
import com.sky.pojo.dto.OrderDto;
import com.sky.pojo.entity.Order;
import com.sky.pojo.entity.OrderItem;
import com.sky.pojo.vo.OrderItemVo;
import com.sky.pojo.vo.OrderVo;
import com.sky.service.OrderService;
import com.sky.utils.ThreadLocalUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static com.sky.utils.DateUtils.getNowDate;


@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;

    private static final Long USER_ID= ThreadLocalUtils.getCurrentId();
//        private static final Long USER_ID=200021L;
    @Override
    public void insertOrders(List<OrderDto> list) {
        List<OrderItem> res=new ArrayList<>();
        double totalAmount=new Double(0.0);
        for (OrderDto order : list) {
            OrderItem orderItem = new OrderItem();
//            OrderDto orderDto = new OrderDto();
            orderItem.setPrice(orderMapper.getPriceById(order.getCommodityId()));
            orderItem.setQuantity(order.getQuantity());
            orderItem.setCommodityId(order.getCommodityId());
            res.add(orderItem);
            totalAmount+=orderMapper.getPriceById(order.getCommodityId())*order.getQuantity();

        }
        Order order = new Order();
//        order.setUserId(ThreadLocalUtils.getCurrentId());
        order.setUserId(USER_ID);
        order.setPrice(totalAmount);
        order.setCreateTime(getNowDate());
        order.setUpdateTime(getNowDate());
        order.setCommodityId(1092034917L);
        order.setFlag(0L);
        order.setPermission(1L);
        order.setQuantity(1.0F);

        orderMapper.insertOrders(order);


        for (OrderItem re : res) {
            re.setOrderId(order.getOrdersId());

            re.setUserId(USER_ID);
//            re.setUserId(ThreadLocalUtils.getCurrentId());
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
            List<OrderItemVo> orderItemVoList =new ArrayList<>();
            for (OrderDto orderDto : orderDtoList) {
                OrderItemVo orderItemVo = new OrderItemVo();
                orderItemVo.setCommodityName(orderMapper.selectNameById(orderDto.getCommodityId()));
                orderItemVo.setProfile(orderMapper.selectProfileById(orderDto.getCommodityId()));
                orderItemVo.setPrice(orderDto.getPrice());
                orderItemVo.setQuantity(orderDto.getQuantity());
                orderItemVoList.add(orderItemVo);

            }
            orderVo1.setList(orderItemVoList);
            orderVoList.add(orderVo1);
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
