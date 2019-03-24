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
    public Question selectById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(Question question) {
        return mapper.insertSelective(question);
    }

    @Override
    public List<Question> selectByBan(String ban) {
        return mapper.selectByBan(ban);
    }
}
