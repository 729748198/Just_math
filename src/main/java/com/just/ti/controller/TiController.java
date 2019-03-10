package com.just.ti.controller;

import com.just.ti.service.AnswerService;
import com.just.ti.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    public String doanswer(HttpServletResponse response, HttpServletRequest request){

        String name= (String) request.getSession().getAttribute("user");

        String ti_id=request.getParameter("ti_id");

        return  null;
    }



}
