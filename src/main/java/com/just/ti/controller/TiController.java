package com.just.ti.controller;

import com.just.ti.entity.AnswerWithBLOBs;
import com.just.ti.entity.ChoiceWithBLOBs;
import com.just.ti.entity.Question;
import com.just.ti.entity.UserTiWithBLOBs;
import com.just.ti.service.AnswerService;
import com.just.ti.service.Choiceservice;
import com.just.ti.service.QuestionService;
import com.just.ti.service.UserTiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

        map.put("rightanswer",answerWithBLOBs.getAnswer());
        map.put("jiexi",answerWithBLOBs.getJiexi());
        return  map;
    }


    @RequestMapping("/getone")
    @ResponseBody
    public Map<String,String> getone(){
        Question question=questionService.selectById(3);
        System.out.println(question.getTiTitle());
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

}
