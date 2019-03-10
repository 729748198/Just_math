package com.just.ti.dao;

import com.just.ti.entity.Answer;
import com.just.ti.entity.AnswerWithBLOBs;

public interface AnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnswerWithBLOBs record);

    int insertSelective(AnswerWithBLOBs record);

    AnswerWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnswerWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(AnswerWithBLOBs record);

    int updateByPrimaryKey(Answer record);
}