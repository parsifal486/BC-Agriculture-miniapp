package com.ruoyi.web.service;

import java.util.List;
import com.ruoyi.web.domain.SysUserView;

/**
 * 【请填写功能名称】Service接口
 *
 * @author ruoyi
 * @date 2024-01-30
 */
public interface ISysUserViewService
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
     * 批量删除【请填写功能名称】
     *
     * @param viewIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteSysUserViewByViewIds(Long[] viewIds);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param viewId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysUserViewByViewId(Long viewId);

    public int editPermission(SysUserView sysUserView);

    public  List<SysUserView> selectSysUserMessageByViewId();

    public  int insertFrontView(Long commodityId,Long userId,String viewContext);
}
