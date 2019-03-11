package com.just.ti.service;

import com.just.ti.dao.UserTiMapper;
import com.just.ti.entity.UserTiWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/11 8:36
 */
@Service("UserTiServiceImpl")
public class UserTiServiceImpl implements UserTiService {
   @Autowired
    UserTiMapper mapper;

    @Override
    public int add(UserTiWithBLOBs userTiWithBLOBs) {
        return mapper.insert(userTiWithBLOBs);
    }
}
