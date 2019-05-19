package com.just.ti.service;

import com.just.ti.entity.TiBan;

public interface TiBanService {
    /**
     * 根据板块查找实体
     * @param ban 板块
     * @return 章节实体
     */
    TiBan selectByBan(String ban);

    /**
     * 更新板块
     * @param tiBan
     * @return
     */
    int update(TiBan tiBan);
}
