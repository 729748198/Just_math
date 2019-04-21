package com.just.fatie.controller;

import com.just.fatie.entity.ForumInfo;
import com.just.fatie.entity.ForumMain;
import com.just.fatie.service.FatieService;
import com.just.fatie.service.ForumInfoService;
import com.just.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author 贺文杰
 * 2018/11/15 16:57
 */
@Controller
@RequestMapping("fatie")
public class FatieController {
    @Autowired
    FatieService fatieService;

    @Autowired
    ForumInfoService forumInfoService;
    @Autowired
    UserService userService;


    /**
     * 页面跳转
     */
    /**
     * 页面跳转
     *
     */
    @RequestMapping("/content")
    public String toContent(){
        return "Q&A-content";
    }



    /**
     * 获取帖子列表
     */

    @RequestMapping("/getall")
    @ResponseBody
    public List<ForumMain> getAlltiezi(){
        return  fatieService.selectAll();
    }

    /**
     * //获取帖子详细信息
     * @param username
     * @param Tid
     * @return
     */
    @RequestMapping("/gettie")
    @ResponseBody
    public Map<String,Object>getTiezi(String username,String Tid){
        Map<String,Object> map=new HashMap<>();
        map.put("tie",fatieService.selectByPrimaryMainId(Tid));
        map.put("mainuser",userService.selectUserInfo(username));
        map.put("huitie",fatieService.selectByTid(Tid));
        return map;
    }

    @RequestMapping("/dofatie")
    public String dofatie(HttpServletRequest request,String content,String mainTitle){

        String mainid=UUID.randomUUID().toString();//随机生成帖子ID
        String userid=request.getSession().getAttribute("user").toString();
        /**
         * 发帖表
         */

        ForumMain forumMain=new ForumMain();
        forumMain.setMainId(mainid);
        forumMain.setMainTitle(mainTitle);
        forumMain.setMainFlag("default");
        forumMain.setMainType("index");
        forumMain.setMainContent(content);
        forumMain.setMainCreatime(new Date());
        forumMain.setMainCreatuser(userid);
        forumMain.setMainRecommend(5);
        forumMain.setMainDelete("n");

        fatieService.add(forumMain);
        /**
         * 发帖信息表
         */
        ForumInfo forumInfo=new ForumInfo();
        forumInfo.setMainId(mainid);
        forumInfo.setInfoReply(0);
        forumInfo.setInfoSee(0);
        forumInfo.setInfoLastuser(userid);
        forumInfo.setInfoLastime(new Date());

        forumInfoService.add(forumInfo);
        return "redirect:/just/Q&A";
    }

    @ModelAttribute
    public  void kuayu(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
    }
}
