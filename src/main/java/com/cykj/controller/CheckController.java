package com.cykj.controller;

import com.cykj.bean.MessageBean;
import com.cykj.service.CheckService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 13:11
 */
@Controller
@RequestMapping("/check")
public class CheckController {

    @Resource
    private CheckService checkService;

    @RequestMapping("/getCheckList")
    @ResponseBody
    public MessageBean getCheckList(String areaName, String applyName, String checkState, Integer page, Integer limit) {
        return checkService.getCheckList(areaName, applyName, checkState, page, limit);
    }

    @RequestMapping("/checkInfo")
    @ResponseBody
    public MessageBean checkInfo(Integer checkId, String checkState, Integer renterId,
                                 String areaName, String text, String applyTime, HttpServletRequest req) {
        return checkService.checkInfo(checkId, checkState, renterId, areaName, text, applyTime, req);
    }

    @RequestMapping("/readInfo")
    @ResponseBody
    public MessageBean readInfo(Integer renterId){
        return checkService.readInfo(renterId);
    }

}
