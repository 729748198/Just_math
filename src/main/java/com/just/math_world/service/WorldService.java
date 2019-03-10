package com.just.math_world.service;

import com.just.math_world.entity.Math_world;

import java.util.List;

/**
 * @author 贺文杰
 * 2018/12/25 16:10
 */
public interface WorldService {
    /**
     * 所有作品
     * @return
     */
    List<Math_world> getall();

    /**
     * 我的小世界
     * @param username
     * @return
     */
    List<Math_world> getbyuser(String username);

    /**
     * 所有精品
     * @return
     */
    List<Math_world> getAllJIng();
    /**
     * 获取图片
     */
    List<Math_world> getAllPic();
    /**
     * 获取文章
     */
    List<Math_world> getAllTxt();
    /**
     * 获取视频
     */
    List<Math_world> getAllVdo();
    /**
     * 新增一条记录
     * @param math_world
     * @return
     */
    int insertByUsername(Math_world math_world);
}
