package com.ruoyi.web.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.web.domain.WebCommodityDetail;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.web.mapper.WebCommodityDetailMapper;
import com.ruoyi.web.mapper.WebUserCouponsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.service.IWebCommodityDetailService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@Service
public class WebCommodityDetailServiceImpl implements IWebCommodityDetailService 
{
    @Autowired
    private WebCommodityDetailMapper webCommodityDetailMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param commodityId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public WebCommodityDetail selectWebCommodityDetailByCommodityId(Long commodityId)
    {
        return webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(commodityId);
    }

    public List<WebCommodityDetail> selectWebCommodityDetailByPartitionName(String partitionName)
    {
        return webCommodityDetailMapper.selectWebCommodityDetailByPartitionName(partitionName);
    }

    public List<WebCommodityDetail> selectByExpiration_flag()
    {
        return webCommodityDetailMapper.selectByExpiration();

    }


    public WebCommodityDetail selectWebCommodityDetailByCommodityName(String partitionName)
    {
        return webCommodityDetailMapper.selectWebCommodityDetailByCommodityName(partitionName);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param webCommodityDetail 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<WebCommodityDetail> selectWebCommodityDetailList(WebCommodityDetail webCommodityDetail)
    {

        if("蔬菜类".equals(webCommodityDetail.getPartitionName())){
            webCommodityDetail.setPartitionName(null);
            return webCommodityDetailMapper.selectWebCommodityDetailList(webCommodityDetail);
        }
        return webCommodityDetailMapper.selectWebCommodityDetailList(webCommodityDetail);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param webCommodityDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertWebCommodityDetail(WebCommodityDetail webCommodityDetail)
    {
        long id=webCommodityDetailMapper.selectMaxId()+1;
        webCommodityDetail.setCommodityId(id);
        webCommodityDetail.setCreateTime(DateUtils.getNowDate());
        webCommodityDetail.setUpdateTime(DateUtils.getNowDate());
        if(webCommodityDetail.getPartitionId()!=null){
            webCommodityDetail.setPartitionName(webCommodityDetailMapper.selectPartitionById(webCommodityDetail.getPartitionId()));
        }
        return webCommodityDetailMapper.insertWebCommodityDetail(webCommodityDetail);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param webCommodityDetail 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateWebCommodityDetail(WebCommodityDetail webCommodityDetail)
    {
        Boolean perm=webCommodityDetail.getPerm();
        if(perm!=null){
            if(perm){
                webCommodityDetail.setPermission(0L);
            }else {
                webCommodityDetail.setPermission(1L);
            }
        }

        WebCommodityDetail  newCommodity=webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(webCommodityDetail.getCommodityId());
        if(newCommodity.getExpirationTime().equals(webCommodityDetail.getExpirationTime())){

        }else {
            webCommodityDetail.setUpdateTime(DateUtils.getNowDate());
        }

        return webCommodityDetailMapper.updateWebCommodityDetail(webCommodityDetail);
    }



    @Override
    public int editPermission(WebCommodityDetail webCommodityDetail)
    {
        Boolean perm=webCommodityDetail.getPerm();
        if(perm!=null){
            if(perm){
                webCommodityDetail.setPermission(0L);
            }else {
                webCommodityDetail.setPermission(1L);
            }
        }
        return webCommodityDetailMapper.updateWebCommodityDetail(webCommodityDetail);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param commodityIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebCommodityDetailByCommodityIds(Long[] commodityIds)
    {
        return webCommodityDetailMapper.deleteWebCommodityDetailByCommodityIds(commodityIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param commodityId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteWebCommodityDetailByCommodityId(Long commodityId)
    {
        return webCommodityDetailMapper.deleteWebCommodityDetailByCommodityId(commodityId);
    }

    @Override
    public List<TreeSelect> selectCmdTreeList() {
        List<SysDept> depts=updateColList();
        return buildColTreeSelect(depts);
    }


    public List<SysDept> updateColList() {
        List<SysDept> depts = getParentColList();
        List<String> deptname=webCommodityDetailMapper.selectPartitionList();
//        for(int i=0;i<deptname.size();i++){
//            SysDept sysDept = new SysDept();
//            long Did=selectWebCommodityDetailByCommodityName(deptname.get(i)).getCommodityId();
//            sysDept.setDeptId(Did);
//            long Pid=selectWebCommodityDetailByCommodityName(deptname.get(i)).getPartitionId();
//            sysDept.setParentId(Pid);
//            String ancestor="0"+Pid;
//            sysDept.setAncestors(ancestor);
//            String Dname=deptname.get(i);
//            sysDept.setDeptName(Dname);
//            sysDept.setOrderNum(i+1);
//            sysDept.setLeader("unkown");
//            sysDept.setStatus("0");
//            sysDept.setDelFlag("0");
//            depts.add(i+1,sysDept);
//        }
        return depts;
    }

    public List<SysDept> getParentColList()
    {
        List<SysDept> deptList=new ArrayList<>();

        SysDept dept0=new SysDept();
        dept0.setDeptId(10L);
        dept0.setParentId(0L);
        dept0.setAncestors("0");
        dept0.setDeptName("蔬菜类");
        dept0.setOrderNum(0);
        dept0.setLeader("unkown");
        dept0.setStatus("0");
        dept0.setDelFlag("0");
        deptList.add(dept0);



        SysDept dept1=new SysDept();
        dept1.setDeptId(1011010101L);
        dept1.setParentId(10L);
        dept1.setAncestors("0,10");
        dept1.setDeptName("花叶类");
        dept1.setOrderNum(1);
        dept1.setLeader("unkown");
        dept1.setStatus("0");
        dept1.setDelFlag("0");
        deptList.add(dept1);

        SysDept dept2=new SysDept();
        dept2.setDeptId(1011010402L);
        dept2.setParentId(10L);
        dept2.setAncestors("0,10");
        dept2.setDeptName("水生根茎类");
        dept2.setOrderNum(2);
        dept2.setLeader("unkown");
        dept2.setStatus("0");
        dept2.setDelFlag("0");
        deptList.add(dept2);

        SysDept dept3=new SysDept();
        dept3.setDeptId(1011010201L);
        dept3.setParentId(10L);
        dept3.setAncestors("0,10");
        dept3.setDeptName("花菜类");
        dept3.setOrderNum(3);
        dept3.setLeader("unkown");
        dept3.setStatus("0");
        dept3.setDelFlag("0");
        deptList.add(dept3);


        SysDept dept4=new SysDept();
        dept4.setDeptId(1011010504L);
        dept4.setParentId(10L);
        dept4.setAncestors("0,10");
        dept4.setDeptName("辣椒类");
        dept4.setOrderNum(4);
        dept4.setLeader("unkown");
        dept4.setStatus("0");
        dept4.setDelFlag("0");
        deptList.add(dept4);


        SysDept dept5=new SysDept();
        dept5.setDeptId(1011010501L);
        dept5.setParentId(10L);
        dept5.setAncestors("0,10");
        dept5.setDeptName("茄类");
        dept5.setOrderNum(5);
        dept5.setLeader("unkown");
        dept5.setStatus("0");
        dept5.setDelFlag("0");
        deptList.add(dept5);

        SysDept dept6=new SysDept();
        dept6.setDeptId(1011010801L);
        dept6.setParentId(10L);
        dept6.setAncestors("0,10");
        dept6.setDeptName("食用菌");
        dept6.setOrderNum(6);
        dept6.setLeader("unkown");
        dept6.setStatus("0");
        dept6.setDelFlag("0");
        deptList.add(dept6);
        return deptList;
    }

    public List<TreeSelect> buildColTreeSelect(List<SysDept> depts)
    {
        List<SysDept> deptTrees = buildDeptTree(depts);
        return deptTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public List<SysDept> buildDeptTree(List<SysDept> depts)
    {
        List<SysDept> returnList = new ArrayList<SysDept>();
        List<Long> tempList = depts.stream().map(SysDept::getDeptId).collect(Collectors.toList());
        for (SysDept dept : depts)
        {
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(dept.getParentId()))
            {
                recursionFn(depts, dept);
                returnList.add(dept);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = depts;
        }
        return returnList;
    }


    private void recursionFn(List<SysDept> list, SysDept t)
    {
        // 得到子节点列表
        List<SysDept> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysDept tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    private List<SysDept> getChildList(List<SysDept> list, SysDept t)
    {
        List<SysDept> tlist = new ArrayList<SysDept>();
        Iterator<SysDept> it = list.iterator();
        while (it.hasNext())
        {
            SysDept n = (SysDept) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getDeptId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }


    private boolean hasChild(List<SysDept> list, SysDept t)
    {
        return getChildList(list, t).size() > 0;
    }

}
