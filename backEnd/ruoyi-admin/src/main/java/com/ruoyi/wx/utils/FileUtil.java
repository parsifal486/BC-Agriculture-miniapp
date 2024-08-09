package com.ruoyi.wx.utils;

import java.io.File;
import java.io.FileOutputStream;

public class FileUtil {

    //上传文件的工具类
    public static void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(filePath+fileName);
        out.write(file);
        out.flush();
        out.close();
    }
}
