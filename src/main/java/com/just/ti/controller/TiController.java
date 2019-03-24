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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        if(answerWithBLOBs.getAnswer().equals(doanswer)){
            userTiWithBLOBs.setIsDo(2);
            map.put("mess","答案正确！");
        }else{
            userTiWithBLOBs.setIsDo(1);
            map.put("mess","答案错误！正确答案为：");
        }
        userTiService.add(userTiWithBLOBs);

        System.out.println(doanswer);
        doanswer=doanswer.replaceAll("\"","&quot");
        System.out.println(doanswer);
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
     * 插入选择题
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/doChoice")
    @ResponseBody
    public  String doChoice(HttpServletResponse response, HttpServletRequest request){
        String ban=request.getParameter("Ban");
        String title=request.getParameter("Title");
        String score=request.getParameter("Score");
        String answer=request.getParameter("Answer");
        String aa=request.getParameter("Aa");
        String ab=request.getParameter("Ab");
        String ac=request.getParameter("Ac");
        String ad=request.getParameter("Ad");
        String jiexi=request.getParameter("Jiexi");
        Integer ti_id= Integer.valueOf(MD5.md5(title));
        //1是选择题
        Integer type=1;

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
        return  "插入成功";
    }

    @RequestMapping("/dochoice")
    public  String doChoiceNoMath(HttpServletRequest request,HttpServletResponse respnse){
        String ban=request.getParameter("ban");
        String title=request.getParameter("title");
        String score=request.getParameter("score");
        String answer=request.getParameter("answer");
        String aa=request.getParameter("Aa");
        String ab=request.getParameter("Ab");
        String ac=request.getParameter("Ac");
        String ad=request.getParameter("Ad");
        String jiexi=request.getParameter("jiexi");
        Integer ti_id= Integer.valueOf(MD5.md5(title));
        //没有公式的选择题
        Integer type=5;

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
    return  "admin/addchoiceNomath";
    }
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
