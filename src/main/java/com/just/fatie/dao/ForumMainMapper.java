package com.just.fatie.dao;

import com.just.fatie.entity.ForumMain;

import java.util.List;

public interface ForumMainMapper {
    int deleteByPrimaryKey(String mainId);

    int insert(ForumMain record);

    /**
     * 插入一条帖子
     * @param record
     * @return
     */
    int insertSelective(ForumMain record);

    /**
     * 获取帖子列表
     * @return
     */
    List<ForumMain> selectTiezi();

    /**
     * 根据帖子id查找帖子
     * @param mainId
     * @return
     */
    ForumMain selectByPrimaryKey(String mainId);

    int updateByPrimaryKeySelective(ForumMain record);

    int updateByPrimaryKeyWithBLOBs(ForumMain record);

    int updateByPrimaryKey(ForumMain record);
}