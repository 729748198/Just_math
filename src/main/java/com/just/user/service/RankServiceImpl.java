package com.just.user.service;

import com.just.user.dao.RankMapper;
import com.just.user.entity.Rank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/6 18:40
 */
@Service("RankServiceImpl")
public class RankServiceImpl implements RankService {
    @Autowired
    RankMapper mapper;
    @Override
    public List<Rank> selectAll() {
        return mapper.selectall();
    }

    @Override
    public List<Rank> selectByban(String ban) {
        return mapper.selectByban(ban);
    }
}
