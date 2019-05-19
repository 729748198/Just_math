package com.just.ti.dao;

import com.just.ti.entity.Tiankong;
import com.just.ti.entity.TiankongWithBLOBs;

public interface TiankongMapper {
    /**
     * 删除一道填空题的答案
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);
    /**
     * 删除一道填空题的答案
     * @param id
     * @return
     */
    int deleteByTiId(String id);

    int insert(TiankongWithBLOBs record);

    int insertSelective(TiankongWithBLOBs record);

    TiankongWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TiankongWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TiankongWithBLOBs record);

    int updateByPrimaryKey(Tiankong record);
}