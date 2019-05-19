package com.just.math_world.service;

import com.just.math_world.dao.Math_worldMapper;
import com.just.math_world.entity.Math_world;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2018/12/25 16:13
 */
@Service("WorldServiceImpl")
public class WorldServiceImpl implements WorldService{

    @Autowired
    Math_worldMapper math_worldMapper;
    @Override
    public List<Math_world> getall() {
        return math_worldMapper.selectAll();
    }

    @Override
    public List<Math_world> getbyuser(String username) {
        return math_worldMapper.selectByUsername(username);
    }

    @Override
    public List<Math_world> getAllJIng() {
        return math_worldMapper.selectJing();
    }

    @Override
    public List<Math_world> getAllPu() {
        return math_worldMapper.selectPu();
    }

    @Override
    public List<Math_world> getAllPic() {
        return math_worldMapper.selectPic();
    }

    @Override
    public List<Math_world> getAllTxt() {
        return math_worldMapper.selectTxt();
    }

    @Override
    public List<Math_world> getAllVdo() {
        return math_worldMapper.selectVdo();
    }

    @Override
    public int insertByUsername(Math_world math_world) {
        return math_worldMapper.insertSelective(math_world);
    }

    @Override
    public int updataBySelect(Math_world math_world) {
        return math_worldMapper.insertSelective(math_world);
    }
}
