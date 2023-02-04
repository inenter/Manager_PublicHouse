package com.cykj.service;

import com.cykj.bean.MessageBean;
import com.cykj.bean.TbDistribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 20:49
 */
public interface AllotService {

    MessageBean getAllotList(String areaName, String state, String personNum, String name, Integer page, Integer limit);

    MessageBean saveAllot(Integer houseId, Integer renterId);

    MessageBean delAllot(Integer renterId);

    MessageBean submitAllot(String allot, HttpServletRequest req);

    MessageBean delEveryAllot();

}
