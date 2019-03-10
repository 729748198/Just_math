package com.just.math_world.service;

import com.just.math_world.entity.Math_world;
import com.just.math_world.entity.WorldFans;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/4 19:11
 */
public interface WorldFansService {
       /**
        * 根据ID查找粉丝
        * @param id
        * @return
        */
       WorldFans selectbyid(Integer id);

       /**
        * 根据用户名查找粉丝列表
        */
       List<WorldFans> selectByUsername(String name);


}
