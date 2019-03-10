package com.just.user.dao;

import com.just.user.entity.UserLogin;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;

public interface UserLoginMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserLogin record);

    int insertSelective(UserLogin record);

    UserLogin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserLogin record);

    int updateByPrimaryKey(UserLogin record);

    Map<String,String> selectByUsername(@Param(value = "username") String username);

}