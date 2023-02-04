package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/6 20:48
 */
@Controller
public class JSPController {

    @RequestMapping("/login")
    public String login(){
        return "jsp/login";
    }

    @RequestMapping("/index")
    public String index(){
        return "jsp/index";
    }

    @RequestMapping("/managerArea")
    public String managerArea(){
        return "jsp/managerArea";
    }

    @RequestMapping("/managerHouse")
    public String managerHouse(){
        return "jsp/managerHouse";
    }

    @RequestMapping("/managerTown")
    public String managerTown(){
        return "jsp/managerTown";
    }

    @RequestMapping("/managerEmp")
    public String managerEmp(){
        return "jsp/managerEmp";
    }

    @RequestMapping("/managerRight")
    public String managerRight(){
        return "jsp/managerRight";
    }

    @RequestMapping("managerCheck")
    public String managerCheck(){
        return "jsp/managerCheck";
    }

    @RequestMapping("managerAllot")
    public String managerAllot(){
        return "jsp/managerAllot";
    }

    @RequestMapping("managerAnalyze")
    public String managerAnalyze(){
        return "jsp/managerAnalyze";
    }

}
