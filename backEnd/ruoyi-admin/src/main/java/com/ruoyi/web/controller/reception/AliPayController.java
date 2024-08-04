//package com.ruoyi.web.controller.reception;
//
//import com.alipay.api.AlipayApiException;
//import com.ruoyi.web.domain.AliPayBean;
//import com.ruoyi.web.domain.WebCommodityDetail;
//import com.ruoyi.web.domain.WebUserOrders;
//import com.ruoyi.web.service.PayService;
//import com.ruoyi.web.service.impl.WebCommodityDetailServiceImpl;
//import com.ruoyi.web.service.impl.WebUserOrdersServiceImpl;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//@Controller
//@RequestMapping("/ali")
//public class AliPayController {
//
//    /**日志对象*/
//    private static final Logger logger = LoggerFactory.getLogger(AliPayController.class);
//
//    @Autowired
//    private PayService payService;
//
//    @Autowired
//    private WebUserOrdersServiceImpl webUserOrdersService;
//
//    @Autowired
//    private WebCommodityDetailServiceImpl webCommodityDetailService;
//
//    @RequestMapping("/pay")
//    @ResponseBody
//    public String alipay() throws AlipayApiException {
//        Long orderId=200001L;
//        WebUserOrders webUserOrders=webUserOrdersService.selectWebUserOrdersByOrdersId(orderId);
//        String outTradeNo = String.valueOf(orderId);
//        Long CommodityId  =webUserOrders.getCommodityId();
//        WebCommodityDetail webCommodityDetail=webCommodityDetailService.selectWebCommodityDetailByCommodityId(CommodityId);
//        String subject = webCommodityDetail.getCommodityName();
//        Float price = webUserOrders.getPrice();
//
//        AliPayBean alipayBean = new AliPayBean();
//        alipayBean.setOut_trade_no(outTradeNo);
//        alipayBean.setSubject(subject);
//        alipayBean.setTotal_amount(String.valueOf(price));
//
//        return payService.aliPay(alipayBean);
//    }
//
//    @RequestMapping("/success")
//    @ResponseBody
//    public String success(){
//        return "交易成功！";
//    }
//
//
//}
