package com.just.ti.dao;

import com.just.ti.entity.Choice;
import com.just.ti.entity.ChoiceWithBLOBs;

public interface ChoiceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChoiceWithBLOBs record);

    int insertSelective(ChoiceWithBLOBs record);

    ChoiceWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ChoiceWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ChoiceWithBLOBs record);

    int updateByPrimaryKey(Choice record);
}