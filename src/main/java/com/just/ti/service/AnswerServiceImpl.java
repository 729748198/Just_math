package com.just.ti.service;

import com.just.ti.dao.AnswerMapper;
import com.just.ti.entity.AnswerWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/9 20:56
 */
@Service("AnswerServiceImpl")
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    AnswerMapper mapper;
    @Override
    public AnswerWithBLOBs selectByQId(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }
}
