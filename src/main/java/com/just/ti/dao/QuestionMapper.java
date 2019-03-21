package com.just.ti.dao;

import com.just.ti.entity.Question;

public interface QuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    /**
     * 插入一道题
     * @param record
     * @return
     */
    int insertSelective(Question record);


    /**
     * 通过id查找一道题
     * @param id 题目id
     * @return
     */
    Question selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKeyWithBLOBs(Question record);

    int updateByPrimaryKey(Question record);
}