package com.cykj.service.impl;

import com.cykj.bean.MessageBean;
import com.cykj.bean.TbApply;
import com.cykj.bean.TbCheck;
import com.cykj.bean.TbFamily;
import com.cykj.mapper.CheckMapper;
import com.cykj.service.CheckService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 13:27
 */
@Service
public class CheckServiceImpl implements CheckService {

    @Resource
    private CheckMapper checkMapper;

    @Override
    public MessageBean getCheckList(String areaName, String applyName, String checkState, Integer page, Integer limit) {
        Page<Object> objects = PageHelper.startPage(page, limit);
        List<TbCheck> checkList = checkMapper.getCheckList(areaName, applyName, checkState);
        int total = (int) objects.getTotal();
        if (checkList.size() > 0) {
            return new MessageBean(0, "成功", checkList, total);
        }
        return new MessageBean(0, "失败", null, 0);
    }

    @Override
    public MessageBean checkInfo(Integer checkId, String checkState, Integer renterId,
                                 String areaName, String text, String applyTime, HttpServletRequest req) {
        MessageBean messageBean = new MessageBean();
        int i = checkMapper.checkInfo(checkId, checkState); // 改变状态
        if (i > 0) {
            //当前时间
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String creatTime = sdf.format(date);
            // 获取管理员id
            Integer managerId = (Integer) req.getSession().getAttribute("managerId");
            // 插入信息 通知租客
            String messageText = null;
            if (text == null) {
                messageText = "您于" + applyTime + "提交的申请" + areaName + "公租房资格资料已于" + creatTime + "通过审核，请您静待套房分配的消息。";
            } else {
                messageText = "您于" + applyTime + "提交的申请" + areaName + "公租房资格资料已于" + creatTime + "审核未通过，原因：" + text + ", 非常抱歉。";
            }
            int n = checkMapper.addCheckInformation(renterId, managerId, creatTime, messageText);
            if (n > 0) {
                messageBean.setCode(200);
                messageBean.setMessage("操作成功");
            } else {
                messageBean.setMessage("操作失败");
            }
        } else {
            messageBean.setMessage("操作失败");
        }
        return messageBean;
    }

    @Override
    public MessageBean readInfo(Integer renterId) {
        MessageBean messageBean = new MessageBean();
        List<Object> list = new ArrayList<>();
        // 查询申请人信息
        List<TbApply> applyList = checkMapper.selectApplyById(renterId);
        System.out.println(applyList);
        list.add(applyList);
        // 查询家庭成员信息
        List<TbFamily> familyList = checkMapper.selectFamilyById(renterId);
        System.out.println(familyList);
        list.add(familyList);
        messageBean.setCode(200);
        messageBean.setData(list);
        return messageBean;
    }
}
