package com.cykj.service;

import com.cykj.bean.MessageBean;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 13:27
 */
public interface CheckService {

    MessageBean getCheckList(String areaName, String applyName, String checkState, Integer page, Integer limit);

    MessageBean checkInfo(Integer checkId, String checkState, Integer renterId,
                          String areaName, String text, String applyTime, HttpServletRequest req);

    MessageBean readInfo(Integer renterId);
}
