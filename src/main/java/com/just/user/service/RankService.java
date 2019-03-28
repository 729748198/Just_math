package com.just.user.service;

import com.just.user.entity.Rank;

import java.util.List;

/**
 * @author 贺文杰
 * 2019/3/6 18:39
 */
public interface RankService {
    /**
     * 获取所有信息
     * @return
     */
    List<Rank> selectAll();

    /**
     * 根据章节来获取成绩
     * @param ban
     * @return
     */
    List<Rank> selectByban(String ban);
}
