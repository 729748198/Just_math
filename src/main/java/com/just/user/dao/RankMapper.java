package com.just.user.dao;

import com.just.user.entity.Rank;

import java.util.List;

public interface RankMapper {
    int deleteByPrimaryKey(String username);

    int insert(Rank record);

    int insertSelective(Rank record);

    /**
     * 获取排名列表
     * @return
     */
    List<Rank> selectall();

    Rank selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(Rank record);

    int updateByPrimaryKey(Rank record);
}