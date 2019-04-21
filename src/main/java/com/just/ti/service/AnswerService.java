package com.just.ti.service;

import com.just.ti.entity.TiankongWithBLOBs;

/**
 * @author 贺文杰
 * 2019/3/9 20:55
 */
public interface AnswerService {

    /**
     * 返回问题ID的答案
     * @param id
     * @return
     */
    TiankongWithBLOBs selectByQId(String id);

    /**
     * 增加一道题的答案
     * @param answerWithBLOBs
     * @return
     */
    int add(TiankongWithBLOBs answerWithBLOBs);
}
