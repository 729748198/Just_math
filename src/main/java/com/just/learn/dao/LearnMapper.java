package com.just.learn.dao;

import com.just.learn.entity.Learn;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface LearnMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Learn record);

    int insertSelective(Learn record);

    Learn selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Learn record);

    int updateByPrimaryKeyWithBLOBs(Learn record);

    int updateByPrimaryKey(Learn record);

    /**
     * 根据板块名称获取对应资料
     * @param ban
     * @return
     */
    List<Map<String,String>> selectByBan(@Param(value = "ban") String ban);
}