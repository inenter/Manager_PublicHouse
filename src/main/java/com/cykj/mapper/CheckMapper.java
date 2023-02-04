package com.cykj.mapper;

import com.cykj.bean.TbApply;
import com.cykj.bean.TbCheck;
import com.cykj.bean.TbFamily;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 13:16
 */
public interface CheckMapper {

    /**
     * 查询申请列表
     */
    List<TbCheck> getCheckList(@Param("areaName") String areaName, @Param("applyName") String applyName, @Param("checkState") String checkState);

    /**
     * 审核信息
     */
    int checkInfo(@Param("checkId") Integer checkId, @Param("checkState") String checkState);

    /**
     * 添加信息
     */
    int addCheckInformation(@Param("renterId") Integer renterId, @Param("managerId")Integer managerId,
                            @Param("creatTime") String creatTime, @Param("messageText") String messageText);

    /**
     * 查询申请人信息
     */
    List<TbApply> selectApplyById(@Param("renterId")int renterId);

    /**
     * 查询家庭成员信息
     */
    List<TbFamily> selectFamilyById(@Param("renterId")int renterId);
}
