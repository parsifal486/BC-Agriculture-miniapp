package com.ruoyi.web.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.web.domain.SysUserView;
import com.ruoyi.web.mapper.SysUserViewMapper;
import com.ruoyi.web.service.ISysUserViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2024-01-30
 */
@Service
public class SysUserViewServiceImpl implements ISysUserViewService
{
    @Autowired
    private SysUserViewMapper sysUserViewMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param viewId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public SysUserView selectSysUserViewByViewId(Long viewId)
    {
        return sysUserViewMapper.selectSysUserViewByViewId(viewId);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysUserView 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<SysUserView> selectSysUserViewList(SysUserView sysUserView)
    {

        Boolean audit=sysUserView.getAudit();
        if(audit!=null){
            if(audit){
                sysUserView.setAuditFlag(0L);
            }else {
                sysUserView.setAuditFlag(1L);
            }
        }
        return sysUserViewMapper.selectSysUserViewList(sysUserView);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param sysUserView 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertSysUserView(SysUserView sysUserView)
    {
        sysUserView.setCreateTime(DateUtils.getNowDate());
        return sysUserViewMapper.insertSysUserView(sysUserView);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param sysUserView 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateSysUserView(SysUserView sysUserView)
    {
        Boolean perm=sysUserView.getPerm();
        if(perm!=null){
            if(perm){
                sysUserView.setPermission(0L);
            }else {
                sysUserView.setPermission(1L);
            }
        }
        Boolean audit=sysUserView.getAudit();
        if(audit!=null){
            if(!audit){
                sysUserView.setAuditFlag(0L);
            }else {
                sysUserView.setAuditFlag(1L);
            }
        }
        return sysUserViewMapper.updateSysUserView(sysUserView);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param viewIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteSysUserViewByViewIds(Long[] viewIds)
    {
        return sysUserViewMapper.deleteSysUserViewByViewIds(viewIds);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param viewId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteSysUserViewByViewId(Long viewId)
    {
        return sysUserViewMapper.deleteSysUserViewByViewId(viewId);
    }

    @Override
    public int editPermission(SysUserView sysUserView)
    {
        Boolean perm=sysUserView.getPerm();
        if(perm!=null){
            if(perm){
                sysUserView.setPermission(0L);
            }else {
                sysUserView.setPermission(1L);
            }
        }
        return sysUserViewMapper.updateSysUserView(sysUserView);
    }

    @Override
    public List<SysUserView> selectSysUserMessageByViewId() {
        return sysUserViewMapper.selectSysUserMessageByViewId();
    }

    @Override
    public int insertFrontView(Long commodityId,Long userId,String viewContext) {
        return sysUserViewMapper.insertFrontView(commodityId,userId,viewContext);
    }
}
