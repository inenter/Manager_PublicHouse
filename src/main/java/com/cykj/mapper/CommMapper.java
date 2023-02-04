package com.cykj.mapper;

import com.cykj.bean.TbHouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/10 15:17
 */
public interface CommMapper {

    int addComm(@Param("areaId") Integer areaId,
                @Param("comName") String comName,
                @Param("address") String address,
                @Param("comImage") String comImage,
                @Param("parkingNum") Integer parkingNum);

    int updateComm(
            @Param("comId") Integer comId,
            @Param("comName") String comName, @Param("address") String address,
            @Param("comImage") String comImage, @Param("parkingNum") Integer parkingNum);

    int delCom(@Param("comId") Integer comId);

    int delHouse(@Param("comId") Integer comId);

    List<TbHouse> selectComId(@Param("comId") Integer comId);

    int addHouse(@Param("comId") Integer comId, @Param("houseList") List<TbHouse> houseList);

    List<TbHouse> getHouseList(@Param("comId") Integer comId);
    
}
