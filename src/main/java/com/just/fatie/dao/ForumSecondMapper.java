package com.just.fatie.dao;

import com.just.fatie.entity.ForumSecond;

import java.util.List;

public interface ForumSecondMapper {
    int deleteByPrimaryKey(String secId);

    int insert(ForumSecond record);

    int insertSelective(ForumSecond record);

    ForumSecond selectByPrimaryKey(String secId);
    //根据Tid查找回帖
    List<ForumSecond> selectByTid(String Tid);

    int updateByPrimaryKeySelective(ForumSecond record);

    int updateByPrimaryKeyWithBLOBs(ForumSecond record);

    int updateByPrimaryKey(ForumSecond record);
}