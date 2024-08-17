package com.sky.controller.user;


import com.sky.result.Result;
import com.sky.service.impl.WxCommonServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;


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

    @GetMapping("getimage")
    public ResponseEntity<byte[]> getImageById(@RequestParam Long userId){
        ResponseEntity<byte[]> imageBytesById = common.getImageBytesById(userId);
        return imageBytesById;
    }


}
