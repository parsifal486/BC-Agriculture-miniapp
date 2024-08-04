package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.domain.entity.WebUser;
import com.ruoyi.system.mapper.WebUserMapper;
import com.ruoyi.system.service.IWebUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-31
 */
@Service
public class WebUserServiceImpl implements IWebUserService
{
    @Autowired
    private WebUserMapper webUserMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param userId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public WebUser selectWebUserDetailByUserId(Long userId)
    {
        return webUserMapper.selectWebUserDetailByUserId(userId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUser 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<WebUser> selectWebUserDetailList(WebUser webUser)
    {
        return webUserMapper.selectWebUserDetailList(webUser);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUser【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWebUserDetail(WebUser webUser)
    {
        webUser.setCreateTime(DateUtils.getNowDate());
        return webUserMapper.insertWebUserDetail(webUser);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWebUserDetail(WebUser webUserDetail)
    {
        webUserDetail.setUpdateTime(DateUtils.getNowDate());
        return webUserMapper.updateWebUserDetail(webUserDetail);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param userIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserDetailByUserIds(Long[] userIds)
    {
        return webUserMapper.deleteWebUserDetailByUserIds(userIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param userId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserDetailByUserId(Long userId)
    {
        return webUserMapper.deleteWebUserDetailByUserId(userId);
    }
}
