package com.just.user.controller;

import com.just.fatie.entity.ForumMain;
import com.just.fatie.service.FatieService;
import com.just.math_world.controller.WorldController;
import com.just.math_world.entity.Math_world;
import com.just.math_world.entity.WorldFans;
import com.just.math_world.entity.WorldFollow;
import com.just.math_world.service.WorldFansService;
import com.just.math_world.service.WorldFollowService;
import com.just.math_world.service.WorldService;
import com.just.user.entity.Rank;
import com.just.user.entity.UserLogin;
import com.just.user.service.RankService;
import com.just.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author 贺文杰
 * 2018/11/5 19:33
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService service;

    //大数世界

    @Autowired
    WorldService Worldservice;

    @Autowired
    WorldFollowService Followservice;

    @Autowired
    WorldFansService FansService;

    //师生答疑

    @Autowired
    FatieService Fatieservice;

    //排名

    @Autowired
    RankService Rankservice;


    //注册
    /**
     * 处理注册
     * @param login
     * @return
     */
    @RequestMapping("/doregister")
    public String doregister(UserLogin login){
        if( service.createUser(login)==1){
            return "success";
        }
        else {
            return "register";
        }

    }
    /**
     *
     * @return  返回到注册界面
     */
    @RequestMapping("/register")
    public String register(){
        System.out.println("测试");
        return "register";
    }

    //登录

    /**
     * 返回登录页面
     * @return
     */
    @RequestMapping("/dologin")
    public String login(String username,HttpServletRequest request, HttpServletResponse response){

        request.getSession().setAttribute("user", username);
        request.getSession().setAttribute("loginFlag",true);
        return "index";

    }

    //接口——查询用户
    @RequestMapping(value = "/getUser/{username}",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> getUser(@PathVariable String username){
        Map<String,String> map;
        map= service.selectUser(username);
        return map;
    }

    //测试
    @RequestMapping("/testAjax")
    public String testAjax(){
        return "test";
    }

    @ModelAttribute
    public  void kuayu(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
    }






}
