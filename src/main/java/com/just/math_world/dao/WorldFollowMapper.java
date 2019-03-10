package com.just.math_world.dao;

import com.just.math_world.entity.WorldFollow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorldFollowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WorldFollow record);

    int insertSelective(WorldFollow record);

    WorldFollow selectByPrimaryKey(Integer id);

    /**
     * 获取所有关注
     * @return
     */
    List<WorldFollow> selectall();

    /**
     * 根据用户名获取其关注列表
     * @return 用户名
     */
    List<WorldFollow> selectbyusername(@Param(value = "name") String name);

    int updateByPrimaryKeySelective(WorldFollow record);

    int updateByPrimaryKey(WorldFollow record);
}