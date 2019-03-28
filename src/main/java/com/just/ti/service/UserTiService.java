package com.just.ti.service;

import com.just.ti.entity.UserTiWithBLOBs;

/**
 * @author 贺文杰
 * 2019/3/11 8:34
 */
public interface UserTiService {
    /**
     * 新增一条记录
     * @param userTiWithBLOBs
     * @return
     */
    int add(UserTiWithBLOBs userTiWithBLOBs);

}
