package com.just.fatie.service;

import com.just.fatie.entity.ForumInfo;

/**
 * @author 贺文杰
 * 2019/3/12 20:32
 */
public interface ForumInfoService {
    /**
     * 根据帖子的ID查找
     * @param id
     * @return
     */
    ForumInfo selectByMainId(String id);
}
