package com.just.ti.service;

import com.just.ti.entity.Question;

/**
 * @author 贺文杰
 * 2019/3/9 20:47
 */
public interface QuestionService {
    /**
     * 根据ID查找题目
     * @param id
     * @return
     */
    Question selectById(Integer id);

    /**
     * 数据库中加一道题
     * @param question 题目实体
     * @return
     */
    int add(Question question);
}
