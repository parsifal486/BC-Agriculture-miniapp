package com.ruoyi.web.mapper;

import java.util.List;
import com.ruoyi.web.domain.WebCommodityDetail;
import org.apache.ibatis.annotations.Select;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
public interface WebCommodityDetailMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param commodityId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebCommodityDetail selectWebCommodityDetailByCommodityId(Long commodityId);


    public List<WebCommodityDetail> selectWebCommodityDetailByPartitionName(String partitionName);
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

    /**
     * 删除【请填写功能名称】
     * 
     * @param commodityId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebCommodityDetailByCommodityId(Long commodityId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param commodityIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebCommodityDetailByCommodityIds(Long[] commodityIds);

    public  List<String> selectPartitionList();

    public WebCommodityDetail selectWebCommodityDetailByCommodityName(String partitionName);

    public  long selectMaxId();

    public String selectPartitionById(Long name);

//    @Select("SELECT * from web_commodity_detail WHERE expiration_flag = 1")
    public List<WebCommodityDetail> selectByExpiration();


   public List<WebCommodityDetail> selectWebCommodityDetailList1(Object o);
}
