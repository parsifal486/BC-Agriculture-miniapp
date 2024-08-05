package com.ruoyi.web.service;

import java.util.List;
import com.ruoyi.web.domain.WebUserCoupons;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface IWebUserCouponsService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param couponsId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserCoupons selectWebUserCouponsByCouponsId(Long couponsId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserCoupons 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUserCoupons> selectWebUserCouponsList(WebUserCoupons webUserCoupons);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserCoupons 【请填写功能名称】
     * @return 结果
     */
    public int insertWebUserCoupons(WebUserCoupons webUserCoupons);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserCoupons 【请填写功能名称】
     * @return 结果
     */
    public int updateWebUserCoupons(WebUserCoupons webUserCoupons);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param couponsIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteWebUserCouponsByCouponsIds(Long[] couponsIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param couponsId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserCouponsByCouponsId(Long couponsId);

    public int editPermission(WebUserCoupons webUserCoupons);
}
