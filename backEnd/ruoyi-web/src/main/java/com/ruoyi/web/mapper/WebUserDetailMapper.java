package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.WebUserDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-31
 */
@Mapper
public interface WebUserDetailMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param userId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserDetail selectWebUserDetailByUserId(Long userId);

    /**
     * 查询【请填写功能名称】
     *
     * @param nickname 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WebUserDetail selectWebUserDetailByNickname(String nickname);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WebUserDetail> selectWebUserDetailList(WebUserDetail webUserDetail);

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    public int insertWebUserDetail(WebUserDetail webUserDetail);

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    public int updateWebUserDetail(WebUserDetail webUserDetail);

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
