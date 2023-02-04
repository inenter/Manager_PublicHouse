package com.cykj.controller;

import com.cykj.bean.MessageBean;
import com.cykj.service.CommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/10 15:12
 */
@Controller
@RequestMapping("/commManager")
public class CommController {

    @Autowired
    private CommService commService;

    /**
     * 增加小区
     */
    @RequestMapping("/addComm")
    @ResponseBody
    public MessageBean addComm(Integer areaId, String comName, String address, String comImage, Integer parkingNum){
        return commService.addComm(areaId, comName, address, comImage, parkingNum);
    }

    /**
     * 更新小区
     */
    @RequestMapping("/updateComm")
    @ResponseBody
    public MessageBean updateComm(String comImage, String updateData){
        return commService.updateComm(comImage, updateData);
    }

    /**
     * 删除小区
     */
    @RequestMapping("/delComm")
    @ResponseBody
    public MessageBean delComm(Integer comId, String comName){
        return commService.delComm(comId, comName);
    }

    /**
     * 添加套房
     */
    @RequestMapping("/addHouse")
    @ResponseBody
    public MessageBean addHouse(Integer comId, String arrHouse){
        return commService.addHouse(comId, arrHouse);
    }

    @RequestMapping("/ensureAddHouse")
    @ResponseBody
    public MessageBean ensureAddHouse(){
        return commService.ensureAddHouse();
    }

}
