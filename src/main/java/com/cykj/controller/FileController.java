package com.cykj.controller;

import com.cykj.bean.MessageBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/10 14:08
 */
@Controller
@RequestMapping("/file")
public class FileController {

    @RequestMapping("/upload")
    @ResponseBody
    public MessageBean upload(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){
        MessageBean messageBean = new MessageBean();
        // 获取文件名
        String filename = multipartFile.getOriginalFilename();
        // 获取路径
        String path = request.getServletContext().getRealPath("/WEB-INF/views/resources/imgs");
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        String destName = path + "/" + filename;
        System.out.println("这是接收到的文件：" + destName);
        try {
            multipartFile.transferTo(new File(destName));
            messageBean.setCode(200);
            messageBean.setMessage("图片上传成功");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return messageBean;
    }
}
