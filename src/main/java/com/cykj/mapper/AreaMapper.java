package com.cykj.mapper;

import com.cykj.bean.AreaManager;
import com.cykj.bean.TbArea;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/6 18:45
 */
public interface AreaMapper {

    /**
     * 查询区域情况
     */
    List<AreaManager> getAreaList(
                                  @Param("action") String action,
                                  @Param("provId") Integer provId,
                                  @Param("cityId") Integer cityId,
                                  @Param("communityName") String communityName,
                                  @Param("areaId") Integer areaId,
                                  @Param("comName") String comName,
                                  @Param("toareaId") Integer toareaId,
                                  @Param("comId") Integer comId,
                                  @Param("buildingNum") Integer buildingNum,
                                  @Param("houseRemark") String houseRemark,
                                  @Param("houseNum") String houseNum,
                                  @Param("minArea") Integer minArea,
                                  @Param("maxArea") Integer maxArea
                                  );

    /**
     * 查询下拉区域
     */
    List<TbArea> selectArea(@Param("pid") int pid);

    /**
     * 删除area
     * 删除community
     */
    int delTown(@Param("areaId") Integer areaId);

    int delCom(@Param("toareaId") Integer areaId);

    /**
     * 批量删除
     */
    int delAll(@Param("idsArray") List<Integer> integers);

    int delAllCom(@Param("comIds") List<Integer> integers);

    /**
     * 查询市对应areaId
     */
    int selectAreaIdByCityName(@Param("cityName") String cityName);

    /**
     * 新增区域
     */
    int addArea(@Param("areaName") String areaName, @Param("pid") Integer pid);


    /**
     * 更新区域
     */
    int updateArea(@Param("areaName") String areaName, @Param("areaId") Integer areaId);

}
