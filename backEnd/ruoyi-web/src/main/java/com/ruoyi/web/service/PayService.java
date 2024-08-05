package com.ruoyi.web.service;

import com.alipay.api.AlipayApiException;
import com.ruoyi.web.domain.AliPayBean;


public interface PayService {

    String aliPay(AliPayBean aliPayBean) throws AlipayApiException;
}
