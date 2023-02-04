package com.cykj.aop;

import org.springframework.stereotype.Component;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/23 10:42
 */

@Component("lqb")
public class Lqb implements SleepHelper {

    @Override
    public String sleep() {
        System.out.println("睡觉");
        return "sleep";
    }
}
