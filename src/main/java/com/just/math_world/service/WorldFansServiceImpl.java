package com.just.math_world.service;

import com.just.math_world.dao.WorldFansMapper;
import com.just.math_world.entity.Math_world;
import com.just.math_world.entity.WorldFans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/4 19:11
 */
@Service("WorldFansServiceImpl")
public class WorldFansServiceImpl implements WorldFansService {
    @Autowired
    WorldFansMapper mapper;

    @Override
    public WorldFans selectbyid(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<WorldFans> selectByUsername(String name) {
        return mapper.selectByUsername(name);
    }


}
