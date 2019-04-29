package com.just.ti.dao;

import com.just.ti.entity.TiChoice;

public interface TiChoiceMapper {
    int deleteByPrimaryKey(String id);

    int insert(TiChoice record);

    int insertSelective(TiChoice record);

    TiChoice selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TiChoice record);

    int updateByPrimaryKey(TiChoice record);
}