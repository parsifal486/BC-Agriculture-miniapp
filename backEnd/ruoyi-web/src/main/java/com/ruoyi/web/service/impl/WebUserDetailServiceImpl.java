package com.ruoyi.web.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.web.mapper.WebUserDetailMapper;
import com.ruoyi.web.service.IWebUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;


/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-31
 */
@Service
public class WebUserDetailServiceImpl implements IWebUserDetailService
{
    @Autowired
    private WebUserDetailMapper webUserDetailMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param userId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public WebUserDetail selectWebUserDetailByUserId(Long userId)
    {
        return webUserDetailMapper.selectWebUserDetailByUserId(userId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<WebUserDetail> selectWebUserDetailList(WebUserDetail webUserDetail)
    {

        List<WebUserDetail> list=webUserDetailMapper.selectWebUserDetailList(webUserDetail);
        for(WebUserDetail user:list){
            String[] strLove=user.getLove().split(",");
            Arrays.sort(strLove);
            user.setLoveList(strLove);
        }

        return list;


    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWebUserDetail(WebUserDetail webUserDetail)
    {
        String[] toUpdate= new String[]{};
        toUpdate= webUserDetail.getLoveList();
        if(toUpdate!=null){
            String res = "";
            for (int i = 0; i < toUpdate.length; i++) {
                res += toUpdate[i];
                if (i != toUpdate.length - 1) {
                    res += ",";
                }

            }
            webUserDetail.setLove(res);
        }
        webUserDetail.setCreateTime(DateUtils.getNowDate());
        webUserDetail.setUpdateTime(DateUtils.getNowDate());
        return webUserDetailMapper.insertWebUserDetail(webUserDetail);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param webUserDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWebUserDetail(WebUserDetail webUserDetail)
    {
        String[] toUpdate= new String[]{};
               toUpdate= webUserDetail.getLoveList();
        if(toUpdate!=null){
            String res = "";
            for (int i = 0; i < toUpdate.length; i++) {
                res += toUpdate[i];
                if (i != toUpdate.length - 1) {
                    res += ",";
                }

            }
            webUserDetail.setLove(res);
        }
        Boolean perm=webUserDetail.getPerm();
        if(perm!=null){
            if(perm){
                webUserDetail.setPermission(0L);
            }else {
                webUserDetail.setPermission(1L);
            }
        }

        webUserDetail.setUpdateTime(DateUtils.getNowDate());
        return webUserDetailMapper.updateWebUserDetail(webUserDetail);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param userIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserDetailByUserIds(Long[] userIds)
    {
        return webUserDetailMapper.deleteWebUserDetailByUserIds(userIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param userId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebUserDetailByUserId(Long userId)
    {
        return webUserDetailMapper.deleteWebUserDetailByUserId(userId);
    }
}
