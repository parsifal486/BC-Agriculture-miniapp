package com.ruoyi.web.controller.reception;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.WebCommodityDetail;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.web.mapper.WebCommodityDetailMapper;
import com.ruoyi.web.service.IWebCommodityDetailService;
import com.ruoyi.web.service.impl.WebUserDetailServiceImpl;
import com.ruoyi.web.service.impl.WebUserOrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import static java.lang.Math.abs;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2024-01-30
 */
@RestController
//@RequestMapping("")
public class WebCommodityDetailController extends BaseController
{
    @Autowired
    private IWebCommodityDetailService webCommodityDetailService;


    @Autowired
    private WebUserDetailServiceImpl webUserDetailService;

    @Autowired
    private WebUserOrdersServiceImpl webUserOrdersService;

    @Autowired
    private WebCommodityDetailMapper webCommodityDetailMapper;

    /**
     * 查询【请填写功能名称】列表
     */
////    @PreAuthorize("@ss.hasPermi('system:detail:list')")
//    @GetMapping("/list")
//    public WebCommodityDetail find()
//    {
////        startPage();
//        WebCommodityDetail webCommodityDetail = webCommodityDetailService.selectWebCommodityDetailByCommodityId(102900005115199L);
//        return webCommodityDetail;
//    }


//    @PreAuthorize("@ss.hasPermi('system:detail:list')")
    @GetMapping("/web/commodityDetail/list")
    public TableDataInfo list( WebCommodityDetail webCommodityDetail)
    {
        startPage();
        List<WebCommodityDetail> list = webCommodityDetailService.selectWebCommodityDetailList(webCommodityDetail);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/web/commodityDetail/export")
    public void export(HttpServletResponse response, WebCommodityDetail webCommodityDetail)
    {
        List<WebCommodityDetail> list = webCommodityDetailService.selectWebCommodityDetailList(webCommodityDetail);
        ExcelUtil<WebCommodityDetail> util = new ExcelUtil<WebCommodityDetail>(WebCommodityDetail.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }




    /**
     * 获取【请填写功能名称】详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:query')")
    @GetMapping(value = "/web/commodityDetail/{commodityId}")
    public AjaxResult getInfo(@PathVariable("commodityId") Long commodityId)
    {
        return success(webCommodityDetailService.selectWebCommodityDetailByCommodityId(commodityId));
    }

    /**
     * 新增【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/web/commodityDetail/add")
    public AjaxResult add(@RequestBody WebCommodityDetail webCommodityDetail)
    {
        return toAjax(webCommodityDetailService.insertWebCommodityDetail(webCommodityDetail));
    }

    /**
     * 修改【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/commodityDetail/edit")
    public AjaxResult edit(@RequestBody WebCommodityDetail webCommodityDetail)
    {
        return toAjax(webCommodityDetailService.updateWebCommodityDetail(webCommodityDetail));
    }



    /**
     * 修改【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/commodityDetail/editPermission")
    public AjaxResult editPermission(@RequestBody WebCommodityDetail webCommodityDetail)
    {
        return toAjax(webCommodityDetailService.editPermission(webCommodityDetail));
    }


    /**
     * 删除【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/web/commodityDetail/{commodityIds}")
    public AjaxResult remove(@PathVariable Long[] commodityIds)
    {
        return toAjax(webCommodityDetailService.deleteWebCommodityDetailByCommodityIds(commodityIds));
    }

    /**
     * 获取学院列表
     */
//    @PreAuthorize("@ss.hasPermi('system:stu:list')")
    @GetMapping("/web/commodityDetail/commodityTree")
    public AjaxResult ColList()
    {
        return success(webCommodityDetailService.selectCmdTreeList());
    }



    @GetMapping(value = "/front/userDetail/byLove")
    public AjaxResult getCommodityByLove(@RequestParam("userId") String userId)
    {
        WebUserDetail   webUserDetail=webUserDetailService.selectWebUserDetailByUserId(Long.valueOf(userId));
        List<WebCommodityDetail> webCommodityDetailList=webCommodityDetailMapper.selectWebCommodityDetailList1(null);
        List<String> dataLove= Arrays.asList(webUserDetail.getLove().split(","));
        List<WebCommodityDetail> list=new ArrayList<>();
        float i=0;
        for(WebCommodityDetail webCommodityDetail:webCommodityDetailList){
            i+=0.01;
            float flag=0;
            float score = 0;
            int age= Integer.parseInt(webUserDetail.getAge());
            if(age>35){
                flag= (float) 0.1;
                score= (float) (0.1*age);
            }else{
                flag= (float) 0.3;
                score= (float) (0.3*age);
            }

           if(dataLove.contains(webCommodityDetail.getPartitionName())) {
               score+=30;
           }

            if(webUserDetail.getSex().equals("1")){
                score+=(0.4-flag)*100;
            }

            Long id=webCommodityDetail.getCommodityId();
            if(webUserOrdersService.iflove1(id)){
                score+=6;
                if(webUserOrdersService.iflove2(id)){
                    score+=24;
                }
            }
            webCommodityDetail.setScore((float) (score+1+abs(flag-i-0.1*Long.valueOf(userId)%10)));
            list.add(webCommodityDetail);
        }
        list = list.stream().sorted(Comparator.comparing(WebCommodityDetail::getScore).reversed()).collect(Collectors.toList());
        list=list.subList(0,15);

        return AjaxResult.success(list);
    }

    @GetMapping("/front/commodityDetail/getSevenPrice")
    public AjaxResult getRecentPrice( @RequestParam String commodityId ) throws ParseException {
        Map resmap=new HashMap<>();

        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

        Date time1 = dateformat.parse("2024-03-23");
        Date time2 = dateformat.parse("2024-03-24");
        Date time3 = dateformat.parse("2024-03-25");
        Date time4 = dateformat.parse("2024-03-26");
        Date time5 = dateformat.parse("2024-03-27");
        Date time6 = dateformat.parse("2024-03-28");
        Date time7 = dateformat.parse("2024-03-29");

        resmap.put("cost",webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(Long.valueOf(commodityId)).getCommodityPrice());
        resmap.put("day1",webUserOrdersService.getcurrentPrice(time1, Long.valueOf(commodityId)));
        resmap.put("day2",webUserOrdersService.getcurrentPrice(time2, Long.valueOf(commodityId)));
        resmap.put("day3",webUserOrdersService.getcurrentPrice(time3, Long.valueOf(commodityId)));
        resmap.put("day4",webUserOrdersService.getcurrentPrice(time4, Long.valueOf(commodityId)));
        resmap.put("day5",webUserOrdersService.getcurrentPrice(time5, Long.valueOf(commodityId)));
        resmap.put("day6",webUserOrdersService.getcurrentPrice(time6, Long.valueOf(commodityId)));
        resmap.put("day7",webUserOrdersService.getcurrentPrice(time7, Long.valueOf(commodityId)));

        return AjaxResult.success(resmap);
    }



}
