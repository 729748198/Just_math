package com.just.math_world.service;

import com.just.math_world.entity.WorldFollow;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/4 17:20
 */

public interface WorldFollowService {
    /**
     * 获取所有关注列表
     * @return
     */
    List<WorldFollow> getall();

    /**
     * 根据ID获取实体
     * @param id
     * @return
     */
    WorldFollow getbyid(int id);

    /**
     * 根据用户名获取关注列表
     * @param name
     * @return
     */
    List<WorldFollow> getByUsername(String name);
}
