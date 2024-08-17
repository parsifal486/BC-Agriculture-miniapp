package com.sky.service;


import com.sky.pojo.entity.User;
import com.sky.result.PageResult;

import java.util.List;

public interface WxUserService {

    User login(String code);
    void setLovelist(String[] loveList, Long userId);
    User selectById(String id);
    void update(User user);
    PageResult selectCouponsById(Long userId);
}
