package com.cykj.aop;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/23 10:55
 */
@Component("sleepPlus")
public class SleepPlus implements MethodBeforeAdvice, AfterReturningAdvice {

    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        System.out.println("睡觉前-------------");
        System.out.println("地点的方法名：" + method.getName());
        System.out.println("参数："  + objects);
        System.out.println("目标对象：" + o.getClass().getName());
    }

    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        System.out.println("睡觉后-------------");
        System.out.println(o.getClass().getName());
//        System.out.println("地点的方法名：" + method.getName());
//        System.out.println("参数："  + objects);
//        System.out.println("目标对象：" + o1.getClass().getName());
    }
}
