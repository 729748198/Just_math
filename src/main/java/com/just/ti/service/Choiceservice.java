package com.just.ti.service;

import com.just.ti.entity.TiChoice;

/**
 * @author 贺文杰
 * 2019/3/16 10:10
 */
public interface Choiceservice {
    /**
     * 根据问题id查找选项和答案
     * @param id
     * @return
     */
    TiChoice selectById(String id);

    /**
     * 增加一道选择题
     * @param bloBs
     * @return
     */
    int addById(TiChoice bloBs);
}
