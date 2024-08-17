package com.sky.service;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface WxCommonService {
    void uploadImg(MultipartFile file);

    ResponseEntity<byte[]> getImageBytesById(Long id);
}
