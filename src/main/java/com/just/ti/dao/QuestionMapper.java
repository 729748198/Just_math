package com.just.ti.dao;

import com.just.ti.entity.Question;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionMapper {
    int deleteByPrimaryKey(String id);

    int insert(Question record);

    int insertSelective(Question record);

    /**
     * 根据板块查找题目
     * @param ban
     * @return
     */
    Question selectByBan(@Param(value = "ban") String ban);

    /**
     * 根据板块随机查找一道题目
     * @param ban
     * @return
     */
    Question selectTianByRandom(@Param(value = "ban") String ban);

    Question selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);
}