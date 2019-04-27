package com.just.ti.dao;

import com.just.ti.entity.TiBan;
import org.apache.ibatis.annotations.Param;

public interface TiBanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TiBan record);

    int insertSelective(TiBan record);

    TiBan selectByPrimaryKey(Integer id);

    /**
     * 根据板块查找对应章节的实体
     * @param ban 板块
     * @return
     */
    TiBan selectByBan(@Param(value = "ban") String ban);

    int updateByPrimaryKeySelective(TiBan record);

    int updateByPrimaryKey(TiBan record);
}