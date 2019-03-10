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
}
