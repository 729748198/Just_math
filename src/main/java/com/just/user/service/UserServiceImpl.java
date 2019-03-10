package com.just.user.service;

import com.just.user.dao.UserInfoMapper;
import com.just.user.dao.UserLoginMapper;
import com.just.user.entity.UserInfo;
import com.just.user.entity.UserLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author 贺文杰
 * 2018/11/5 19:32
 */
@Service("userServiceImpl")
public class UserServiceImpl  implements  UserService{

    @Autowired
    UserLoginMapper mapper;
    @Autowired
    UserInfoMapper infoMapper;
    @Override
    public int createUser(UserLogin login) {
        return mapper.insertSelective(login);
    }

    @Override
    public Map<String, String> selectUser(String name) {
        return mapper.selectByUsername(name);
    }

    @Override
    public UserInfo selectUserInfo(String username) {
        return infoMapper.selectByPrimaryKey(username);
    }

}
