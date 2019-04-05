package com.just.ti.controller;

import com.just.ti.entity.AnswerWithBLOBs;
import com.just.ti.entity.ChoiceWithBLOBs;
import com.just.ti.entity.Question;
import com.just.ti.entity.UserTiWithBLOBs;
import com.just.ti.service.AnswerService;
import com.just.ti.service.Choiceservice;
import com.just.ti.service.QuestionService;
import com.just.ti.service.UserTiService;
import com.just.tools.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author 贺文杰
 * 2019/3/9 20:58
 */
@Controller
@RequestMapping("ti")
public class TiController {
    @Autowired
    AnswerService answerService;
    @Autowired
    QuestionService questionService;
    @Autowired
    UserTiService userTiService;

    @Autowired
    Choiceservice choiceservice;

    /**
     * 处理跨域问题
     * @param response
     */
    @ModelAttribute
    public  void kuayu(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
    }

    /**
     * 提交题目
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/doanswer")
    @ResponseBody
    public Map<String, String> doanswer(HttpServletResponse response, HttpServletRequest request){

        /**
         * 获取参数
         */
        String name= (String) request.getSession().getAttribute("user");
        String doanswer=request.getParameter("doanswer");
        String ti_id=request.getParameter("ti_id");

        /**
         * 处理参数,查找题目对应的答案
         */
        Integer ti=Integer.parseInt(ti_id);
        AnswerWithBLOBs answerWithBLOBs=answerService.selectByQId(ti);
        Map<String,String>map=new HashMap<>(3);
        /**
         * 新增一条做题记录
         */
        UserTiWithBLOBs userTiWithBLOBs=new UserTiWithBLOBs();
        userTiWithBLOBs.setTiId(ti);
        userTiWithBLOBs.setUsername(name);
        userTiWithBLOBs.setRightanswer(answerWithBLOBs.getAnswer());
        userTiWithBLOBs.setDoanswer(doanswer);
        userTiWithBLOBs.setDotime(new Date());
        System.out.println("答案"+answerWithBLOBs.getAnswer());
        System.out.println("填的"+doanswer);
        if(answerWithBLOBs.getAnswer().equals(doanswer)){
            userTiWithBLOBs.setIsDo(2);
            map.put("mess","答案正确！");
        }else{
            userTiWithBLOBs.setIsDo(1);
            map.put("mess","答案错误！正确答案为：");
        }
        userTiService.add(userTiWithBLOBs);

        doanswer=doanswer.replaceAll("\"","&quot");
        map.put("rightanswer",answerWithBLOBs.getAnswer());
        map.put("jiexi",answerWithBLOBs.getJiexi());
        return  map;
    }

    /**
     * 插入一道填空题目的答案
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/dotian")
    @ResponseBody
    public String dotian(HttpServletResponse response, HttpServletRequest request){

        String ban=request.getParameter("Ban");
        String title=request.getParameter("Title");
        String score=request.getParameter("Score");
        String answer=request.getParameter("Answer");
        Integer ti_id= Integer.valueOf(MD5.md5(title));
        //2是填空题
        Integer type=2;

        /**
         * 问题的实体
         */
        Question question=new Question();
        question.setId(ti_id);
        question.setTiBan(ban);
        question.setTiScore(score);
        question.setTiTitle(title);
        question.setTiSum(type);
        /**
         * 答案的实体
         */
        AnswerWithBLOBs answerWithBLOBs=new AnswerWithBLOBs();
        answerWithBLOBs.setAnswer(answer);
        answerWithBLOBs.setTiId(ti_id);
        answerWithBLOBs.setAnswerType(2);

        questionService.add(question);
        answerService.add(answerWithBLOBs);

        return  "插入成功";
    }

    /**
     * 插入一道选择题
     * @param response
     * @param request
     */

    public  void funchoice(HttpServletResponse response,HttpServletRequest request){
        String ban=request.getParameter("Ban");
        String title=request.getParameter("Title");
        String score=request.getParameter("Score");
        String answer=request.getParameter("Answer");
        String aa=request.getParameter("Aa");
        String ab=request.getParameter("Ab");
        String ac=request.getParameter("Ac");
        String ad=request.getParameter("Ad");
        String jiexi=request.getParameter("Jiexi");
        String ttype=request.getParameter("type");
        Integer ti_id= Integer.valueOf(MD5.md5(title));

        Integer type=Integer.valueOf(ttype);

        /**
         */
        Question question=new Question();
        question.setId(ti_id);
        question.setTiBan(ban);
        question.setTiScore(score);
        question.setTiTitle(title);
        question.setTiSum(type);

        /**
         * 答案的实体
         */
        ChoiceWithBLOBs bloBs=new ChoiceWithBLOBs();
        bloBs.setId(ti_id);
        bloBs.setPa(aa);
        bloBs.setPb(ab);
        bloBs.setPc(ac);
        bloBs.setPd(ad);
        bloBs.setAnswer(answer);
        bloBs.setJiexi(jiexi);
        questionService.add(question);
        choiceservice.addById(bloBs);
    }
    /**
     * 插入选择题，返回json
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/doChoice")
    @ResponseBody
    public  String doChoice(HttpServletResponse response, HttpServletRequest request){
        funchoice(response,request);
        return  "插入成功";
    }

    /**
     * 插入不带公式的选择题,返回页面
     * @param request
     * @param respnse
     * @return
     */
    @RequestMapping("/dochoice")
    public  String doChoiceNoMath(HttpServletRequest request,HttpServletResponse respnse){
        funchoice(respnse,request);
    return  "admin/addchoiceNomath";
    }

    /**
     * 根据板块ban随机获取一道题
     * @param ban
     * @return
     */
    @RequestMapping("/getByban")
    @ResponseBody
    public  Map<String, String> getByBan(String ban){

        List<Question> list=questionService.selectByBan(ban);
        List<Map<String,String>>result=new ArrayList<>();
        for (Question question:list
             ) {
            ChoiceWithBLOBs choiceWithBLOBs=choiceservice.selectById(question.getId());

            Map<String,String>map=new HashMap<>(7);
            map.put("title",question.getTiTitle());
            map.put("A",choiceWithBLOBs.getPa());
            map.put("B",choiceWithBLOBs.getPb());
            map.put("C",choiceWithBLOBs.getPc());
            map.put("D",choiceWithBLOBs.getPd());
            map.put("jiexi",choiceWithBLOBs.getJiexi());
            map.put("answer",choiceWithBLOBs.getAnswer());
            result.add(map);
        }
        int length=result.size();
        return result.get((int)(1+Math.random()*(length-2+1)));
    }






    /**
     * 测试——获取一道选择题
     * @return
     */
    @RequestMapping("/getone")
    @ResponseBody
    public Map<String,String> getone(){
        Question question=questionService.selectById(3);
        ChoiceWithBLOBs choiceWithBLOBs=choiceservice.selectById(3);
        Map<String,String>map=new HashMap<>(7);
        map.put("title",question.getTiTitle());
        map.put("A",choiceWithBLOBs.getPa());
        map.put("B",choiceWithBLOBs.getPb());
        map.put("C",choiceWithBLOBs.getPc());
        map.put("D",choiceWithBLOBs.getPd());
        map.put("jiexi",choiceWithBLOBs.getJiexi());
        map.put("answer",choiceWithBLOBs.getAnswer());
        return map;
    }

    /**
     * 测试——获取一道公式题
     * @return
     */
    @RequestMapping(value = "/test")
    @ResponseBody
    public Map<String, String> test(){
        Question question=questionService.selectById(618694747);
        AnswerWithBLOBs answerWithBLOBs=answerService.selectByQId(618694747);
        Map<String,String>map=new HashMap<>(7);
        map.put("title",question.getTiTitle());
        map.put("answer",answerWithBLOBs.getAnswer());

        return map;
    }


}
