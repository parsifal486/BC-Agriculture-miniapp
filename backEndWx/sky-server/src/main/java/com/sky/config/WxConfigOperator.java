package com.sky.config;


import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import org.fisco.bcos.sdk.BcosSDK;
import org.fisco.bcos.sdk.client.Client;
import org.fisco.bcos.sdk.config.ConfigOption;
import org.fisco.bcos.sdk.config.exceptions.ConfigException;
import org.fisco.bcos.sdk.config.model.ConfigProperty;
import org.fisco.bcos.sdk.crypto.CryptoSuite;
import org.fisco.bcos.sdk.crypto.keypair.CryptoKeyPair;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class WxConfigOperator {
    @Value("${wx.miniapp.configs.appid}")
    private String appId;
    @Value("${wx.miniapp.configs.secret}")
    private String secret;
    @Bean
    public WxMaService wxMaService(){

        WxMaDefaultConfigImpl wxMaConfig = new WxMaDefaultConfigImpl();
        wxMaConfig.setAppid(appId);
        wxMaConfig.setSecret(secret);
        WxMaService service=new WxMaServiceImpl();
        service.setWxMaConfig(wxMaConfig);
        return service;
    }

//    区块链相关配置

    @Value("${fisco.nodeList}")
    private String nodeLists;

    @Value("${fisco.groupId}")
    private Integer groupId;

    @Value("${fisco.certPath}")
    private String certPath;

    @Value("${fisco.account.accountFilePath}")
    private String accountFilePath;

    @Bean(name = "configProperty")
    public ConfigProperty defaultConfigProperty() {
        ConfigProperty property = new ConfigProperty();
        // 配置cryptoMaterial
        Map<String, Object> cryptoMaterialMap = new HashMap<>();
        cryptoMaterialMap.put("certPath", certPath);
        property.setCryptoMaterial(cryptoMaterialMap);

        // 配置network
        Map<String, Object> networkMap = new HashMap<>();
        String[] split = nodeLists.split(",");
        List<String> nodeList = Arrays.asList(split);
        networkMap.put("peers", nodeList);
        property.setNetwork(networkMap);

        // 配置account
        Map<String, Object> accountMap = new HashMap<>();
        accountMap.put("keyStoreDir", "account");
        accountMap.put("accountAddress", "");
        accountMap.put("accountFileFormat", "pem");
        accountMap.put("password", "");
        accountMap.put("accountFilePath", accountFilePath);
        property.setAccount(accountMap);

        //配置 threadPool
        Map<String, Object> threadPoolMap = new HashMap<>();
        threadPoolMap.put("channelProcessorThreadSize", "16");
        threadPoolMap.put("receiptProcessorThreadSize", "16");
        threadPoolMap.put("maxBlockingQueueSize", "102400");
        property.setThreadPool(threadPoolMap);
        return property;
    }

    @Bean(name = "configOption")
    public ConfigOption defaultConfigOption(ConfigProperty configProperty) throws ConfigException {
        try {
            return new ConfigOption(configProperty);
        } catch (org.fisco.bcos.sdk.config.exceptions.ConfigException e) {
            throw new RuntimeException(e);
        }
    }

    @Bean(name = "bcosSDK")
    public BcosSDK bcosSDK(ConfigOption configOption) {
        return new BcosSDK(configOption);
    }

    @Bean(name = "client")
    public Client getClient(BcosSDK bcosSDK) {
        // 为群组初始化client
        Client client = bcosSDK.getClient(groupId);
        return client;
    }

    @Bean
    public CryptoKeyPair getCryptoKeyPair(Client client) {
        // 如果有密钥文件 那么每次读取的就不再是随机的
        CryptoSuite cryptoSuite = client.getCryptoSuite();
        CryptoKeyPair cryptoKeyPair = cryptoSuite.getCryptoKeyPair();
        return cryptoKeyPair;
    }
}
