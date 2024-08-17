package com.sky.mapper;

import com.sky.pojo.dto.OrderDto;
import com.sky.pojo.entity.Order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface OrderMapper {


    @Select("select commodity_price from web_commodity_detail where commodity_id=#{commodityId}")
    double getPriceById(Long commondityId);


    Long insertOrders(Order order);

    void insertOrdersItems(OrderDto res);

    @Select("select order_id,create_time,price,quantity from web_user_orders where user_id=#{userId}")
    List<Order> selectOrderById(Long userId);
    @Select("select * from  web_order_item where order_id=#{orderId}")
    List<OrderDto> selectOrderItems(Long orderId);
    @Select("select commodity_name from web_commodity_detail where commodity_id=#{commodityId} ")
    String selectNameById(Long commondityId);
    @Select("select profile_image from web_commodity_detail where commodity_id=#{commodityId}")
    String selectProfileById(Long commondityId);
}
