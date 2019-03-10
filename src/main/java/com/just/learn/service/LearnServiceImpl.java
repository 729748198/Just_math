package com.just.learn.service;

import com.just.learn.dao.LearnMapper;
import com.just.learn.entity.Learn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 贺文杰
 * 2018/11/11 3:00
 */
@Service("learnServiceImpl")
public class LearnServiceImpl implements  LearnService{
    @Autowired
    LearnMapper mapper;
    @Override
    public List<Map<String, String>> selectBan(String ban) {

        return mapper.selectByBan(ban);
    }
}
