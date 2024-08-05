package com.ruoyi.web.mapper;

import java.util.List;
import com.ruoyi.web.domain.WebUserCoupons;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface WebUserCouponsMapper 
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
     * 删除【请填写功能名称】
     * 
     * @param couponsId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserCouponsByCouponsId(Long couponsId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param couponsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebUserCouponsByCouponsIds(Long[] couponsIds);

    public List<WebUserCoupons> selectByUid();
}
