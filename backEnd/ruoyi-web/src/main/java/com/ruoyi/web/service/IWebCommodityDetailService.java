package com.ruoyi.web.service;

import java.util.List;

import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.web.domain.WebCommodityDetail;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface IWebCommodityDetailService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param commodityId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebCommodityDetail selectWebCommodityDetailByCommodityId(Long commodityId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webCommodityDetail 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebCommodityDetail> selectWebCommodityDetailList(WebCommodityDetail webCommodityDetail);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webCommodityDetail 【请填写功能名称】
     * @return 结果
     */
    public int insertWebCommodityDetail(WebCommodityDetail webCommodityDetail);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webCommodityDetail 【请填写功能名称】
     * @return 结果
     */
    public int updateWebCommodityDetail(WebCommodityDetail webCommodityDetail);


    public int editPermission(WebCommodityDetail webCommodityDetail);
    /**
     * 批量删除【请填写功能名称】
     * 
     * @param commodityIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteWebCommodityDetailByCommodityIds(Long[] commodityIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param commodityId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebCommodityDetailByCommodityId(Long commodityId);

    public List<TreeSelect> selectCmdTreeList();

}
