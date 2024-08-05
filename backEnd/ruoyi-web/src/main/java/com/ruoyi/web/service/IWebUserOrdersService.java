package com.ruoyi.web.service;

import java.util.Date;
import java.util.List;

import com.ruoyi.web.domain.WebCommodityDetail;
import com.ruoyi.web.domain.WebUserOrders;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface IWebUserOrdersService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param ordersId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserOrders selectWebUserOrdersByOrdersId(Long ordersId);

    Boolean iflove2(Long ordersId);

    Boolean iflove1(Long ordersId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUserOrders> selectWebUserOrdersList(WebUserOrders webUserOrders);

    List<WebUserOrders> selectWebUserOrdersList1(WebUserOrders webUserOrders);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 结果
     */
    public int insertWebUserOrders(WebUserOrders webUserOrders);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 结果
     */
    public int updateWebUserOrders(WebUserOrders webUserOrders);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ordersIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteWebUserOrdersByOrdersIds(Long[] ordersIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param ordersId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserOrdersByOrdersId(Long ordersId);


    public int editPermission(WebUserOrders webUserOrders);

    public float  DynamicPricing(Long CommodityId);


    public Float getcurrentPrice(Date time,Long commodityId);
}
