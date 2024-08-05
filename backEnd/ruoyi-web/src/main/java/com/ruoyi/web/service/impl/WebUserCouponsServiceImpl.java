package com.ruoyi.web.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.web.domain.WebUserCoupons;
import com.ruoyi.web.mapper.WebUserCouponsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.service.IWebUserCouponsService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@Service
public class WebUserCouponsServiceImpl implements IWebUserCouponsService 
{
    @Autowired
    private WebUserCouponsMapper webUserCouponsMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param couponsId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public WebUserCoupons selectWebUserCouponsByCouponsId(Long couponsId)
    {
        return webUserCouponsMapper.selectWebUserCouponsByCouponsId(couponsId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserCoupons 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<WebUserCoupons> selectWebUserCouponsList(WebUserCoupons webUserCoupons)
    {
        return webUserCouponsMapper.selectWebUserCouponsList(webUserCoupons);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserCoupons 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWebUserCoupons(WebUserCoupons webUserCoupons)
    {
        webUserCoupons.setCreateTime(DateUtils.getNowDate());
        webUserCoupons.setUpdateTime(DateUtils.getNowDate());
        return webUserCouponsMapper.insertWebUserCoupons(webUserCoupons);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserCoupons 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWebUserCoupons(WebUserCoupons webUserCoupons)
    {
        Boolean perm=webUserCoupons.getPerm();
        if(perm!=null){
            if(perm){
                webUserCoupons.setPermission(0L);
            }else {
                webUserCoupons.setPermission(1L);
            }
        }
        webUserCoupons.setUpdateTime(DateUtils.getNowDate());
        return webUserCouponsMapper.updateWebUserCoupons(webUserCoupons);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param couponsIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserCouponsByCouponsIds(Long[] couponsIds)
    {
        return webUserCouponsMapper.deleteWebUserCouponsByCouponsIds(couponsIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param couponsId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserCouponsByCouponsId(Long couponsId)
    {
        return webUserCouponsMapper.deleteWebUserCouponsByCouponsId(couponsId);
    }

    @Override
    public int editPermission(WebUserCoupons webUserCoupons) {
        Boolean perm=webUserCoupons.getPerm();
        if(perm!=null){
            if(perm){
                webUserCoupons.setPermission(0L);
            }else {
                webUserCoupons.setPermission(1L);
            }
        }
        return webUserCouponsMapper.updateWebUserCoupons(webUserCoupons);
    }

    public List<WebUserCoupons> selectByUid()
    {
        return webUserCouponsMapper.selectByUid();
    }
}
