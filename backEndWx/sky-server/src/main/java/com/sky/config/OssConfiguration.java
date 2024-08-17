package com.sky.config;

import com.sky.properties.AliOssProperties;
import com.sky.utils.AliOssUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//配置类用于创建AliOssUtils对象
@Configuration
@Slf4j
public class OssConfiguration {
    @Bean
    //保证只有一个工具类就行了
    @ConditionalOnMissingBean
    public AliOssUtil aliOssUtil(AliOssProperties aliOssProperties){
        log.info("开始创建阿里云文件上传工具类{}",aliOssProperties);
        return new AliOssUtil(aliOssProperties.getEndpoint(),aliOssProperties.getAccessKeyId(),aliOssProperties.getAccessKeySecret(),aliOssProperties.getBucketName());
    }
}
