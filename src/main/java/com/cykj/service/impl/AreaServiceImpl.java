package com.cykj.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cykj.bean.AreaManager;
import com.cykj.bean.MessageBean;
import com.cykj.bean.TbArea;
import com.cykj.bean.TbHouse;
import com.cykj.mapper.AreaMapper;
import com.cykj.service.AreaService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/6 17:54
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public MessageBean getAreaList(String action, Integer provId, Integer cityId, String communityName, Integer areaId,
                                   String comName,
                                   Integer toareaId,
                                   Integer comId,
                                   Integer buildingNum,
                                   String houseRemark,
                                   String houseNum,
                                   Integer minArea,
                                   Integer maxArea,
                                   Integer page, Integer limit) {
        Page<Object> objects = PageHelper.startPage(page, limit);
        List<AreaManager> areaList = areaMapper.getAreaList(action, provId, cityId, communityName,
                areaId, comName, toareaId, comId, buildingNum, houseRemark, houseNum, minArea, maxArea);
        for (AreaManager t : areaList) {
            t.setRoomNumber();  // 套房号
            t.setHouseType();   // 户型
        }
        int total = (int) objects.getTotal();
        if (areaList.size() > 0) {
            return new MessageBean(0, "成功", areaList, total);
        }
        return new MessageBean(0, "失败", null, 0);
    }

    @Override
    public List<TbArea> selectArea(int pid) {
        List<TbArea> tbArea = areaMapper.selectArea(pid);
        return tbArea;
    }

    @Override
    public MessageBean delTownByAreaId(Integer areaId) {
        MessageBean messageBean = new MessageBean();
        int i = areaMapper.delTown(areaId);
        if (i > 0) {
            messageBean.setCode(200);
            messageBean.setMessage("区域删除成功, 小区删除失败");
            if (areaMapper.delCom(areaId) > 0) {
                messageBean.setMessage("区域和小区全部删除成功");
            }
            return messageBean;
        }
        return new MessageBean(-200, "区域删除失败");
    }

    @Override
    public MessageBean delAllByArray(String idsArray) {
        MessageBean messageBean = new MessageBean();
        List<Integer> integers = JSONArray.parseArray(idsArray, int.class);
        int i = areaMapper.delAll(integers);
        if (i > 0) {
            messageBean.setCode(200);
            messageBean.setMessage("区域删除成功, 小区删除失败");
            if (areaMapper.delAllCom(integers) > 0) {
                messageBean.setMessage("删除" + integers.size() + "个区域，小区全部删除成功");
            }
            return messageBean;
        }
        return new MessageBean(-200, "删除失败");
    }

    @Override
    public MessageBean addAreaByName(String cityName, String areaName) {
        MessageBean messageBean = new MessageBean();
        Integer id = areaMapper.selectAreaIdByCityName(cityName);
        int n = areaMapper.addArea(areaName, id);
        if (n > 0) {
            messageBean.setMessage("添加成功");
        } else {
            messageBean.setMessage("添加失败");
        }
        return messageBean;
    }

    @Override
    public MessageBean updateArea(String updateData) {
        MessageBean messageBean = new MessageBean();
        JSONObject object = JSONObject.parseObject(updateData);
        int n = areaMapper.updateArea(object.getString("areaName"), Integer.valueOf(object.getString("townId")));
        if (n > 0) {
            messageBean.setMessage("编号为" + object.getString("townId") + "的区域更新成功");
        } else {
            messageBean.setMessage("更新失败");
        }
        return messageBean;
    }
}
