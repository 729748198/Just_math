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
     * 增加一道填空题的答案
     * @param answerWithBLOBs
     * @return
     */
    int add(TiankongWithBLOBs answerWithBLOBs);

    /**
     * 根据主键删除填空题
     * @param id
     * @return
     */
    int delectByid(Integer id);
    /**
     * 根据tiid删除填空题
     */
    int delectByTIID(String id);
}
