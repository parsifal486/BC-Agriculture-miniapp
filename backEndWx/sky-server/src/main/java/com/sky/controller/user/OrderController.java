package com.sky.controller.user;

import com.sky.pojo.dto.OrderDto;
import com.sky.pojo.entity.Order;
import com.sky.pojo.vo.OrderVo;
import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.OrderService;
import com.sky.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/wx/order")
public class OrderController {

    @Resource
    private OrderService orderService;



    //根据用户id存入订单信息（产生订单信息
    @PostMapping("/insertorder")
    public Result insertOrder(@RequestBody List<OrderDto> list){
        System.out.println(list);
        orderService.insertOrders(list);
        return Result.success();
    }




    //根据用户id查询所有的订单信息（先查order_id 根据order_id查询commodity详细信息，返回order_id对应一个commodity详细信息
    @GetMapping("/selectorder")
    public Result<PageResult> selectorder(@RequestParam Long userId){
        List<OrderVo> list= orderService.selectOrderByUserId(userId);
        PageResult pageResult = new PageResult();
        pageResult.setRecords(list);
        return Result.success(pageResult);
    }






}
