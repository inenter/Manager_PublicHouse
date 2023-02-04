package com.cykj.controller;

import com.cykj.bean.MessageBean;
import com.cykj.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/13 11:37
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping("/login")
    @ResponseBody
    public MessageBean login(String acc, String pwd, HttpServletRequest req){
        return managerService.login(acc, pwd, req);
    }

    @RequestMapping("/online")
    @ResponseBody
    public MessageBean online(HttpServletRequest req){
        return managerService.online(req);
    }

    @RequestMapping("/menu")
    @ResponseBody
    public MessageBean menu(){
        return managerService.getMenu();
    }

    @RequestMapping("/personList")
    @ResponseBody
    public MessageBean personList(String name, String acc, Integer roleId, String state, Integer page, Integer limit) {
        return managerService.getPerson(name, acc, roleId, state, page, limit);
    }

    @RequestMapping("/updateData")
    @ResponseBody
    public MessageBean delPerson(Integer managerId, Integer updateRole, String managerState, String resetPwd){
        return managerService.updateData(managerId, updateRole, managerState, resetPwd);
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public MessageBean updatePwd(String friPwd, String managerPwd){
        return managerService.updatePwd(friPwd, managerPwd);
    }

    @RequestMapping("/logout")
    @ResponseBody
    public MessageBean logout(HttpServletRequest req){
        return managerService.logout(req);
    }

    @RequestMapping("/getPower")
    @ResponseBody
    public MessageBean getPower(){
        return managerService.getPower();
    }

    @RequestMapping("/changePower")
    @ResponseBody
    public MessageBean changePower(Integer roleId, String power){
        return managerService.changePower(roleId, power);
    }

    @RequestMapping("addPerson")
    @ResponseBody
    public MessageBean addPerson(String acc, String name, String pwd, Integer roleId){
        return managerService.addPerson(acc, name, pwd, roleId);
    }

}
