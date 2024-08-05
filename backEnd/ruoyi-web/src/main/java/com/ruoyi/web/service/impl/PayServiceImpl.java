package com.ruoyi.web.service.impl;

import com.alipay.api.AlipayApiException;

//import com.ruoyi.web.Alipay;
//import com.ruoyi.web.domain.AliPayBean;
import com.ruoyi.web.Alipay;
import com.ruoyi.web.domain.AliPayBean;
import com.ruoyi.web.service.PayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 支付服务接口
 */
@Service
public class PayServiceImpl implements PayService {

    /**日志对象*/
    private static final Logger logger = LoggerFactory.getLogger(PayServiceImpl.class);

    @Autowired
    private Alipay alipay;

    @Override
    public String aliPay(AliPayBean aliPayBean) throws AlipayApiException {
        logger.info("调用支付服务接口...");
        return alipay.pay(aliPayBean);
    }
}
