package com.just.learn.controller;

import com.just.learn.service.LearnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * @author 贺文杰
 * 2018/11/11 3:02
 */
@Controller
@RequestMapping("learn")
public class LearnController {
    @Autowired
    LearnService service;

    /**接口
     * 按照板块查询所有资料
     * @param ban
     * @return
     */
    @RequestMapping("/getBan")
    @ResponseBody
    public List<Map<String,String>> selectByBan(String ban){
        return service.selectBan(ban);
    }

    @ModelAttribute
    public  void kuayu(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
    }
}
