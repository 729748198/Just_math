package com.just.fatie.service;

import com.just.fatie.dao.ForumMainMapper;
import com.just.fatie.dao.ForumSecondMapper;
import com.just.fatie.entity.ForumMain;
import com.just.fatie.entity.ForumSecond;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2018/11/15 18:34
 */
@Service("fatieServiceImpl")
public class FatieServiceImpl implements FatieService {

    @Autowired
    ForumMainMapper mainMapper;

    @Autowired
    ForumSecondMapper secondMapper;


    @Override
    public List<ForumMain> selectAll() {
        return mainMapper.selectTiezi();
    }

    @Override
    public ForumMain selectByPrimaryMainId(String mainId) {
        return mainMapper.selectByPrimaryKey(mainId);
    }

    @Override
    public List<ForumSecond> selectByTid(String Tid) {
        return secondMapper.selectByTid(Tid);
    }
}
