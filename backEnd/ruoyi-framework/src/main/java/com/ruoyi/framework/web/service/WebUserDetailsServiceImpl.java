package com.ruoyi.framework.web.service;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.domain.entity.WebUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import com.ruoyi.system.mapper.WebUserMapper;

@Component("WebUserDetailsServiceImpl")
public class WebUserDetailsServiceImpl implements UserDetailsService {
 
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
 
    @Autowired
    private  WebUserMapper webUserMapper;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        WebUser user = webUserMapper.selectWebUserDetailByNickname(username);//验证登录用户，查询数据库，如果这个mapper定义在自己的模块，引入maven依赖不用我多说吧？
        System.out.println("这里是会员登录"+user);
        if (StringUtils.isNull(user)) {
            log.info("登录用户：{} 不存在.", username);
            throw new ServiceException("登录用户：" + username + " 不存在");
        }
        return createLoginUser(user);
    }
 
    public UserDetails createLoginUser(WebUser user) {
        return new LoginUser(user.getUserId(), user);
    }

    public WebUser selectWebUserDetailByNickname(String nikename) {
        return  webUserMapper.selectWebUserDetailByNickname(nikename);
    }

    public WebUser getUserById(long uid) {
       return webUserMapper.selectWebUserDetailByUserId(uid);
    }
}