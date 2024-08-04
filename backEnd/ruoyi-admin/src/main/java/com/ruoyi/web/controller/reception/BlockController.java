package com.ruoyi.web.controller.reception;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.web.controller.client.AgricultureClient;
import com.ruoyi.web.controller.contract.Agriculture;
import com.ruoyi.web.domain.CustomCoordinates;
import com.ruoyi.web.mapper.SysUserViewMapper;
import org.fisco.bcos.sdk.transaction.model.exception.ContractException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/block")
public class BlockController extends BaseController {

    @Autowired
    SysUserViewMapper sysUserViewMapper;

    @Autowired
    AgricultureClient agricultureClient;

    @PostMapping("/insertOrigin")
    public void insertOrigin(@RequestBody Map map)
    {
        sysUserViewMapper.insertOriginId((String) map.get("commodityName"));
        agricultureClient.addCommodity(
                BigInteger.valueOf(sysUserViewMapper.getOriginIdByName((String) map.get("commodityName"))),
                (String) map.get("commodityName"),
                (String) map.get("origin"),
                BigInteger.valueOf(Long.valueOf((String) map.get("originX"))) ,
                BigInteger.valueOf( Long.valueOf((String) map.get("originY")) ),
                (String) map.get("commodityPartition"),
                BigInteger.valueOf( Long.valueOf((String) map.get("bagging")) ),
                BigInteger.valueOf( Long.valueOf((String) map.get("growTime")) ),
                BigInteger.valueOf( Long.valueOf((String) map.get("irrigateTime")) ),
                BigInteger.valueOf( Long.valueOf((String) map.get("fertilizerTime")) ),
                BigInteger.valueOf( Long.valueOf((String) map.get("weedingTime")) ),
                BigInteger.valueOf( Long.valueOf((String) map.get("temperature")) ),
                (String) map.get("farming"),
                BigInteger.valueOf(System.currentTimeMillis()),
                (String) map.get("remark"),
                (String) map.get("supervisor"),
                true
        );
    }

    @RequestMapping("/findAllBlockOriginByCommodityName")
    public AjaxResult findAllBlockOriginByCommodityName(String commodityName) throws ContractException {
        Agriculture.Struct0 struct0=null;
        List<Agriculture.Struct0> list=new ArrayList<>();
        for (Long l:sysUserViewMapper.selectAllOriginId())
        {
            struct0=agricultureClient.queryCommodity(BigInteger.valueOf(l));
            if(struct0!=null&&commodityName.equals(struct0.commodityName))
            {
                list.add(agricultureClient.queryCommodity(BigInteger.valueOf(l)));
                return AjaxResult.success(list);
            }
        }
        return null;
    }

    @RequestMapping("/findAllBlockOriginBySupervisor")
    public TableDataInfo findAllBlockOriginBySupervisor(String supervisor) throws ContractException {
        startPage();
        Agriculture.Struct0 struct0=null;
        List<Agriculture.Struct0> list=new ArrayList<>();
        if (supervisor!=null) {
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                struct0=agricultureClient.queryCommodity(BigInteger.valueOf(l));
                if (supervisor!=null&&supervisor.equals(struct0.supervisor)) {
                    list.add(struct0);
                }
            }
        }
        TableDataInfo tableDataInfo=new TableDataInfo(list, (int) PageUtils.page.getTotal());
        return tableDataInfo;
    }

    @RequestMapping("/findAllBlockOriginByCommodityId")
    public AjaxResult findAllBlockOriginByCommodityId(Long commodityId) throws ContractException {
        List<Agriculture.Struct0> list=new ArrayList<>();
        list.add(agricultureClient.queryCommodity(BigInteger.valueOf(commodityId)));
        return AjaxResult.success(list);
    }


    @RequestMapping("/findAllBlockOrigin")
    public TableDataInfo findAllBlockOrigin() throws ContractException {
        startPage();
        Agriculture.Struct0 struct0=null;
        List<Agriculture.Struct0> list=new ArrayList<>();
        for (Long l:sysUserViewMapper.selectAllOriginId())
        {
            struct0=agricultureClient.queryCommodity(BigInteger.valueOf(l));
            if (struct0!=null)
            {
                list.add(struct0);
            }
        }
        TableDataInfo tableDataInfo=new TableDataInfo(list, (int) PageUtils.page.getTotal());
        return tableDataInfo;
    }


    @RequestMapping("/deleteBlockOrigin")
    public void deleteBlockOriginById(Long commodityId)
    {
        sysUserViewMapper.deleteOriginId(commodityId);
        agricultureClient.deleteCommodity(BigInteger.valueOf(commodityId));
    }

    @RequestMapping("/findAllBlockTransportByCommodityId")
    public AjaxResult findAllBlockTransportByCommodityId(Long commodityId) throws ContractException {
        List<Agriculture.Struct1> list=new ArrayList<>();
        list.add(agricultureClient.queryTransport(BigInteger.valueOf(commodityId)));
        return AjaxResult.success(list);
    }

    @RequestMapping("/findAllBlockTransportBySupervisor")
    public TableDataInfo findAllBlockTransportBySupervisor(String supervisor) throws ContractException {
        startPage();
        Agriculture.Struct1 struct1=null;
        List<Agriculture.Struct1> list=new ArrayList<>();
        if (supervisor!=null) {
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                struct1=agricultureClient.queryTransport(BigInteger.valueOf(l));
                if (struct1!=null&&supervisor.equals(struct1.supervisor)) {
                    list.add(struct1);
                }
            }
        }
        TableDataInfo tableDataInfo=new TableDataInfo(list, (int) PageUtils.page.getTotal());
        return tableDataInfo;
    }

    @RequestMapping("/findAllBlockTransportByCommodityName")
    public AjaxResult findAllBlockTransportByCommodityName(String commodityName) throws ContractException {
        Agriculture.Struct1 struct1=null;
        List<Agriculture.Struct1> list=new ArrayList<>();
        for (Long l:sysUserViewMapper.selectAllOriginId())
        {
            struct1=agricultureClient.queryTransport(BigInteger.valueOf(l));
            if(struct1!=null&&commodityName.equals(struct1.commodityName))
            {
                list.add(struct1);
                return AjaxResult.success(list);
            }
        }
        return null;
    }

    @RequestMapping("/findAllBlockTransport")
    public TableDataInfo findAllBlockTransport() throws ContractException {
        startPage();
        Agriculture.Struct1 struct1=null;
        List<Agriculture.Struct1> list=new ArrayList<>();
        for (Long l:sysUserViewMapper.selectAllOriginId())
        {
            struct1=agricultureClient.queryTransport(BigInteger.valueOf(l));
            if (struct1!=null){
                list.add(struct1);
            }
        }
        TableDataInfo tableDataInfo=new TableDataInfo(list, (int) PageUtils.page.getTotal());
        return tableDataInfo;
    }

    @RequestMapping("/findPointListBycommodityId")
    public AjaxResult findPointListBycommodityId(Long commodityId) throws ContractException {
        List<CustomCoordinates.Point> pointList= new ArrayList<>();
        Agriculture.Struct1 struct1=agricultureClient.queryTransport(BigInteger.valueOf(commodityId));
        CustomCoordinates customCoordinates = CustomCoordinates.generateRandomCoordinates(new CustomCoordinates.Point(struct1.transportX.longValue(), struct1.transportY.longValue()));
        pointList.add(customCoordinates.getStartPoint());
        pointList.add(customCoordinates.getMidPoint());
        pointList.add(customCoordinates.getEndPoint());
        return AjaxResult.success(pointList);
    }

    @RequestMapping("/deleteBlockTransport")
    public void deleteBlockTransportById(Long commodityId)
    {
        agricultureClient.deleteTransport(BigInteger.valueOf(commodityId));
    }

    @PostMapping("/insertTransport")
    public void insertTransport(@RequestBody Map map)
    {
        agricultureClient.addTransport(
                BigInteger.valueOf(sysUserViewMapper.getOriginIdByName((String) map.get("commodityName"))),
                (String) map.get("commodityName"),
                (String) map.get("commodityTransport"),
                BigInteger.valueOf(System.currentTimeMillis()),
                BigInteger.valueOf(Long.parseLong((String) map.get("transportX"))) ,
                BigInteger.valueOf(Long.parseLong((String) map.get("transportY"))) ,
                (String) map.get("remark"),
                BigInteger.valueOf(Long.parseLong((String) map.get("transportStatus"))) ,
                (String) map.get("supervisor"),
                true
        );
    }

        @RequestMapping("/findAllBlockSellByCommodityId")
            public AjaxResult findAllBlockSellByCommodityId(Long commodityId) throws ContractException {
            List<Agriculture.Struct2> list=new ArrayList<>();
            list.add(agricultureClient.querySell(BigInteger.valueOf(commodityId)));
            return AjaxResult.success(list);
    }

    @RequestMapping("/findAllBlockSellBySupervisor")
    public TableDataInfo findAllBlockSellBySupervisor(String supervisor) throws ContractException {
        startPage();
        Agriculture.Struct2 struct2=null;
        List<Agriculture.Struct2> list=new ArrayList<>();
        if (supervisor!=null) {
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                struct2=agricultureClient.querySell(BigInteger.valueOf(l));
                if (struct2!=null&&supervisor.equals(struct2.supervisor)) {
                    list.add(struct2);
                }
            }
        }
        TableDataInfo tableDataInfo=new TableDataInfo(list, (int) PageUtils.page.getTotal());
        return tableDataInfo;
    }

    @RequestMapping("/findAllBlockSellByCommodityName")
    public AjaxResult findAllBlockSellByCommodityName(String commodityName) throws ContractException {
        Agriculture.Struct2 struct2=null;
        List<Agriculture.Struct2> list=new ArrayList<>();
        for (Long l:sysUserViewMapper.selectAllOriginId())
        {
            struct2=agricultureClient.querySell(BigInteger.valueOf(l));
            if(struct2!=null&&commodityName.equals(struct2.commodityName))
            {
                list.add(struct2);
                return AjaxResult.success(list);
            }
        }
        return null;
    }

    @RequestMapping("/findAllBlockSell")
    public TableDataInfo findAllBlockSell() throws ContractException {
        startPage();
        List<Agriculture.Struct2> list=new ArrayList<>();
        for (Long l:sysUserViewMapper.selectAllOriginId())
        {
            list.add(agricultureClient.querySell(BigInteger.valueOf(l)));
        }
        TableDataInfo tableDataInfo=new TableDataInfo(list, (int) PageUtils.page.getTotal());
        return tableDataInfo;
    }


    @RequestMapping("/deleteBlockSell")
    public void deleteBlockSell(Long commodityId)
    {
        agricultureClient.deleteSell(BigInteger.valueOf(commodityId));
    }

    @PostMapping("/insertSell")
    public void insertSell(@RequestBody Map map)
    {
        agricultureClient.addSell(
                BigInteger.valueOf(sysUserViewMapper.getOriginIdByName((String) map.get("commodityName"))),
                (String) map.get("commodityName"),
                BigInteger.valueOf(System.currentTimeMillis()),
                BigInteger.valueOf( Long.parseLong((String) map.get("testResult")) ),
                (String) map.get("remark"),
                (String) map.get("testPicture"),
                (String) map.get("supervisor"),
                true
        );
    }

}
