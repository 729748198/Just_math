package com.just.ti.service;

import com.just.ti.dao.ChoiceMapper;
import com.just.ti.entity.ChoiceWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/16 10:12
 */
@Service("ChoiceServiceImpl")
public class ChoiceServiceImpl implements Choiceservice {
    @Autowired
    ChoiceMapper mapper;

    @Override
    public ChoiceWithBLOBs selectById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int addById(ChoiceWithBLOBs bloBs) {
        return mapper.insertSelective(bloBs);
    }
}
