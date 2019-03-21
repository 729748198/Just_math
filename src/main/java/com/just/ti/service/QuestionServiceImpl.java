package com.just.ti.service;

import com.just.ti.dao.QuestionMapper;
import com.just.ti.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/9 20:48
 */
@Service("QuestionServiceImpl")
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionMapper mapper;
    @Override
    public Question selectById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(Question question) {
        return mapper.insertSelective(question);
    }
}
