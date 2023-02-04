package com.cykj.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cykj.bean.MessageBean;
import com.cykj.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/11 23:42
 */
@Controller
@RequestMapping("/houseManager")
public class HouseController {

    @Autowired
    private HouseService houseService;

    /**
     * 查询小区
     */
    @RequestMapping("/findComm")
    @ResponseBody
    public MessageBean getComm(Integer toareaId) {
        return houseService.getCommList(toareaId);
    }

    /**
     * 查询楼栋
     */
    @RequestMapping("/findRidge")
    @ResponseBody
    public MessageBean getRidge(Integer comId) {
        return houseService.getRidgeList(comId);
    }

    /**
     * 增加套房
     */
    @RequestMapping("/addHouse")
    @ResponseBody
    public MessageBean addHouse(String houseInfo) {
        return houseService.addHouse(houseInfo);
    }

    /**
     * 删除套房
     */
    @RequestMapping("/delHouse")
    @ResponseBody
    public MessageBean delHouse(Integer houseId, String houseNumber) {
        return houseService.delHouse(houseId, houseNumber);
    }

    /**
     * 套房回收
     */
    @RequestMapping("/releaseHouse")
    @ResponseBody
    public MessageBean releaseHouse(Integer houseId, String houseRemark){
        return houseService.releaseHouse(houseId, houseRemark);
    }

    /**
     * 修改套房
     */
    @RequestMapping("/updateHouse")
    @ResponseBody
    public MessageBean updateHouse(String updateData){
        return houseService.updateHouse(updateData);
    }

}
