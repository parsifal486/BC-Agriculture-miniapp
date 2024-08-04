package com.ruoyi.web.controller.reception;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
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
import java.util.HashMap;
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
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                if(commodityName.equals(agricultureClient.queryCommodity(BigInteger.valueOf(l)).commodityName))
                {
                    return AjaxResult.success(agricultureClient.queryCommodity(BigInteger.valueOf(l)));
                }
            }
        return null;
    }

    @RequestMapping("/findAllBlockOriginBySupervisor")
    public TableDataInfo findAllBlockOriginBySupervisor(String supervisor) throws ContractException {
        startPage();
        com.ruoyi.web.controller.contract.Agriculture.Struct0 struct0=null;
        List<com.ruoyi.web.controller.contract.Agriculture.Struct0> list=new ArrayList<>();
        if (supervisor!=null) {
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                struct0=agricultureClient.queryCommodity(BigInteger.valueOf(l));
                if (supervisor.equals(struct0.supervisor)) {
                    list.add(struct0);
                }
            }
        }
        return getDataTable(list);
    }

    @RequestMapping("/findAllBlockOriginByCommodityId")
    public AjaxResult findAllBlockOriginByCommodityId(Long commodityId) throws ContractException {
        return AjaxResult.success(agricultureClient.queryCommodity(BigInteger.valueOf(commodityId)));
    }


    @RequestMapping("/findAllBlockOrigin")
    public TableDataInfo findAllBlockOrigin() throws ContractException {
//        startPage();
        com.ruoyi.web.controller.contract.Agriculture.Struct0 struct0=null;
        List<com.ruoyi.web.controller.contract.Agriculture.Struct0> list=new ArrayList<>();
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                list.add(agricultureClient.queryCommodity(BigInteger.valueOf(l)));
            }
            return getDataTable(list);
    }


    @RequestMapping("/deleteBlockOrigin")
    public void deleteBlockOriginById(Long commodityId)
    {
        sysUserViewMapper.deleteOriginId(commodityId);
        agricultureClient.deleteCommodity(BigInteger.valueOf(commodityId));
    }

    @RequestMapping("/findAllBlockTransport")
    public TableDataInfo findAllBlockTransport(Long commodityId) throws ContractException {
        startPage();
        com.ruoyi.web.controller.contract.Agriculture.Struct1 struct1=null;
        List<com.ruoyi.web.controller.contract.Agriculture.Struct1> list=new ArrayList<>();
        if (commodityId==null)
        {
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                list.add(agricultureClient.queryTransport(BigInteger.valueOf(l)));
            }
            return getDataTable(list);
        }
        else {
            List<CustomCoordinates.Point> pointList= new ArrayList<>();
            struct1=agricultureClient.queryTransport(BigInteger.valueOf(commodityId));
            CustomCoordinates customCoordinates = CustomCoordinates.generateRandomCoordinates(new CustomCoordinates.Point(struct1.transportX.longValue(), struct1.transportY.longValue()));
            pointList.add(customCoordinates.getStartPoint());
            pointList.add(customCoordinates.getMidPoint());
            pointList.add(customCoordinates.getEndPoint());
//            list.add(struct1);
            return getDataTable(pointList);
        }
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
                BigInteger.valueOf(sysUserViewMapper.getOriginIdByName((String) map.get("commodity_name"))),
                (String) map.get("commodity_name"),
                (String) map.get("commodity_transport"),
                BigInteger.valueOf(System.currentTimeMillis()),
                BigInteger.valueOf( Long.valueOf((String) map.get("transport_x")) ),
                BigInteger.valueOf( Long.valueOf((String) map.get("transport_y")) ),
                (String) map.get("remark"),
                BigInteger.valueOf( Long.valueOf((String) map.get("transport_status")) ),
                (String) map.get("supervisor"),
                true
        );
    }

    @RequestMapping("/findAllBlockSell")
    public TableDataInfo findAllBlockSell(Long commodityId) throws ContractException {
        startPage();
        List<com.ruoyi.web.controller.contract.Agriculture.Struct2> list=new ArrayList<>();
        if (commodityId==null)
        {
            for (Long l:sysUserViewMapper.selectAllOriginId())
            {
                list.add(agricultureClient.querySell(BigInteger.valueOf(l)));
            }
            return getDataTable(list);
        }
        else {
            list.add(agricultureClient.querySell(BigInteger.valueOf(commodityId)));
            return getDataTable(list);
        }
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
                BigInteger.valueOf(sysUserViewMapper.getOriginIdByName((String) map.get("commodity_name"))),
                (String) map.get("commodity_name"),
                BigInteger.valueOf(System.currentTimeMillis()),
                BigInteger.valueOf( Long.valueOf((String) map.get("test_result")) ),
                (String) map.get("remark"),
                (String) map.get("test_picture"),
                (String) map.get("supervisor"),
                true
        );

    }

}