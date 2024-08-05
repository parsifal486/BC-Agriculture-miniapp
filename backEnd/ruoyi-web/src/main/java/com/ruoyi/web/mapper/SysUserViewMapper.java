package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.SysUserView;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple2;

import java.util.List;
import java.util.Map;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@Mapper
public interface SysUserViewMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param viewId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysUserView selectSysUserViewByViewId(Long viewId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param sysUserView 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysUserView> selectSysUserViewList(SysUserView sysUserView);


    @Select("select commodity_id from block_id")
    public List<Long> selectAllOriginId();

    @Select("INSERT INTO block_id (commodity_name) VALUES (#{name});")
    public void insertOriginId(String name);


    @Select("DELETE FROM block_id WHERE commodity_id= #{id};")
    public void deleteOriginId(Long id);

    @Select("SELECT LAST_INSERT_ID();")
    public Long getOriginId();

    @Select("SELECT commodity_id FROM block_id  WHERE commodity_name=#{name} limit 1;")
    public Long getOriginIdByName(String name);

    @Select("SELECT commodity_id,(SUM(CASE WHEN love_flag = 1 THEN 1 ELSE 0 END) / COUNT(*)) AS p FROM sys_user_view GROUP BY commodity_id ORDER BY p DESC LIMIT 8")
    public List<Tuple2<Long,Long>> selectWebCommodityByLoveFlag();

    @Select("select * from sys_blockchain_origin")
    public List<Map> selectAllOrigin();

    @Select("select * from web_commodity_detail where commodity_id=#{id}")
    public Map selectOriginById(Long id);

    @Select("select * from sys_blockchain_sell")
    public List<Map> selectAllSell();

    @Select("select * from sys_blockchain_transport")
    public List<Map> selectAlltransport();
    public List<SysUserView> selectAllSysUserViewList();

    /**
     * 新增【请填写功能名称】
     * 
     * @param sysUserView 【请填写功能名称】
     * @return 结果
     */
    public int insertSysUserView(SysUserView sysUserView);

    /**
     * 修改【请填写功能名称】
     * 
     * @param sysUserView 【请填写功能名称】
     * @return 结果
     */
    public int updateSysUserView(SysUserView sysUserView);

    /**
     * 删除【请填写功能名称】
     * 
     * @param viewId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysUserViewByViewId(Long viewId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param viewIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserViewByViewIds(Long[] viewIds);

    public int editPermission();

    public List<SysUserView> selectSysUserMessageByViewId();

    public int insertFrontView(@Param("commodityId") Long commodityId, @Param("userId") Long userId, @Param("viewContext") String viewContext);
}
