package com.ruoyi.wx.service.impl;

import com.ruoyi.wx.mappers.CommonMapper;
import com.ruoyi.wx.service.WxCommonService;
import com.ruoyi.wx.utils.FileUtil;
import com.ruoyi.wx.utils.ThreadLocalUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Service
public class WxCommonServiceImpl implements WxCommonService {

@Resource
private CommonMapper commonMapper;
    @Override
    public void uploadImg(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        // 图片存放的文件夹地址
        String filePath = "";
        // 文件夹地址 + 名字 = 图片的路径
        String fileAddress = filePath + fileName;
        try {
            FileUtil.uploadFile(file.getBytes(),filePath,fileName);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        commonMapper.uploadAdressById(ThreadLocalUtils.getCurrentId(),fileAddress);
    }

    @Override
    public ResponseEntity<byte[]> getImageBytesById(Long id) {
        String fileAddress= commonMapper.getAddressById(id);
        if(fileAddress!=null){
            File file = new File(fileAddress);
            if(file.exists()){
                try {
                    byte[] imageBytes = Files.readAllBytes(Paths.get(fileAddress));
                    return ResponseEntity.ok().body(imageBytes);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }

            }
        }

            return ResponseEntity.ok().body(null);



    }


}
