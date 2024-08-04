package com.ruoyi.web.core.config;

import com.google.code.kaptcha.util.ConfigException;
import com.ruoyi.common.config.RuoYiConfig;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.fisco.bcos.sdk.BcosSDK;
import org.fisco.bcos.sdk.client.Client;
import org.fisco.bcos.sdk.config.ConfigOption;
import org.fisco.bcos.sdk.config.model.ConfigProperty;
import org.fisco.bcos.sdk.crypto.CryptoSuite;
import org.fisco.bcos.sdk.crypto.keypair.CryptoKeyPair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.*;

/**
 * Swagger2的接口配置
 *
 * @author ruoyi
 */
@Configuration
public class SwaggerConfig
{
    /** 系统基础配置 */
    @Autowired
    private RuoYiConfig ruoyiConfig;

    /** 是否开启swagger */
    @Value("${swagger.enabled}")
    private boolean enabled;

    /** 设置请求的统一前缀 */
    @Value("${swagger.pathMapping}")
    private String pathMapping;

    /**
     * 创建API
     */
    @Bean
    public Docket createRestApi()
    {
        return new Docket(DocumentationType.OAS_30)
                // 是否启用Swagger
                .enable(enabled)
                // 用来创建该API的基本信息，展示在文档的页面中（自定义展示的信息）
                .apiInfo(apiInfo())
                // 设置哪些接口暴露给Swagger展示
                .select()
                // 扫描所有有注解的api，用这种方式更灵活
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                // 扫描指定包中的swagger注解
                // .apis(RequestHandlerSelectors.basePackage("com.ruoyi.project.tool.swagger"))
                // 扫描所有 .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build()
                /* 设置安全模式，swagger可以设置访问token */
                .securitySchemes(securitySchemes())
                .securityContexts(securityContexts())
                .pathMapping(pathMapping);
    }

    /**
     * 安全模式，这里指定token通过Authorization头请求头传递
     */
    private List<SecurityScheme> securitySchemes()
    {
        List<SecurityScheme> apiKeyList = new ArrayList<SecurityScheme>();
        apiKeyList.add(new ApiKey("Authorization", "Authorization", In.HEADER.toValue()));
        return apiKeyList;
    }

    /**
     * 安全上下文
     */
    private List<SecurityContext> securityContexts()
    {
        List<SecurityContext> securityContexts = new ArrayList<>();
        securityContexts.add(
                SecurityContext.builder()
                        .securityReferences(defaultAuth())
                        .operationSelector(o -> o.requestMappingPattern().matches("/.*"))
                        .build());
        return securityContexts;
    }

    /**
     * 默认的安全上引用
     */
    private List<SecurityReference> defaultAuth()
    {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        List<SecurityReference> securityReferences = new ArrayList<>();
        securityReferences.add(new SecurityReference("Authorization", authorizationScopes));
        return securityReferences;
    }

    /**
     * 添加摘要信息
     */
    private ApiInfo apiInfo()
    {
        // 用ApiInfoBuilder进行定制
        return new ApiInfoBuilder()
                // 设置标题
                .title("标题：若依管理系统_接口文档")
                // 描述
                .description("描述：用于管理集团旗下公司的人员信息,具体包括XXX,XXX模块...")
                // 作者信息
                .contact(new Contact(ruoyiConfig.getName(), null, null))
                // 版本
                .version("版本号:" + ruoyiConfig.getVersion())
                .build();
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
