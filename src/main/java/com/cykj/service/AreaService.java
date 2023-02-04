package com.cykj.service;

import com.cykj.bean.AreaManager;
import com.cykj.bean.MessageBean;
import com.cykj.bean.TbArea;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/6 17:54
 */
public interface AreaService {

    MessageBean getAreaList(
            String action,
            Integer provId,
            Integer cityId,
            String communityName,
            Integer areaId,
            String comName,
            Integer toareaId,
            Integer comId,
            Integer buildingNum,
            String houseRemark,
            String houseNum,
            Integer minArea,
            Integer maxArea,
            Integer page,
            Integer limit);

    List<TbArea> selectArea(int pid);

    /**
     * 删除区域
     */
    MessageBean delTownByAreaId(Integer areaId);

    /**
     * 批量删除
     */
    MessageBean delAllByArray(String idsArray);

    /**
     * 新增区域
     */
    MessageBean addAreaByName(String cityName, String areaName);

    /**
     * 更新区域
     */
    MessageBean updateArea(String updateData);

}
