package com.just.ti.service;

import com.just.ti.dao.TiBanMapper;
import com.just.ti.entity.TiBan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("TiBanServiceImpl")
public class TiBanServiceImpl implements TiBanService {
    @Autowired
    TiBanMapper mapper;

    @Override
    public TiBan selectByBan(String ban) {
        return mapper.selectByBan(ban);
    }

    @Override
    public int update(TiBan tiBan) {
        return mapper.updateByPrimaryKeySelective(tiBan);
    }
}
