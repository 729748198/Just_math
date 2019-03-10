package com.just.learn.service;

import java.util.List;
import java.util.Map;

/**
 * @author 贺文杰
 * 2018/11/11 2:59
 */
public interface LearnService {

    List<Map<String,String>> selectBan(String ban);
}
