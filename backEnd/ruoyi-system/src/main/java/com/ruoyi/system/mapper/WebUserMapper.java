package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.WebUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-31
 */
@Mapper
public interface WebUserMapper
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param userId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUser selectWebUserDetailByUserId(Long userId);

    /**
     * 查询【请填写功能名称】
     *
     * @param nickname 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUser selectWebUserDetailByNickname(String nickname);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUser> selectWebUserDetailList(WebUser webUserDetail);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    public int insertWebUserDetail(WebUser webUserDetail);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    public int updateWebUserDetail(WebUser webUserDetail);

    /**
     * 删除【请填写功能名称】
     * 
     * @param userId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWebUserDetailByUserId(Long userId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebUserDetailByUserIds(Long[] userIds);
}
