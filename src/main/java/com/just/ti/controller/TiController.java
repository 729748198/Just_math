package com.just.ti.controller;

import com.just.ti.entity.ChoiceWithBLOBs;
import com.just.ti.entity.Question;
import com.just.ti.entity.TiankongWithBLOBs;
import com.just.ti.entity.UserTiWithBLOBs;
import com.just.ti.service.AnswerService;
import com.just.ti.service.Choiceservice;
import com.just.ti.service.QuestionService;
import com.just.ti.service.UserTiService;
import com.just.tools.MD5;
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

        TiankongWithBLOBs answerWithBLOBs=answerService.selectByQId(ti_id);
        Map<String,String>map=new HashMap<>(3);
        /**
         * 新增一条做题记录
         */
        UserTiWithBLOBs userTiWithBLOBs=new UserTiWithBLOBs();
//        userTiWithBLOBs.setTiId(ti_id);
        userTiWithBLOBs.setUsername(name);
//        userTiWithBLOBs.setRightanswer(answerWithBLOBs.getAnswer());
        userTiWithBLOBs.setDoanswer(doanswer);
        userTiWithBLOBs.setDotime(new Date());
//        System.out.println("答案"+answerWithBLOBs.getAnswer());
//        System.out.println("填的"+doanswer);
//        if(answerWithBLOBs.getAnswer().equals(doanswer)){
//            userTiWithBLOBs.setIsDo(2);
//            map.put("mess","答案正确！");
//        }else{
//            userTiWithBLOBs.setIsDo(1);
//            map.put("mess","答案错误！正确答案为：");
//        }
        userTiService.add(userTiWithBLOBs);

        doanswer=doanswer.replaceAll("\"","&quot");
//        map.put("rightanswer",answerWithBLOBs.getAnswer());
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
    public String dotian(@RequestParam("file") MultipartFile file,String answerformath,String answerforshow,String ban,String score,HttpServletResponse response, HttpServletRequest request) throws IOException {

        //ID
        String name = UUID.randomUUID().toString().replaceAll("-", "");

        /**
         * 存储图片
         */
        // 获取文件的扩展名
        String ext = FilenameUtils.getExtension(file
                .getOriginalFilename());
        // 设置图片上传路径
        String url = request.getSession().getServletContext()
                .getRealPath("/upload");
        File filePath = new File(url);
        logger.info("文件保存路径：" + url);
        if (!filePath.exists() && !filePath.isDirectory()) {
            logger.info("目录不存在，创建目录：" + filePath);
            filePath.mkdir();
        }
        url=url+"/"+name+"."+ext;
        // 以绝对路径保存重名命后的图片
        file.transferTo(new File(url));


        //2是填空题
        Integer type=2;

        /**
         * 问题的实体
         */
        Question question=new Question();
        question.setId(name);
        question.setTiTitle(url);
        question.setTiBan(ban);
        question.setTiScore(score);
        question.setTiType(type);

        /**
         * 答案的实体
         */
        TiankongWithBLOBs answerWithBLOBs=new TiankongWithBLOBs();
        answerWithBLOBs.setTiId(name);
        answerWithBLOBs.setAnswerformarch(answerformath);
        answerWithBLOBs.setAnswerforshow(answerforshow);
        answerWithBLOBs.setAnswerType(2);

        logger.info(question.getTiTitle());
        logger.info(answerWithBLOBs.getId());
        logger.info(answerWithBLOBs.getAnswerformarch());

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

//    /**
//     * 根据板块ban随机获取一道题
//     * @param ban
//     * @return
//     */
//    @RequestMapping("/getByban")
//    @ResponseBody
//    public  Map<String, String> getByBan(String ban){
////
////        List<Question> list=questionService.selectByBan(ban);
////        List<Map<String,String>>result=new ArrayList<>();
////        for (Question question:list
////             ) {
//////            ChoiceWithBLOBs choiceWithBLOBs=choiceservice.selectById(question.getId().toString());
////
////            Map<String,String>map=new HashMap<>(7);
////            map.put("title",question.getTiTitle());
////            map.put("A",choiceWithBLOBs.getPa());
////            map.put("B",choiceWithBLOBs.getPb());
////            map.put("C",choiceWithBLOBs.getPc());
////            map.put("D",choiceWithBLOBs.getPd());
////            map.put("jiexi",choiceWithBLOBs.getJiexi());
////            map.put("answer",choiceWithBLOBs.getAnswer());
////            result.add(map);
////        }
////        int length=result.size();
//        return result.get((int)(1+Math.random()*(length-2+1)));
//    }
    public  Map<String,String> getTiByBan(String ban){
        List<Question>list=questionService.selectByBan(ban);
        List<Map<String,String>>result=new ArrayList<>();
        for (Question question:list){
            //如果是填空题
            if(question.getTiType()==2){
                TiankongWithBLOBs tiankongWithBLOBs=answerService.selectByQId(question.getId());

            }

        }
        return null;
    }



}
