package com.cykj.controller;

import com.cykj.bean.MessageBean;
import com.cykj.service.AllotService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 20:49
 */
@Controller
@RequestMapping("/allot")
public class AllotController {

    @Resource
    private AllotService allotService;

    @RequestMapping("/getAllotList")
    @ResponseBody
    public MessageBean getAllotList(String areaName, String state, String personNum, String name, Integer page, Integer limit){
        return allotService.getAllotList(areaName, state, personNum, name, page, limit);
    }

    @RequestMapping("/saveAllot")
    @ResponseBody
    public MessageBean saveAllot(Integer houseId, Integer renterId){
        return allotService.saveAllot(houseId, renterId);
    }

    @RequestMapping("/delAllot")
    @ResponseBody
    public MessageBean delAllot(Integer renterId){
        return allotService.delAllot(renterId);
    }

    @RequestMapping("/submitAllot")
    @ResponseBody
    public MessageBean submitAllot(String submitData, HttpServletRequest req){
        return allotService.submitAllot(submitData, req);
    }

    @RequestMapping("/delEveryAllot")
    @ResponseBody
    public MessageBean delEveryAllot(){
        return allotService.delEveryAllot();
    }




}
