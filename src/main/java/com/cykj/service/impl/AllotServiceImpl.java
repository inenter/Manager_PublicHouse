package com.cykj.service.impl;

import com.alibaba.fastjson.JSON;
import com.cykj.bean.AreaManager;
import com.cykj.bean.MessageBean;
import com.cykj.bean.TbDistribute;
import com.cykj.mapper.AllotMapper;
import com.cykj.mapper.CheckMapper;
import com.cykj.service.AllotService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 20:50
 */
@Service
public class AllotServiceImpl implements AllotService {

    @Resource
    private AllotMapper allotMapper;
    @Resource
    private CheckMapper checkMapper;

    @Override
    public MessageBean getAllotList(String areaName, String state, String personNum, String name, Integer page, Integer limit) {
        Page<Object> objects = PageHelper.startPage(page, limit);
        List<TbDistribute> allotList = allotMapper.getAllotList(areaName, state, personNum, name);
        for(TbDistribute d: allotList){
            d.setHouseNo();
        }
        int total = (int)objects.getTotal();
        if (allotList.size() > 0){
            return new MessageBean(0, "成功", allotList, total);
        }
        return new MessageBean(0, "失败", null, 0);
    }

    @Override
    public MessageBean saveAllot(Integer houseId, Integer renterId) {
        int n = allotMapper.saveAllot(houseId, renterId);
        if (n > 0){
            return new MessageBean(200, "分配成功");
        }
        return new MessageBean(-200, "分配失败");
    }

    @Override
    public MessageBean delAllot(Integer renterId) {
        int n = allotMapper.delAllot(renterId);
        if (n > 0){
            return new MessageBean(200, "清除成功");
        }
        return new MessageBean(-200, "清除失败");
    }

    @Override
    public MessageBean submitAllot(String allot, HttpServletRequest req) {
        List<TbDistribute> allotList = JSON.parseArray(allot, TbDistribute.class);
        int n = allotMapper.submitAllot(allotList);
        if (n > 0){
            int i = allotMapper.updateHouse(allotList);
            if (i > 0) {
                Integer managerId = (Integer)req.getSession().getAttribute("managerId");
                //当前时间
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String creatTime = sdf.format(date);
                for(int k = 0; k < allotList.size(); k++){
                    TbDistribute b = allotList.get(k);
                    String text =  "您于" +  b.getApplyTime() + "提交的申请的套房已于" + creatTime + "完成分配，祝您生活愉快。";
                    checkMapper.addCheckInformation(b.getRenterId(), managerId, b.getApplyTime(), text);
                }
                return new MessageBean(200, "保存成功");
            }
        }
        return new MessageBean(-200, "保存失败");
    }

    @Override
    public MessageBean delEveryAllot() {
//        System.out.println("接收的数据：" + delData);
//        List<Integer> list = JSON.parseArray(delData, Integer.class);
//        for (Integer k: list) {
//            System.out.println("打印：" + k);
//        }
        int n = allotMapper.delEveryAllot();
        if (n > 0) {
            return new MessageBean(200, "清除成功");
        }
        return new MessageBean(-200, "清除失败");
    }
}
