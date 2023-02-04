package com.cykj.mapper;

import com.cykj.bean.Power;
import com.cykj.bean.TbManager;
import com.cykj.bean.TbRight;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/13 11:38
 */
public interface ManagerMapper {

    TbManager login(@Param("acc") String acc, @Param("pwd") String pwd);

    List<TbRight> getRight(@Param("acc") String acc);

    int getRoleId(@Param("acc") String acc);

    List<TbManager> getPerson(@Param("name")String name, @Param("acc")String acc,
                              @Param("roleId")Integer roleId, @Param("state")String state);

    int updateData(@Param("managerId") Integer managerId, @Param("updateRole") Integer updateRole,
                   @Param("managerState") String managerState, @Param("resetPwd") String managerPwd);

    TbManager getManager(@Param("managerId")Integer managerId, @Param("managerPwd") String managerPwd);

    int updatePwd(@Param("managerId")Integer managerId, @Param("managerPwd") String managerPwd);

    List<Power> getPower();

    int delPower(Integer roleId);

    int addPower(@Param("roleId") Integer roleId, @Param("rightId") List<Integer> rightId);

    TbManager findPerson(@Param("acc") String acc);

    int addPerson(@Param("acc") String acc, @Param("name") String name, @Param("pwd") String pwd, @Param("roleId") Integer roleId);
}
