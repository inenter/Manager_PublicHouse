package com.cykj.mapper;

import com.cykj.bean.TbCommunity;
import com.cykj.bean.TbHouse;
import org.apache.ibatis.annotations.Param;

import javax.annotation.security.PermitAll;
import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/11 23:57
 */
public interface HouseMapper {

    /**
     * 小区
     */
    List<TbCommunity> getCommList(@Param("toareaId") Integer toareaId);

    /**
     * 楼栋
     */
    List<TbHouse> getRidgeList(@Param("comId") Integer comId);

    /**
     * 增加套房
     */
    int addHouse(TbHouse tbHouse);

    /**
     * 查询套房
     */
    TbHouse findHouseNum(@Param("comId") Integer comId,
                         @Param("buildingNum") Integer buildingNum,
                         @Param("houseNum") String houseNum);

    /**
     * 删除套房
     */
    int delHouse(@Param("houseId") Integer houseId);

    /**
     * 回收套房
     */
    int releaseHouse(@Param("houseId") Integer houseId, @Param("houseRemark") String houseRemark);

    /**
     * 修改套餐
     */
    int updateHouse(TbHouse tbHouse);

}
