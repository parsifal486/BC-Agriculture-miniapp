package com.sky.controller.blockChain;

import com.sky.client.AgricultureClient;
import com.sky.contract.Agriculture;
import com.sky.mapper.SysUserViewMapper;
import com.sky.result.PageResult;
import com.sky.result.Result;
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
public class BlockController  {

    @Autowired
    SysUserViewMapper sysUserViewMapper;

    @Autowired
    AgricultureClient agricultureClient;

    @RequestMapping("/findAllBlockOriginByCommodityId")
    public Result<PageResult> findAllBlockOriginByCommodityId(Long commodityId) throws ContractException {
        List<Agriculture.Struct0> list=new ArrayList<>();
        list.add(agricultureClient.queryCommodity(BigInteger.valueOf(commodityId)));
        PageResult pageResult = new PageResult();
        pageResult.setRecords(list);
        return Result.success(pageResult);
    }
}
