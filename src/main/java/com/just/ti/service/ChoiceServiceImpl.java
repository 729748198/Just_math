package com.just.ti.service;

import com.just.ti.dao.TiChoiceMapper;
import com.just.ti.entity.TiChoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/16 10:12
 */
@Service("ChoiceServiceImpl")
public class ChoiceServiceImpl implements Choiceservice {
    @Autowired
    TiChoiceMapper mapper;

    @Override
    public TiChoice selectById(String  id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int addById(TiChoice bloBs) {
        return mapper.insertSelective(bloBs);
    }

    @Override
    public int delectByTi_id(String id) {
        return mapper.deleteByPrimaryKey(id);
    }
}
