package com.just.math_world.dao;

import com.just.math_world.entity.WorldFans;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorldFansMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WorldFans record);

    int insertSelective(WorldFans record);

    WorldFans selectByPrimaryKey(Integer id);

    /**
     * 根据用户名获取粉丝列表
     * @param name
     * @return
     */
    List<WorldFans> selectByUsername(@Param(value = "name") String name);
    int updateByPrimaryKeySelective(WorldFans record);

    int updateByPrimaryKey(WorldFans record);
}