package com.ruoyi.wx.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.wx.result.Result;
import com.ruoyi.wx.service.impl.WxCommonServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@Anonymous
@Slf4j
@RestController
@RequestMapping("/wx/common")

public class WxCommonController {
    @Resource
    private WxCommonServiceImpl common;

    @PostMapping("/doupload")
    public Result upLoadImg(@RequestParam("file") MultipartFile file){
        common.uploadImg(file);
        return Result.success();
    }
}
