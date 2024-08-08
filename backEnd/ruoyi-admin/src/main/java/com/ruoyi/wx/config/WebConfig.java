package com.ruoyi.wx.config;

import com.ruoyi.wx.interceptor.JwtTokenAdminInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private JwtTokenAdminInterceptor jwtTokenAdminInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//            //添加拦截器并指定要拦截的URL路径
//                registry.addInterceptor(jwtTokenAdminInterceptor)
//                .addPathPatterns("/wx/**")  // 只拦截/admin/路径下的请求
//                .excludePathPatterns("/wx/commodity/");  // 排除登录路径
    }
}
