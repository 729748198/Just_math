package com.just.ti.service;

import com.just.ti.dao.QuestionMapper;
import com.just.ti.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/9 20:48
 */
@Service("QuestionServiceImpl")
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionMapper mapper;
    @Override
    public Question selectById(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(Question question) {
        return mapper.insertSelective(question);
    }

    @Override
    public Question selectByBan(String ban) {
        return mapper.selectByBan(ban);
    }

    @Override
    public Question selectTianRandom(String ban) {
        return mapper.selectTianByRandom(ban);
    }

    @Override
    public List<Question> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int delectByid(String id) {
        return mapper.deleteByPrimaryKey(id);
    }
}
