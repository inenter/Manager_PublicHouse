package com.cykj.service;

import com.cykj.bean.MessageBean;
import com.cykj.bean.TbHouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/10 15:14
 */
public interface CommService {

    /**
     * 增加小区
     */
    MessageBean addComm(Integer areaId, String comName, String address, String comImage, Integer parkingNum);

    /**
     * 更新小区
     */
    MessageBean updateComm(String comImage, String updateData);

    /**
     * 删除小区
     */
    MessageBean delComm(Integer comId, String comName);

    /**
     * 添加套餐
     */
    MessageBean addHouse(Integer comId, String arrHouse);

    /**
     * 确认添加套房
     */
    MessageBean ensureAddHouse();

}


