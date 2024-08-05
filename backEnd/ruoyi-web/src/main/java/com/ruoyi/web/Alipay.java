package com.ruoyi.web;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;


import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
public class Alipay {



    private final String format = "json";

    /**
     * appId
     */
    @Value("${app.appId}")
    private String appId;

    /**
     * 商户私钥
     */
    @Value("${app.privateKey}")
    private String privateKey;

    /**
     * 支付宝公钥
     */
    @Value("${app.publicKey}")
    private String publicKey;

    /**
     * 服务器异步通知页面路径，需要公网能访问到
     */
    @Value("${app.notifyUrl}")
    private String notifyUrl;

    /**
     * 服务器同步通知页面路径，需要公网能访问到
     */
    @Value("${app.returnUrl}")
    private String returnUrl;

    /**
     * 签名方式
     */
    @Value("${app.signType}")
    private String signType;

    /**
     * 字符编码格式
     */
    @Value("${app.charset}")
    private String charset;

    /**
     * 支付宝网关
     */
    @Value("${app.gatewayUrl}")
    private String gatewayUrl;

    public String pay(com.ruoyi.web.domain.AliPayBean aliPayBean) throws AlipayApiException {

        AlipayClient alipayClient = new DefaultAlipayClient(
                gatewayUrl, appId, privateKey, format, charset, publicKey, signType);

        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(returnUrl);
        alipayRequest.setNotifyUrl(notifyUrl);
        alipayRequest.setBizContent(JSON.toJSONString(aliPayBean));


        String result = alipayClient.pageExecute(alipayRequest).getBody();

        return result;
    }
}
