package com.just.ti.service;

import com.just.ti.dao.TiankongMapper;
import com.just.ti.entity.TiankongWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/9 20:56
 */
@Service("AnswerServiceImpl")
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    TiankongMapper mapper;
    @Override
    public TiankongWithBLOBs selectByQId(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(TiankongWithBLOBs answerWithBLOBs) {
        return mapper.insertSelective(answerWithBLOBs);
    }
}
