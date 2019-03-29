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
import jdk.nashorn.internal.ir.BaseNode;
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

    /**
     * 根据章节进行排名
     * @return
     */
    @RequestMapping("/rank")
    @ResponseBody
    public Map<String, Object> rank(HttpServletRequest request, HttpServletResponse response){
        String username=(String) request.getSession().getAttribute("user");
        String Ban=request.getParameter("ban");
        Ban=Ban.trim();
        int cout=0;
        int he=0;
        String ban;
        Map<String,Integer>banMap=new HashMap<>(15);
        banMap.put("高数第一章",1);
        banMap.put("高数第二章",2);
        banMap.put("高数第三章",3);
        banMap.put("高数第四章",4);
        banMap.put("高数第五章",5);
        banMap.put("高数第六章",6);
        banMap.put("高数第七章",7);
        banMap.put("高数第八章",8);
        banMap.put("高数第九章",9);
        banMap.put("高数第十章",10);
        banMap.put("高数第十一章",11);
        banMap.put("高数第十二章",12);
        banMap.put("概率论",13);
        banMap.put("线性代数",14);
        banMap.put("总排行",15);
        switch (banMap.get(Ban)){
            case 1:ban="one";break;
            case 2:ban="two";break;
            case 3:ban="three";break;
            case 4:ban="four";break;
            case 5:ban="five";break;
            case 6:ban="six";break;
            case 7:ban="seven";break;
            case 8:ban="eight";break;
            case 9:ban="nine";break;
            case 10:ban="ten";break;
            case 11:ban="eleven";break;
            case 12:ban="tweven";break;
            case 13:ban="gailvlun";break;
            case 14:ban="xiandai";break;
            case 15:ban="he";break;
            default:ban="null";break;
        }
        /**
         * 此时的Rank中只有 username和要查的版块分数两个参数
         */
        List<Rank> rankList=Rankservice.selectByban(ban);
        /**
         * 查找自己的分数/排名
         */
        int realCout=0;
        for (Rank r :
                rankList) {
            cout++;
            if(username.equals(r.getUsername())){
                he=r.get(Ban);
                realCout=cout;
            }
            r.setFen(r.get(Ban));
        }
        Map<String,Object>map=new HashMap<>(10);
        map.put("first",rankList.remove(0));
        map.put("second",rankList.remove(0));
        map.put("thread",rankList.remove(0));
        map.put("rank",rankList);
        map.put("me",realCout);
        map.put("he",he);

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
