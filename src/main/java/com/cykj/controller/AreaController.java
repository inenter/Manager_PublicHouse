package com.cykj.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cykj.bean.AreaManager;
import com.cykj.bean.MessageBean;
import com.cykj.bean.TbArea;
import com.cykj.service.AreaService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/6 18:45
 */
@Controller
@RequestMapping("/distribute")
public class AreaController {

    @Autowired
    public AreaService areaService;

    /**
     * 查询区域
     */
    @RequestMapping("/findArea")
    @ResponseBody
    public MessageBean findArea(@RequestParam("pid") Integer pid) {
        List<TbArea> tbAreas = areaService.selectArea(pid);
        System.out.println("123");
        return new MessageBean(200, "成功", tbAreas, null);
    }


    @RequestMapping("/areaList")
    @ResponseBody
    public MessageBean getAreaList(
                                    String action,
                                    Integer provId,
                                    Integer cityId,
                                    String areaName,
                                    Integer areaId,
                                    String comName,
                                    Integer toareaId,
                                    Integer comId,
                                    Integer buildingNum,
                                    String houseRemark,
                                    String houseNum,
                                    Integer minArea,
                                    Integer maxArea,
                                    Integer page,
                                    Integer limit) {
        return areaService.getAreaList(action, provId, cityId, areaName, areaId, comName,
                toareaId, comId, buildingNum, houseRemark, houseNum,
                minArea, maxArea, page, limit);
    }

    @RequestMapping("/delTown")
    @ResponseBody
    public MessageBean delTown(Integer areaId) {
        return areaService.delTownByAreaId(areaId);
    }

    @RequestMapping("/delAll")
    @ResponseBody
    public MessageBean delAll(String idsArray) {
        return areaService.delAllByArray(idsArray);
    }

    /**
     * 添加区域
     */
    @RequestMapping("/addArea")
    @ResponseBody
    public MessageBean addArea(String cityName, String areaName) {
        return areaService.addAreaByName(cityName, areaName);
    }

    /**
     * 修改信息
     */
    @RequestMapping("/updateArea")
    @ResponseBody
    public MessageBean updateArea(String updateData) {
        return areaService.updateArea(updateData);
    }

}
