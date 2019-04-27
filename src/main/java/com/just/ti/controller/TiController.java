package com.just.ti.controller;

import com.just.ti.entity.*;
import com.just.ti.service.*;
import com.just.tools.FileCreat;
import com.just.tools.MD5;
import com.just.user.entity.Rank;
import com.just.user.service.RankService;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
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

    @Autowired
    RankService rankService;

    @Autowired
    TiBanService tiBanService;

    Logger logger= Logger.getLogger(TiController.class);
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
    public String doanswer(HttpServletResponse response, HttpServletRequest request){

        /**
         * 获取参数
         */
        String name= (String) request.getSession().getAttribute("user");
        String doanswer=request.getParameter("doanswer");
        String ti_id=request.getParameter("ti_id");
        String ban=request.getParameter("ban");
        String score=request.getParameter("score");

        /**
         * 新增一条做题记录
         */
        TiankongWithBLOBs answerWithBLOBs=answerService.selectByQId(ti_id);
        UserTiWithBLOBs userTiWithBLOBs=new UserTiWithBLOBs();
        userTiWithBLOBs.setTiId(ti_id);
        userTiWithBLOBs.setUsername(name);
        userTiWithBLOBs.setRightanswer(answerWithBLOBs.getAnswerformarch());
        userTiWithBLOBs.setDoanswer(doanswer);
        userTiWithBLOBs.setDotime(new Date());
        userTiService.add(userTiWithBLOBs);

        /**
         * 更新积分
         */
        Rank rank=new Rank();
        rank.setUsername(name);
        rank.set(ban,Integer.valueOf(score));

        int i=rankService.updataScore(rank);

        return  "success";
    }

    /**
     * 插入一道填空题目的答案
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/dotian")
    @ResponseBody
    public String dotian(@RequestParam("file") MultipartFile file,String answerformath,String answerforshow,String ban,String score,HttpServletResponse response, HttpServletRequest request) throws IOException {

        //ID
        String name = UUID.randomUUID().toString().replaceAll("-", "");

        /*
         * 存储图片
         */
        // 获取文件的扩展名
        String ext = FilenameUtils.getExtension(file
                .getOriginalFilename());
        // 设置图片上传路径
        String url = request.getSession().getServletContext()
                .getRealPath("/upload/ti/"+ban);
        //如果不存在，就创建目录
        FileCreat.creat(url);

        url=url+"/"+name+"."+ext;
        // 以绝对路径保存重名命后的图片
        file.transferTo(new File(url));

        //数据库的图片地址
        String uri="/upload/ti/"+ban+"/"+name+"."+ext;
        /*
         * 问题的实体
         */

        //2是填空题
        Integer type=2;

        Question question=new Question();
        question.setId(name);
        question.setTiTitle(uri);
        question.setTiBan(ban);
        question.setTiScore(score);
        question.setTiType(type);

        /*
         * 答案的实体
         */
        TiankongWithBLOBs answerWithBLOBs=new TiankongWithBLOBs();
        answerWithBLOBs.setTiId(name);
        answerWithBLOBs.setAnswerformarch(answerformath);
        answerWithBLOBs.setAnswerforshow(answerforshow);
        answerWithBLOBs.setAnswerType(2);

        /*
            更新题目章节总分数
         */
        TiBan tiBan=tiBanService.selectByBan(ban);
        //填空题数量+1
        tiBan.setSumTiankong(tiBan.getSumTiankong()+1);
        //当前章节总分+score
        tiBan.setSumScore(tiBan.getSumScore()+Integer.valueOf(score));


        /*
          调用service执行插入
         */
        questionService.add(question);
        answerService.add(answerWithBLOBs);
        tiBanService.update(tiBan);
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
//
//        /**
//         */
//        Question question=new Question();
//        question.setId(ti_id);
//        question.setTiBan(ban);
//        question.setTiScore(score);
//        question.setTiTitle(title);
//        question.setTiSum(type);

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
//        questionService.add(question);
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
    public  String doChoice(@RequestParam("title") MultipartFile title,@RequestParam("Ba") MultipartFile Ba,@RequestParam("Bb") MultipartFile Bb,@RequestParam("Bc") MultipartFile Bc,@RequestParam("Bd") MultipartFile Bd,@RequestParam("jiexi") MultipartFile jiexi,String answer,String ban,String score,HttpServletResponse response, HttpServletRequest request){
        //ID
        String name = UUID.randomUUID().toString().replaceAll("-", "");


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
     * 根据板块ban随机获取一道选择题
     * @param ban
     * @return
     */
    @RequestMapping("/getByban")
    @ResponseBody
    public  Map<String, String> getByBan(String ban){

        Question question=questionService.selectByBan(ban);
        List<Map<String,String>>result=new ArrayList<>();

           ChoiceWithBLOBs choiceWithBLOBs=choiceservice.selectById(Integer.valueOf(question.getId()));

            Map<String,String>map=new HashMap<>(7);
            map.put("title",question.getTiTitle());
            map.put("A",choiceWithBLOBs.getPa());
            map.put("B",choiceWithBLOBs.getPb());
            map.put("C",choiceWithBLOBs.getPc());
            map.put("D",choiceWithBLOBs.getPd());
            map.put("jiexi",choiceWithBLOBs.getJiexi());
            map.put("answer",choiceWithBLOBs.getAnswer());
            result.add(map);

        int length=result.size();
        return map;
    }

    /**
     * 根据板块随机获取一道题
     * @param ban
     * @return
     */
    @RequestMapping("/getBanRandom")
    @ResponseBody
        public  Map<String,String> getTiByBan(String ban){
        logger.info(ban);
        Question question=questionService.selectTianRandom(ban);
        logger.info(question.getTiType());
        Map<String,String> map=new HashMap<>(10);
        map.put("title",question.getTiTitle());
        map.put("score",question.getTiScore());
        map.put("id",question.getId());
        logger.info(question.getId());
        //如果是填空题
        if(question.getTiType()==2){
            logger.info("填空");
                TiankongWithBLOBs tiankongWithBLOBs=answerService.selectByQId(question.getId());
                map.put("show",tiankongWithBLOBs.getAnswerforshow());
                map.put("march",tiankongWithBLOBs.getAnswerformarch());
                map.put("jiexi",tiankongWithBLOBs.getJiexi());
        }
        if(question.getTiType()==1){
            ChoiceWithBLOBs choiceWithBLOBs=choiceservice.selectById(Integer.valueOf(question.getId()));
            map.put("A",choiceWithBLOBs.getPa());
            map.put("B",choiceWithBLOBs.getPb());
            map.put("C",choiceWithBLOBs.getPc());
            map.put("D",choiceWithBLOBs.getPd());
            map.put("jiexi",choiceWithBLOBs.getJiexi());
            map.put("answer",choiceWithBLOBs.getAnswer());
        }

        return map;
    }



}
