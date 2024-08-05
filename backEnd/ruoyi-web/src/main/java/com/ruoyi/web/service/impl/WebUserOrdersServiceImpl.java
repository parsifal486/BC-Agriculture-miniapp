package com.ruoyi.web.service.impl;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.web.domain.WebUserOrders;
import com.ruoyi.web.mapper.WebCommodityDetailMapper;
import com.ruoyi.web.mapper.WebUserOrdersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.service.IWebUserOrdersService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@Service
public class WebUserOrdersServiceImpl implements IWebUserOrdersService 
{

    @Autowired
    private WebUserOrdersMapper webUserOrdersMapper;

    @Autowired
    private WebCommodityDetailMapper webCommodityDetailMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param ordersId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public WebUserOrders selectWebUserOrdersByOrdersId(Long ordersId)
    {
        return webUserOrdersMapper.selectWebUserOrdersByOrdersId(ordersId);
    }

    @Override
    public Boolean iflove2(Long ordersId)
    {
        return webUserOrdersMapper.iflove2(ordersId);
    }

    @Override
    public Boolean iflove1(Long ordersId)
    {
        return webUserOrdersMapper.iflove1(ordersId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<WebUserOrders> selectWebUserOrdersList(WebUserOrders webUserOrders)
    {
        List<WebUserOrders> orders= webUserOrdersMapper.selectWebUserOrdersList(webUserOrders);
        return orders;
    }
    @Override
    public List<WebUserOrders> selectWebUserOrdersList1(WebUserOrders webUserOrders)
    {
        List<WebUserOrders> orders= webUserOrdersMapper.selectWebUserOrdersList1(webUserOrders);
        return orders;
    }


    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWebUserOrders(WebUserOrders webUserOrders)
    {
        webUserOrders.setCreateTime(DateUtils.getNowDate());
        return webUserOrdersMapper.insertWebUserOrders(webUserOrders);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserOrders 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWebUserOrders(WebUserOrders webUserOrders)
    {
        webUserOrders.setUpdateTime(DateUtils.getNowDate());
        return webUserOrdersMapper.updateWebUserOrders(webUserOrders);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ordersIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserOrdersByOrdersIds(Long[] ordersIds)
    {
        return webUserOrdersMapper.deleteWebUserOrdersByOrdersIds(ordersIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param ordersId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserOrdersByOrdersId(Long ordersId)
    {
        return webUserOrdersMapper.deleteWebUserOrdersByOrdersId(ordersId);
    }

    @Override
    public int editPermission(WebUserOrders webUserOrders)
    {
        Boolean perm=webUserOrders.getPerm();
        if(perm!=null){
            if(perm){
                webUserOrders.setPermission(0L);
            }else {
                webUserOrders.setPermission(1L);
            }
        }
        return webUserOrdersMapper.updateWebUserOrders(webUserOrders);
    }

    @Override
    public float DynamicPricing(Long CommodityId) {
        float getPrice=webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(CommodityId).getCommodityPrice();
        float rate=webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(CommodityId).getLossRate();
        float unitPrice=getPrice*(1+rate/100);
        float profile= selectAveragePrice(CommodityId)/getPrice-1;
        float dynamicPrice=unitPrice*(1+profile);
        return dynamicPrice;
    }



    float selectAveragePrice(Long CommodityId){
        float   x= webUserOrdersMapper.getMidPriceByIdANDTime(CommodityId);
        float   y= webUserOrdersMapper.getMidQuanByIdANDTime(CommodityId);
        float res= x/y ;
        return res ;
    }

    @Override
    public Float getcurrentPrice(Date time,Long commodityId){
        float res= (float) 3.7;
        WebUserOrders webUserOrders =new WebUserOrders();
        webUserOrders.setDate(time);
        webUserOrders.setCommodityId(commodityId);
        WebUserOrders webUserOrders1=webUserOrdersMapper.selectWebUserOrdersList2(webUserOrders);
        if(null==webUserOrders1){
            res= (float) (Math.random()*10.3);
        }else{
            float price=webUserOrders1.getPrice();
            float quantity=webUserOrders1.getQuantity();
            res=price/quantity;
        }

       return res;
    }

}
