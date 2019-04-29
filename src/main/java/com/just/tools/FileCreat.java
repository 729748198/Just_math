package com.just.tools;

import org.apache.log4j.Logger;

import java.io.File;

public class FileCreat {

     static Logger logger=Logger.getLogger(FileCreat.class);

    public  static void creat(String url){
        File filePath = new File(url);
        logger.info("文件保存路径：" + url);
        if (!filePath.exists() && !filePath.isDirectory()) {
            logger.info("目录不存在，创建目录：" + filePath);
            boolean flag=filePath.mkdirs();
            if(flag){
                logger.info("创建成功");
            }
        }
    }
}
