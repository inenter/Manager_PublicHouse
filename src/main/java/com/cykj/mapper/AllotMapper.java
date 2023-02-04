package com.cykj.mapper;

import com.cykj.bean.AreaManager;
import com.cykj.bean.TbDistribute;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/14 20:50
 */
public interface AllotMapper {

    List<TbDistribute> getAllotList(@Param("areaName") String areaName, @Param("state") String state,
                                    @Param("personNum") String personNum, @Param("name") String name);

    int saveAllot(@Param("houseId") Integer houseId, @Param("renterId") Integer renterId);

    int delAllot(@Param("renterId") Integer renterId);

    int submitAllot(@Param("allot") List<TbDistribute> allot);

    int updateHouse(@Param("allot") List<TbDistribute> allot);

    int delEveryAllot();
}
