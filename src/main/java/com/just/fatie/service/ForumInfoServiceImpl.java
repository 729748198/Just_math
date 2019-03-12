package com.just.fatie.service;

import com.just.fatie.dao.ForumInfoMapper;
import com.just.fatie.entity.ForumInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 贺文杰
 * 2019/3/12 20:34
 */
@Service("ForumInfoServiceImpl")
public class ForumInfoServiceImpl implements ForumInfoService {
    @Autowired
    ForumInfoMapper mapper;

    @Override
    public ForumInfo selectByMainId(String id) {
        return mapper.selectByMainID(id);
    }
}
