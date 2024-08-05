package com.ruoyi.web.service;

import com.ruoyi.web.domain.WebUserDetail;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-01-31
 */
public interface IWebUserDetailService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param userId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserDetail selectWebUserDetailByUserId(Long userId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUserDetail> selectWebUserDetailList(WebUserDetail webUserDetail);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    public int insertWebUserDetail(WebUserDetail webUserDetail);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    public int updateWebUserDetail(WebUserDetail webUserDetail);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param userIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteWebUserDetailByUserIds(Long[] userIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param userId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserDetailByUserId(Long userId);
}
