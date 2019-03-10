package com.just.math_world.service;

import com.just.math_world.dao.WorldFollowMapper;
import com.just.math_world.entity.WorldFollow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/4 17:21
 */
@Service("WorldFollowService")
public class WorldFollowServiceImpl implements WorldFollowService {

    @Autowired
    WorldFollowMapper mapper;
    @Override
    public List<WorldFollow> getall() {
        return mapper.selectall();
    }

    @Override
    public WorldFollow getbyid(int id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<WorldFollow> getByUsername(String name) {
        return mapper.selectbyusername(name);
    }
}
