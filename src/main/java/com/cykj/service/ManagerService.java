package com.cykj.service;

import com.cykj.bean.MessageBean;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/13 11:38
 */
public interface ManagerService {

    MessageBean login(String acc, String pwd, HttpServletRequest req);

    MessageBean online(HttpServletRequest req);

    MessageBean getMenu();

    MessageBean getPerson(String name, String acc, Integer roleId, String state, Integer page, Integer limit);

    MessageBean updateData(Integer managerId, Integer updateRole, String managerState, String resetPwd);

    MessageBean updatePwd(String friPwd, String managerPwd);

    MessageBean logout(HttpServletRequest req);

    MessageBean getPower();

    MessageBean changePower(Integer roleId, String power);

    MessageBean addPerson(String acc, String name, String pwd, Integer roleId);

}
