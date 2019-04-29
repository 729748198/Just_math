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
     * @return 每个人各科成绩
     */
    List<Rank> selectAll();

    /**
     * 根据章节来获取所有学生成绩
     * @param ban 板块
     * @return 列表
     */
    List<Rank> selectByban(String ban);

    /**
     * 更新分数
     */
    int updataScore(Rank rank);

    /**
     * 根据用户名查找各科成绩
     * @param username 用户名
     * @return Rank
     */
    Rank selectByUsername(String username);
}
