package com.ruoyi.wx.service.impl;

import com.ruoyi.wx.mappers.UserMapper;
import com.ruoyi.wx.pojo.entity.User;
import com.ruoyi.wx.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User selectById(String id) {
        User user = new User();
        user=userMapper.selectById(id);

        return user;
    }
}
