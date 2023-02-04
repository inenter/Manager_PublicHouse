package com.cykj.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cykj.bean.MessageBean;
import com.cykj.bean.TbHouse;
import com.cykj.mapper.CommMapper;
import com.cykj.service.CommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/10 15:17
 */
@Service
public class CommServiceImpl implements CommService {

    @Autowired
    private CommMapper commMapper;
    private MessageBean messageBean = new MessageBean();
    private List<TbHouse> ensureHouseList = new ArrayList<>();
    private Integer id;

    @Override
    public MessageBean addComm(Integer areaId, String comName, String address, String comImage, Integer parkingNum) {
        int i = commMapper.addComm(areaId, comName, address, comImage, parkingNum);
        if (i > 0) {
            messageBean.setMessage("小区添加成功");
        } else {
            messageBean.setMessage("小区添加失败");
        }
        return messageBean;
    }

    @Override
    public MessageBean updateComm(String comImage, String updateData) {
        MessageBean messageBean = new MessageBean();
        JSONObject object = JSONObject.parseObject(updateData);
        int i = commMapper.updateComm(Integer.valueOf(object.getString("comId")), object.getString("comName"),
                object.getString("address"), comImage, Integer.valueOf(object.getString("parkingNum")));
        if (i > 0) {
            messageBean.setMessage("编号为" + object.getString("comId") + "的小区更新成功");
        } else {
            messageBean.setMessage("编号为" + object.getString("comId") + "的小区失败成功");
        }
        return messageBean;
    }

    @Override
    public MessageBean delComm(Integer comId, String comName) {
        List<TbHouse> list = commMapper.selectComId(comId);  // 查询小区下是否有套房已分配
        if (list.size() > 0) {
            messageBean.setMessage("删除" + comName + "小区失败，该小区下存在已分配的套房");
        } else {
            int i = commMapper.delCom(comId);
            if (i > 0) {
                messageBean.setCode(200);
                messageBean.setMessage("删除" + comName + "小区成功");
                int n = commMapper.delHouse(comId);
                if (n > 0) {
                    messageBean.setMessage("删除" + comName + "小区及以下所有套房成功");
                }
            }
        }
        return messageBean;
    }

    @Override
    public MessageBean addHouse(Integer comId, String arrHouse) {
        StringBuffer sameHouse = new StringBuffer();
        StringBuffer notSameHouse = new StringBuffer();
        List<TbHouse> list = JSON.parseArray(arrHouse, TbHouse.class);
        // 先查询数据库中是否存在相同编号的套房
        List<TbHouse> houseList = commMapper.getHouseList(comId);
        // 比较查询结果
        for (int i = 0; i < houseList.size(); i++) {
            TbHouse house = houseList.get(i);
            Integer buildingNum = house.getBuildingNum();
            Integer houseNum = Integer.valueOf(house.getHouseNum());
            for (int k = 0; k < list.size(); k++) {
                TbHouse h = list.get(k);
                Integer hBuildingNum = h.getBuildingNum();
                // 先比较是否未同一栋
                if (buildingNum.equals(hBuildingNum)) {
                    Integer hHouseNum = Integer.valueOf(h.getHouseNum());
                    if (houseNum.equals(hHouseNum)) {
                        list.remove(h);     // 将相同的套房去除
                        String str = hBuildingNum + "#" + hHouseNum + "，";
                        sameHouse.append(str);   // 将相同的套房另外存储
                    }
                }
            }
        }
        // 将不存在的套房编号插入数据库
        if (!"".contentEquals(sameHouse)) {
            messageBean.setCode(200);
            messageBean.setMessage(sameHouse + "套房已存在，添加失败。");
            if (list.size() > 0){
                int k = commMapper.addHouse(comId, list);
                if (k > 0){
                    messageBean.setMessage(sameHouse + "套房已存在，添加失败。其余套房添加成功");
                }
            }
        }else {
            id = comId;
            ensureHouseList = list;
        }
        return messageBean;
    }

    @Override
    public MessageBean ensureAddHouse() {
        int n = commMapper.addHouse(id, ensureHouseList);
        if (n > 0){
            messageBean.setMessage("套房添加成功");
        }else {
            messageBean.setMessage("套房添加失败");
        }
        return messageBean;
    }
}
