package com.cykj.service.impl;

import com.alibaba.fastjson.JSON;
import com.cykj.bean.MessageBean;
import com.cykj.bean.Power;
import com.cykj.bean.TbManager;
import com.cykj.bean.TbRight;
import com.cykj.mapper.ManagerMapper;
import com.cykj.service.ManagerService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/13 11:38
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;
    private MessageBean messageBean =  new MessageBean();
    private String user;
    private Integer userId;

    @Override
    public MessageBean login(String acc, String pwd, HttpServletRequest req) {
        TbManager manager = managerMapper.login(acc, pwd);
        if (manager != null){
            messageBean.setCode(200);
            user = manager.getManagerAcc();
            userId = manager.getManagerId();
            messageBean.setMessage("登录成功");
            HttpSession session = req.getSession();
            session.setAttribute("acc", manager.getManagerName());
            session.setAttribute("managerId", manager.getManagerId());
        }else {
            messageBean.setCode(-200);
            messageBean.setMessage("账号或密码错误！");
        }
        return messageBean;
    }

    @Override
    public MessageBean online(HttpServletRequest req) {
        if (req.getSession().getAttribute("acc") == null){
            messageBean.setCode(505);
        }else {
            messageBean.setCode(-200);
        }
        return messageBean;
    }

    @Override
    public MessageBean getMenu() {
        Integer roleId = managerMapper.getRoleId(user);
        if (roleId.equals(1)){
            messageBean.setMessage("系统管理平台");
        }else if(roleId.equals(2)){
            messageBean.setMessage("房源发布平台");
        }else if(roleId.equals(3)){
            messageBean.setMessage("房源审核平台");
        }
        List<TbRight> right = managerMapper.getRight(user);
        messageBean.setData(right);
        return messageBean;
    }

    @Override
    public MessageBean getPerson(String name, String acc, Integer roleId, String state, Integer page, Integer limit) {
        Page<Object> objects = PageHelper.startPage(page, limit);
        List<TbManager> personList = managerMapper.getPerson(name, acc, roleId, state);
        int total = (int) objects.getTotal();
        if (personList.size() > 0) {
            return new MessageBean(0, "成功", personList, total);
        }
        return new MessageBean(0, "失败", null, 0);
    }

    @Override
    public MessageBean updateData(Integer managerId, Integer updateRole, String managerState, String resetPwd) {
        int i = managerMapper.updateData(managerId, updateRole, managerState, resetPwd);
        if (i > 0){
            messageBean.setMessage("操作成功");
        }else {
            messageBean.setMessage("操作失败");
        }
        return messageBean;
    }

    @Override
    public MessageBean updatePwd(String friPwd, String managerPwd) {
        TbManager manager = managerMapper.getManager(userId, friPwd);
        if (manager != null){
            int i = managerMapper.updatePwd(userId, managerPwd);
            if (i > 0){
                messageBean.setMessage("更改成功");
            }else {
                messageBean.setMessage("更改失败");
            }
        }else {
            messageBean.setMessage("原密码错误");
        }
        return messageBean;
    }

    @Override
    public MessageBean logout(HttpServletRequest req) {
        req.getSession().setAttribute("acc", null);
        messageBean.setCode(200);
        return messageBean;
    }

    @Override
    public MessageBean getPower() {
        List<Power> power = managerMapper.getPower();
        messageBean.setData(power);
        return messageBean;
    }

    @Override
    public MessageBean changePower(Integer roleId, String power) {
        List<Integer> right = JSON.parseArray(power, Integer.class);
        managerMapper.delPower(roleId);     // 删除权限
        managerMapper.addPower(roleId, right);  // 重新添加权限
        messageBean.setMessage("成功");
        return messageBean;
    }

    @Override
    public MessageBean addPerson(String acc, String name, String pwd, Integer roleId) {
        MessageBean messageBean1 = new MessageBean();
        TbManager person = managerMapper.findPerson(acc);
        if (person == null){
            int i = managerMapper.addPerson(acc, name, pwd, roleId);
            if (i > 0){
                messageBean1.setCode(200);
                messageBean1.setMessage("添加成功");
            }else {
                messageBean1.setMessage("添加失败");
            }
        }else {
            messageBean1.setMessage("该账户已存在！");
        }
        return messageBean1;
    }
}
