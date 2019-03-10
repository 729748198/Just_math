package com.just.user.service;

import com.just.user.entity.UserInfo;
import com.just.user.entity.UserLogin;

import java.util.Map;

/**
 * @author 贺文杰
 * 2018/11/5 19:29
 */
public interface UserService {

    int createUser(UserLogin login);

    Map<String,String> selectUser(String name);

    UserInfo selectUserInfo(String username);
}
