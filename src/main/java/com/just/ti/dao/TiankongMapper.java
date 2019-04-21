package com.just.ti.dao;

import com.just.ti.entity.Tiankong;
import com.just.ti.entity.TiankongWithBLOBs;

public interface TiankongMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TiankongWithBLOBs record);

    int insertSelective(TiankongWithBLOBs record);

    TiankongWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TiankongWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TiankongWithBLOBs record);

    int updateByPrimaryKey(Tiankong record);
}