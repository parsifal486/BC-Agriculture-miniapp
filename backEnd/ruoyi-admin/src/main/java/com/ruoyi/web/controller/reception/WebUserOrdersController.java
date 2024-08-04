package com.ruoyi.web.controller.reception;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;

import com.ruoyi.web.controller.client.AgricultureClient;
import com.ruoyi.web.domain.AliPayBean;
import com.ruoyi.web.domain.WebCommodityDetail;
import com.ruoyi.web.domain.WebUserOrders;
import com.ruoyi.web.mapper.WebCommodityDetailMapper;
import com.ruoyi.web.mapper.WebUserOrdersMapper;
import com.ruoyi.web.service.IWebUserDetailService;
import com.ruoyi.web.service.IWebUserOrdersService;
import com.ruoyi.web.service.PayService;
import com.ruoyi.web.service.impl.WebCommodityDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2024-01-30
 */
@RestController
//@RequestMapping("/web/orders")
public class WebUserOrdersController extends BaseController
{
    @Autowired
    private IWebUserOrdersService webUserOrdersService;

    @Autowired
    private AgricultureClient agricultureClient;

    @Autowired
    private WebUserOrdersMapper webUserOrdersMapper;

    @Autowired
    private IWebUserDetailService webUserDetailService;

    @Autowired
    private WebCommodityDetailMapper webCommodityDetailMapper;

    @Autowired
    private WebCommodityDetailServiceImpl webCommodityDetailService;

    @Autowired
    private PayService payService;

    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:orders:list')")
    @GetMapping("/web/orders/list")
    public TableDataInfo list(WebUserOrders webUserOrders)
    {
        startPage();
        List<WebUserOrders> list = webUserOrdersService.selectWebUserOrdersList(webUserOrders);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:orders:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/web/orders/export")
    public void export(HttpServletResponse response, WebUserOrders webUserOrders)
    {
        List<WebUserOrders> list = webUserOrdersService.selectWebUserOrdersList(webUserOrders);
        ExcelUtil<WebUserOrders> util = new ExcelUtil<WebUserOrders>(WebUserOrders.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:orders:query')")
    @GetMapping(value = "/web/orders/{ordersId}")
    public AjaxResult getInfo(@PathVariable("ordersId") Long ordersId)
    {
        return success(webUserOrdersService.selectWebUserOrdersByOrdersId(ordersId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:orders:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/web/orders")
    public AjaxResult add(@RequestBody WebUserOrders webUserOrders)
    {
        return toAjax(webUserOrdersService.insertWebUserOrders(webUserOrders));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:orders:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/orders")
    public AjaxResult edit(@RequestBody WebUserOrders webUserOrders)
    {
        return toAjax(webUserOrdersService.updateWebUserOrders(webUserOrders));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:orders:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/web/orders/{ordersIds}")
    public AjaxResult remove(@PathVariable Long[] ordersIds)
    {
        return toAjax(webUserOrdersService.deleteWebUserOrdersByOrdersIds(ordersIds));
    }

    /**
     * 修改【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping("/web/orders/editPermission")
    public AjaxResult editPermission(@RequestBody WebUserOrders webUserOrders)
    {
        return toAjax(webUserOrdersService.editPermission(webUserOrders));
    }

//    @GetMapping("/front/personInfo/myOrders")
//    public AjaxResult selectByUserid(HttpSession session)
//    {
//        WebUser webUser=(WebUser)session.getAttribute("user");
//        return AjaxResult.success(webUserOrdersMapper.selectByUserid(webUser.getUserId()));
//    }

    @PreAuthorize("@ss.hasPermi('system:orders:list')")
    @GetMapping("/web/orders/price")
    public AjaxResult list(long CommodityId)
    {
        float resPrice=webUserOrdersService.DynamicPricing(CommodityId);
        return AjaxResult.success(resPrice);
    }


    @RequestMapping ("front/personInfo/myOrders")
    public AjaxResult getOrderInfo(@RequestParam("userId") String userId)
    {
        WebUserOrders webUserOrders=new WebUserOrders();
        webUserOrders.setUserId(Long.valueOf(userId));
        List<WebUserOrders> webUserOrdersList=webUserOrdersService.selectWebUserOrdersList(webUserOrders);
        List<Map> resMap=new ArrayList<>();
       for(WebUserOrders orders:webUserOrdersList){
            Map<String,String> orderMap= JSON.parseObject(JSON.toJSONString(orders), Map.class);
            Map tranMap=new HashMap<>(orderMap);
           long CId=orders.getCommodityId();
          WebCommodityDetail webCommodityDetail =webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(CId);
           String image=webCommodityDetail.getProfileImage();
           String commodityName=webCommodityDetail.getCommodityName();
           tranMap.put("profileImage",image);
           tranMap.put("updateTime",orders.getUpdateTime());
           tranMap.put("createTime",orders.getCreateTime());
           tranMap.put("commodityName",commodityName);
           resMap.add(tranMap);
           if (resMap.size()==10) {
               break;
           }
       }
        return success(resMap);
    }


    @RequestMapping("front/personInfo/myDetail")
    public  AjaxResult getMyInfo(@RequestParam("userId") String userId){

//        WebUser webUser=(WebUser) session.getAttribute("user");
        return AjaxResult.success(webUserDetailService.selectWebUserDetailByUserId(Long.valueOf(userId)));
    }


    @GetMapping("/front/orders/dynamic")
    public AjaxResult list(@RequestParam("CommodityId") String CommodityId)
    {

        Float pricing= webUserOrdersService.DynamicPricing(Long.valueOf(CommodityId));
        return AjaxResult.success(pricing);
    }


    @GetMapping("/web/order/dynamicPrice")
    public AjaxResult dynamicPrice(@RequestParam("CommodityId") String CommodityId)
    {

        Float pricing= webUserOrdersService.DynamicPricing(Long.valueOf(CommodityId));
        return AjaxResult.success(pricing);
    }

    @GetMapping("/front/orders/dynamicList")
    public AjaxResult dynamicList()
    {
        List<WebUserOrders> list = webUserOrdersService.selectWebUserOrdersList1(null);
        List<Map> dynamicList=new ArrayList<>();
        for(WebUserOrders webUserOrders1:list){
            Map map=new HashMap<>();
            Float pricing= webUserOrdersService.DynamicPricing(Long.valueOf(webUserOrders1.getCommodityId()));
            map.put("dynamicPrice",pricing);
            map.put("commodityName",webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(webUserOrders1.getCommodityId()).getCommodityName());
            map.put("commodityPrice",webCommodityDetailMapper.selectWebCommodityDetailByCommodityId(webUserOrders1.getCommodityId()).getCommodityPrice());

            dynamicList.add(map);
        }

        return AjaxResult.success(dynamicList);
    }


    @RequestMapping(value = "/front/pay/giveOrderInfo", produces = MediaType.TEXT_HTML_VALUE)
    public void alipay(@RequestParam("userid") String userId,@RequestParam("vegename") String vegName,@RequestParam("price") String price,HttpServletResponse httpResponse) throws AlipayApiException, IOException {

        float ALlprice=0;

        String[] veName=vegName.split(",");
        String[] vePrice=price.split(",");
        System.out.println(vegName);

        for(int i=0;i<veName.length;i++){
            ALlprice+=Float.parseFloat(vePrice[i]);
            WebUserOrders webUserOrders=new WebUserOrders();
            //商品id
            WebCommodityDetail temp= webCommodityDetailMapper.selectWebCommodityDetailByCommodityName(veName[i]);
            Long commodityId =temp.getCommodityId();

            webUserOrders.setCommodityId(commodityId);
            webUserOrders.setUserId(Long.valueOf(userId));
            webUserOrders.setFlag(0L);
            webUserOrders.setPermission(0L);

            webUserOrders.setPrice(Float.valueOf(vePrice[i]));
            webUserOrdersService.insertWebUserOrders(webUserOrders);
        }



        AliPayBean alipayBean = new AliPayBean();
        alipayBean.setOut_trade_no( UUID.randomUUID().toString().substring(0, 9));
        alipayBean.setSubject(vegName);
        alipayBean.setTotal_amount(String.valueOf(ALlprice));

//        return payService.aliPay(alipayBean);

//        String form = "";
//        try {
//            form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
//        } catch (AlipayApiException e) {
//            e.printStackTrace();
//        }
        httpResponse.setContentType("text/html;charset=" + "UTF-8");
        httpResponse.getWriter().write(payService.aliPay(alipayBean));// 直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
        httpResponse.getWriter().close();
//————————————————
//


//        return AjaxResult.success( "<html>" +
//                "<header><title>Welcome</title></header>" +
//                "<body>" +
//                payService.aliPay(alipayBean) +
//                "</body>" +
//                "</html>");
    }


    @PostMapping("/front/orders/add")
    public AjaxResult frontAdd(@RequestBody WebUserOrders webUserOrders)
    {
        return toAjax(webUserOrdersService.insertWebUserOrders(webUserOrders));
    }



    @RequestMapping(value = "/front/pay/addOrder", produces = MediaType.TEXT_HTML_VALUE)
    public void alipay(@RequestParam("userid") String userId,@RequestParam("vegename") String vegName,@RequestParam("price") String price,@RequestParam("number") String number ,HttpServletResponse httpResponse) throws AlipayApiException, IOException {

        float ALlprice=0;

        String[] veName=vegName.split(",");
        String[] vePrice=price.split(",");
        String[] quantity=number.split(",");
        System.out.println(vegName);

        for(int i=0;i<veName.length;i++){
            ALlprice+=Float.parseFloat(vePrice[i]);
            WebUserOrders webUserOrders=new WebUserOrders();
            //商品id
            WebCommodityDetail temp= webCommodityDetailMapper.selectWebCommodityDetailByCommodityName(veName[i]);
            Long commodityId =temp.getCommodityId();

            webUserOrders.setCommodityId(commodityId);
            webUserOrders.setUserId(Long.valueOf(userId));
            webUserOrders.setFlag(0L);
            webUserOrders.setPermission(0L);
            webUserOrders.setQuantity(Float.valueOf(quantity[i]));

            webUserOrders.setPrice(Float.valueOf(vePrice[i]));
            webUserOrdersService.insertWebUserOrders(webUserOrders);
        }



        AliPayBean alipayBean = new AliPayBean();
        alipayBean.setOut_trade_no( UUID.randomUUID().toString().substring(0, 9));
        alipayBean.setSubject(vegName);
        alipayBean.setTotal_amount(String.valueOf(ALlprice));


        httpResponse.setContentType("text/html;charset=" + "UTF-8");
        httpResponse.getWriter().write(payService.aliPay(alipayBean));// 直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
        httpResponse.getWriter().close();

    }




}
//class Test{
//    private List<Map> orderToBack;
//
//    public List<Map> getOrderToBack() {
//        return orderToBack;
//    }
//
//    public void setOrderToBack(List<Map> orderToBack) {
//        this.orderToBack = orderToBack;
//    }
//}
