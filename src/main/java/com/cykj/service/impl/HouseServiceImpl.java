package com.cykj.service.impl;

import com.alibaba.fastjson.JSON;
import com.cykj.bean.MessageBean;
import com.cykj.bean.TbHouse;
import com.cykj.mapper.HouseMapper;
import com.cykj.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/11 23:43
 */
@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseMapper houseMapper;
    private MessageBean messageBean = new MessageBean();

    @Override
    public MessageBean getCommList(Integer toareaId) {
        messageBean.setCode(200);
        messageBean.setData(houseMapper.getCommList(toareaId));
        return messageBean;
    }

    @Override
    public MessageBean getRidgeList(Integer comId) {
        messageBean.setCode(200);
        messageBean.setData(houseMapper.getRidgeList(comId));
        return messageBean;
    }

    @Override
    public MessageBean addHouse(String houseInfo) {
        TbHouse obj = JSON.parseObject(houseInfo, TbHouse.class);
        Integer comId = obj.getTocommunityId();
        Integer buildingNum = obj.getBuildingNum();
        String houseNum = obj.getHouseNum();
        TbHouse house = houseMapper.findHouseNum(comId, buildingNum, houseNum);
        if (house == null){
            messageBean.setCode(200);
            int n = houseMapper.addHouse(obj);
            if (n > 0){
                messageBean.setMessage("添加成功");
            }else {
                messageBean.setMessage("添加失败");
            }
        }else {
            messageBean.setCode(-200);
            messageBean.setMessage(buildingNum + "#" + houseNum + "套房已存在，添加失败。");
        }
        return messageBean;
    }

    @Override
    public MessageBean delHouse(Integer houseId, String houseNumber) {
        int n = houseMapper.delHouse(houseId);
        if (n > 0){
            messageBean.setCode(200);
            messageBean.setMessage("删除" + houseNumber + "套房成功");
        }else {
            messageBean.setMessage("删除失败");
        }
        return messageBean;
    }

    @Override
    public MessageBean releaseHouse(Integer houseId, String houseRemark) {
        int n = houseMapper.releaseHouse(houseId, houseRemark);
        String str = (houseRemark.equals("已回收")) ? "回收":"发布";
        if (n > 0) {
            messageBean.setCode(200);
            messageBean.setMessage(str + "成功");
        }else {
            messageBean.setMessage(str + "失败");
        }
        return messageBean;
    }

    @Override
    public MessageBean updateHouse(String updateData) {
        TbHouse house = JSON.parseObject(updateData, TbHouse.class);
        System.out.println("更新：" + house.toString());
        int n = houseMapper.updateHouse(house);
        if (n > 0){
            messageBean.setMessage("修改成功");
        }else {
            messageBean.setMessage("修改失败");
        }
        return messageBean;
    }
}
