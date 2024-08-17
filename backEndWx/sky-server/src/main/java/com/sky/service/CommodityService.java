package com.sky.service;


import com.sky.result.PageResult;

import java.util.List;

public interface CommodityService {




    PageResult queryAll();

    PageResult queryCommodityByType(String partitionName);

    List<String> queryAllType();
}
