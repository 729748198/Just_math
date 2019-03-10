package com.just.math_world.dao;

import com.just.math_world.entity.Math_world;

import java.util.List;

public interface Math_worldMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Math_world record);

    int insertSelective(Math_world record);

    Math_world selectByPrimaryKey(Integer id);

    /**
     * 获取所有作品
     * @return
     */
    List<Math_world> selectAll();

    /**
     * 获取视频作品
     */
    List<Math_world> selectVdo();
    /**
     * 获取图片作品
     */
    List<Math_world> selectPic();

    /**
     * 获取文章作品
     */
    List<Math_world> selectTxt();
    /**
     * 获取精品作品
     * @return
     */
    List<Math_world> selectJing();
    /**
     * 根据用户名获取所有作品
     * @param name
     * @return
     */
    List<Math_world> selectByUsername(String name);

    int updateByPrimaryKeySelective(Math_world record);

    int updateByPrimaryKeyWithBLOBs(Math_world record);

    int updateByPrimaryKey(Math_world record);
}