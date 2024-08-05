package com.ruoyi.web.mapper;

import java.util.Date;
import java.util.List;
import com.ruoyi.web.domain.WebUserOrders;
import org.apache.ibatis.annotations.Param;


/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface WebUserOrdersMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param ordersId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserOrders selectWebUserOrdersByOrdersId(Long ordersId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUserOrders> selectWebUserOrdersList(WebUserOrders webUserOrders);

    public List<WebUserOrders> selectWebUserOrdersList1(WebUserOrders webUserOrders);
    public WebUserOrders selectWebUserOrdersList2(WebUserOrders webUserOrders);

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
     * 删除【请填写功能名称】
     * 
     * @param ordersId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserOrdersByOrdersId(Long ordersId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ordersIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebUserOrdersByOrdersIds(Long[] ordersIds);

    public int updateOrder(WebUserOrders webUserOrders);

    public List<WebUserOrders> selectByUserid(Long uid);

    public  float getAveragePrice(Long commodityId);


    public float getMidPriceByIdANDTime(Long commodityId);


    public float getMidQuanByIdANDTime(Long commodityId);

    public Boolean iflove2(Long ordersId);

    public Boolean iflove1(Long ordersId);

    public Long getMaxId();



}
