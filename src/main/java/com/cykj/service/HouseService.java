package com.cykj.service;

import com.cykj.bean.MessageBean;
import com.cykj.bean.TbHouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/11 23:43
 */
public interface HouseService {

    /**
     * 查询小区
     */
    MessageBean getCommList(Integer toareaId);


    /**
     * 查询楼栋
     */
    MessageBean getRidgeList(Integer comId);


    /**
     * 增加套房
     */
    MessageBean addHouse(String houseInfo);

    /**
     * 删除套房
     */
    MessageBean delHouse(Integer houseId, String houseNumber);

    /**
     * 回收套房
     */
    MessageBean releaseHouse(Integer houseId, String houseRemark);

    /**
     * 修改套房
     */
    MessageBean updateHouse(String updateData);

}
