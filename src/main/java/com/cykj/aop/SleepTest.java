package com.cykj.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/23 11:26
 */
public class SleepTest {
    public static void main(String[] args) {
        // 加载配置文件
        String path = "applicationContext_aop.xml";
        ApplicationContext app = new ClassPathXmlApplicationContext(path);
        SleepHelper lqb = (SleepHelper)app.getBean("proxy");
        lqb.sleep();
    }
}
