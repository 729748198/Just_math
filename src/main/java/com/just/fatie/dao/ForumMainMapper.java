package com.just.fatie.dao;

import com.just.fatie.entity.ForumMain;

import java.util.List;

public interface ForumMainMapper {
    int deleteByPrimaryKey(String mainId);

    int insert(ForumMain record);

    int insertSelective(ForumMain record);

    List<ForumMain> selectTiezi();

    ForumMain selectByPrimaryKey(String mainId);

    int updateByPrimaryKeySelective(ForumMain record);

    int updateByPrimaryKeyWithBLOBs(ForumMain record);

    int updateByPrimaryKey(ForumMain record);
}