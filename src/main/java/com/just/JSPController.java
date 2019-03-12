package com.just;

import com.just.fatie.entity.ForumInfo;
import com.just.fatie.entity.ForumMain;
import com.just.fatie.service.FatieService;
import com.just.fatie.service.ForumInfoService;
import com.just.math_world.entity.Math_world;
import com.just.math_world.entity.WorldFans;
import com.just.math_world.entity.WorldFollow;
import com.just.math_world.service.WorldFansService;
import com.just.math_world.service.WorldFollowService;
import com.just.math_world.service.WorldService;
import com.just.ti.entity.Question;
import com.just.ti.service.AnswerService;
import com.just.ti.service.QuestionService;
import com.just.user.entity.Rank;
import com.just.user.service.RankService;
import com.sun.org.apache.xerces.internal.xs.datatypes.ObjectList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author 贺文杰
 * 2019/2/25 23:38
 */
@Controller
@RequestMapping("just")
public class JSPController {
    //大数世界

    @Autowired
    WorldService worldService;

    @Autowired
    WorldFollowService followService;

    @Autowired
    WorldFansService fansService;

    //师生答疑

    @Autowired
    FatieService fatieService;
    @Autowired
    ForumInfoService forumInfoService;

    //排名

    @Autowired
    RankService rankService;

    //做题

    @Autowired
    AnswerService answerService;
    @Autowired
    QuestionService questionService;


    @RequestMapping("/error")
    public String error(){
        return "404";
    }


    //以下是跳转页面

    @RequestMapping("/index")
    public String main(){
        return "index";
    }

    /**
     * 跳转大数世界
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/MathWorld")
    public String mathworld(HttpServletRequest request, HttpServletResponse response){
        String username=(String) request.getSession().getAttribute("user");
        List<WorldFollow> follows=followService.getByUsername(username);
        List<WorldFans>fans=fansService.selectByUsername(username);
        List<Math_world> worlds=worldService.getall();
        List<Math_world> myworlds=worldService.getbyuser(username);
        request.setAttribute("follow",follows);
        request.setAttribute("fans",fans);
        request.setAttribute("worlds",worlds);
        request.setAttribute("myworlds",myworlds);
        return "MathWorld";
    }

    /**
     * 跳转我的大数
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/MyMath")
    public String mymath(HttpServletRequest request, HttpServletResponse response){
        String username=request.getParameter("user");
        System.out.println(username);
        Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (int d = 0; d <= cookies.length - 1; d++) {
                System.out.print(cookies[d].getName() + ":" + cookies[d].getValue() + "<br>");
            }
        }
        return "MyMath";
    }

    /**
     * 跳转师生答疑论坛
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/Q&A")
    public String qa(HttpServletRequest request, HttpServletResponse response){

        /**
         * 查找所有帖子
         */
        List<ForumMain>forumMainList=fatieService.selectAll();
        /**
         * 新建一个List存储帖子信息和回复信息
         */
        List<Map<String,Object>> lists=new ArrayList<Map<String, Object>>();
        for (ForumMain m :
                forumMainList) {
            Map<String,Object>map=new HashMap<String, Object>(2);
            ForumInfo forumInfo=forumInfoService.selectByMainId(m.getMainId());
            map.put("forumMain",m);
            map.put("forumInfo",forumInfo);
            lists.add(map);

        }
        request.setAttribute("tiezi",lists);
        return "Q&A";
    }

    /**
     * 跳转排名页
     * @return
     */
    @RequestMapping("/Rank")
    public String rank(HttpServletRequest request, HttpServletResponse response){
        String username=(String) request.getSession().getAttribute("user");
        int cout=0;
        int he=0;
        List<Rank> rankList=rankService.selectAll();
        Comparator<Rank> comparator=new Comparator<Rank>() {
            @Override
            public int compare(Rank o1, Rank o2) {
                return o2.gethe()-o1.gethe();
            }
        };
        Collections.sort(rankList,comparator);
        for (Rank r :
                rankList) {
            cout++;
            if(username.equals(r.getUsername())){
                he=r.gethe();
                break;
            }
        }
        request.setAttribute("first",rankList.remove(0));
        request.setAttribute("second",rankList.remove(0));
        request.setAttribute("thread",rankList.remove(0));
        request.setAttribute("rank",rankList);
        request.setAttribute("me",cout);
        request.setAttribute("he",he);
        return "Rank";
    }
    @RequestMapping("/Login")
    public String login(){
        return "login";
    }

    /**
     * 跳转做题页面
     * @return
     */
    @RequestMapping("/zuoti")
    public String zuoti(HttpServletRequest request,HttpServletResponse response){

        Question question=questionService.selectById(1);
        request.setAttribute("ti",question.getTiTitle());
        request.setAttribute("ti_id",question.getId());
        return  "zuoti";
    }

}
