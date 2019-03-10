package com.just.fatie.controller;

import com.just.fatie.entity.ForumMain;
import com.just.fatie.service.FatieService;
import com.just.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 贺文杰
 * 2018/11/15 16:57
 */
@Controller
@RequestMapping("fatie")
public class FatieController {
    @Autowired
    FatieService service;

    @Autowired
    UserService userService;


    //获取帖子列表
    @RequestMapping("/getall")
    @ResponseBody
    public List<ForumMain> getAlltiezi(){
        return  service.selectAll();
    }
    //获取帖子详细信息
    @RequestMapping("/gettie")
    @ResponseBody
    public Map<String,Object>getTiezi(String username,String Tid){
        Map<String,Object> map=new HashMap<>();
        map.put("tie",service.selectByPrimaryMainId(Tid));
        map.put("mainuser",userService.selectUserInfo(username));
        map.put("huitie",service.selectByTid(Tid));
        return map;
    }
    public int dofatie(HttpServletRequest request,String title,String content){

        String name="贺文杰";

        return 1;
    }
    @ModelAttribute
    public  void kuayu(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
    }
}
