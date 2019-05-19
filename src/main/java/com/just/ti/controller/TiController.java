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
import org.springframework.transaction.annotation.Transactional;
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
    public Map<String,String> doanswer(HttpServletResponse response, HttpServletRequest request){

        /*
         * 获取参数
         */

        //用户名
        String name= (String) request.getSession().getAttribute("user");
        //用户填的答案
        String doanswer=request.getParameter("answer");
        //问题的id
        String ti_id=request.getParameter("tiid");
        //问题的类型
        String type=request.getParameter("titype");
        //问题所属板块
        String ban="";
        //问题的分数
        String score="";
        //正确答案
        String answer="";
        //是否做对
        Boolean flag=false;
        //返回map
        Map<String,String>map=new HashMap<>(5);

        logger.info(name);
        logger.info(doanswer);
        logger.info(ti_id);

        /*
        根据问题id,查找问题实体
         */
        Question question=questionService.selectById(ti_id);
        ban=question.getTiBan();
        score=question.getTiScore();
        logger.info(question.getTiScore());
        logger.info(question.getTiBan());

        /*
        根据问题类型，判断是填空还是选择
        进行答案匹配，给flag赋值,正确为true,错误为false
        1是选择题
         */
        if(type.equals("1")){
            TiChoice tiChoice=choiceservice.selectById(ti_id);

            //都转换为小写字母比较
            answer=tiChoice.getAnswer().toLowerCase();
            if(doanswer.toLowerCase().equals(answer)){
                flag=true;
            }else {
                flag=false;
            }

            /*
         2是填空题
          */
        }else if(type.equals("2")){

            TiankongWithBLOBs tiankongWithBLOBs = answerService.selectByQId(ti_id);
            answer=tiankongWithBLOBs.getAnswerformarch();
            if(doanswer.equals(answer)){
                flag=true;
            }else {
                flag=false;
            }
        }

        //答案错误，直接返回
        if(!flag) {
            logger.info("回答错误");
            logger.info(doanswer);
            logger.info(answer);
            map.put("flag","no");
            return map;

        //答案正确，进行更新操作
        }else {

            /**
             * 新增一条做题记录
             */
            TiankongWithBLOBs answerWithBLOBs = answerService.selectByQId(ti_id);
            UserTiWithBLOBs userTiWithBLOBs = new UserTiWithBLOBs();
            userTiWithBLOBs.setTiId(ti_id);
            userTiWithBLOBs.setUsername(name);
            userTiWithBLOBs.setRightanswer(answer);
            userTiWithBLOBs.setIsDo(2);
            userTiWithBLOBs.setDoanswer(doanswer);
            userTiWithBLOBs.setDotime(new Date());
            userTiService.add(userTiWithBLOBs);

            /**
             * 更新积分
             */
            Rank rank = rankService.selectByUsername(name);
            rank.set(ban,rank.get(ban)+Integer.valueOf(score));

            int i = rankService.updataScore(rank);

            map.put("flag","yes");
            map.put("score",score);
            return map;
        }
    }


    /**
     * 插入一道填空题目的答案（图片）
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/dotian")
    @ResponseBody
    @Transactional
    public String dotian(@RequestParam("file") MultipartFile file,String answerformath,String answerforshow,String ban,String score,HttpServletResponse response, HttpServletRequest request) throws IOException {

        logger.info("file:"+file+"\nanswerformath:"+answerformath+"\nanswerforshow:"+answerforshow+"\nban:"+ban+"\nscore:"+score);

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

        logger.info(question.toString());
        /*
         * 答案的实体
         */
        TiankongWithBLOBs answerWithBLOBs=new TiankongWithBLOBs();
        answerWithBLOBs.setTiId(name);
        answerWithBLOBs.setAnswerformarch(answerformath);
        answerWithBLOBs.setAnswerforshow(answerforshow);
        answerWithBLOBs.setAnswerType(2);

        logger.info(answerWithBLOBs.toString());
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
     * 插入一道选择题（不带公式图片）
     * @param response
     * @param request
     */

    public  void funchoice(HttpServletResponse response,HttpServletRequest request){
        String ban=request.getParameter("ban");
        String title=request.getParameter("title");
        String score=request.getParameter("score");
        String answer=request.getParameter("answer");
        String aa=request.getParameter("Ba");
        String ab=request.getParameter("Bb");
        String ac=request.getParameter("Bc");
        String ad=request.getParameter("Bd");
       String ti_id=UUID.randomUUID().toString().replaceAll("-", "");

        Integer type=5;

        /**
         */
        Question question=new Question();
        question.setId(ti_id);
        question.setTiBan(ban);
        question.setTiScore(score);
        question.setTiTitle(title);
        question.setTiType(type);

        logger.info(question.toString());
        /**
         * 答案的实体
         */
       TiChoice bloBs=new TiChoice();
        bloBs.setId(ti_id);
        bloBs.setPa(aa);
        bloBs.setPb(ab);
        bloBs.setPc(ac);
        bloBs.setPd(ad);
        bloBs.setAnswer(answer);

        logger.info(bloBs.toString());
        questionService.add(question);
        choiceservice.addById(bloBs);
    }

    /**
     * 插入选择题（图片），返回json
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/doChoice")
    @ResponseBody
    public  String doChoice(@RequestParam("title") MultipartFile title,String answer,String ban,String score,HttpServletResponse response, HttpServletRequest request) throws IOException {
        if(title.isEmpty()){
            return "题目不完整";
        }
        logger.info("进入后端");
        //题目ID
        String name = UUID.randomUUID().toString().replaceAll("-", "");

       //path
        String path="/upload/ti/"+ban;

        // 设置图片上传路径
        String url = request.getSession().getServletContext()
                .getRealPath(path);
        //如果不存在，就创建目录
        FileCreat.creat(url);

        /*
         * 存储图片
         */

        // 获取文件的扩展名
        String ext = FilenameUtils.getExtension(title
                .getOriginalFilename());

        // 以绝对路径保存重名命后的图片

        title.transferTo(new File(url+"/"+name+"."+ext));


        /*
        数据库
         */

        //数据库存储
        //题目的图片地址
        String pictitle=path+"/"+name+"."+ext;


        /*
        选择题答案实体
         */
        TiChoice tiChoice=new TiChoice();
        tiChoice.setId(name);
        tiChoice.setAnswer(answer);

        logger.info("选择题装载完成——"+tiChoice.getAnswer());
        /*
        问题实体
         */
        Question question=new Question();
        question.setTiTitle(pictitle);
        question.setId(name);
        question.setTiType(1);
        question.setTiBan(ban);
        question.setTiScore(score);

        logger.info("问题实体加载完成"+question.getTiTitle());
        /*
        板块分数实体
         */
        TiBan tiBan=tiBanService.selectByBan(ban);
        tiBan.setSumScore(tiBan.getSumScore()+Integer.valueOf(score));
        tiBan.setSumSelect(tiBan.getSumSelect()+1);

        logger.info("板块分数加载完成"+tiBan.getSumScore());

        //插入题目
        questionService.add(question);
        logger.info("插入题目完成");
        //插入答案
        choiceservice.addById(tiChoice);
        logger.info("答案插入完成");
        //更新积分
        tiBanService.update(tiBan);
        logger.info("积分更新完成");
        return  "插入成功";
    }

    /**
     * 插入不带公式的选择题,返回页面
     * @param request
     * @param respnse
     * @return
     */
    @RequestMapping("/dochoice")
    @ResponseBody
    public  String doChoiceNoMath(String answer,String ban,String score,String title,String Ba,String Bb,String Bc,String Bd,HttpServletRequest request,HttpServletResponse respnse){

        String ti_id=UUID.randomUUID().toString().replaceAll("-", "");

        Integer type=5;

        /**
         */
        Question question=new Question();
        question.setId(ti_id);
        question.setTiBan(ban);
        question.setTiScore(score);
        question.setTiTitle(title);
        question.setTiType(type);

        logger.info(question.toString());
        /**
         * 答案的实体
         */
        TiChoice bloBs=new TiChoice();
        bloBs.setId(ti_id);
        bloBs.setPa(Ba);
        bloBs.setPb(Bb);
        bloBs.setPc(Bc);
        bloBs.setPd(Bd);
        bloBs.setAnswer(answer);

        logger.info(bloBs.toString());
        questionService.add(question);
        choiceservice.addById(bloBs);
        return "插入成功";
    }

    /**
     * 根据板块ban随机获取一道选择题（不带公式）
     * @param ban
     * @return
     */
    @RequestMapping("/getByban")
    @ResponseBody
    public  Map<String, String> getByBan(String ban){

        Question question=questionService.selectByBan(ban);
        List<Map<String,String>>result=new ArrayList<>();

           TiChoice choiceWithBLOBs=choiceservice.selectById(question.getId());

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
     * 根据板块随机获取一道题——————选择题或者填空题
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
        map.put("tiid",question.getId());
        map.put("titype",question.getTiType().toString());
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
            logger.info("选择题");
            TiChoice choiceWithBLOBs=choiceservice.selectById(question.getId());

            map.put("answer",choiceWithBLOBs.getAnswer());
        }

        return map;
    }

    @RequestMapping("/getAll")
    @ResponseBody
    public Map<String,Object> getAll(){

        List<Question>list=questionService.selectAll();
        Map<String,Object>map=new HashMap<>();
        map.put("code", 0);
        map.put("msg", "succ");
        map.put("conut", list.size());
        map.put("data",list);
        return map;
    }

    @RequestMapping("/delectById")
    @ResponseBody
    @Transactional
    public  String delectById(String id,String tiban,String tiScore,String tiType){

        logger.info("要删除：\nid:"+id+",板块:"+tiban+",分数："+tiScore+"类型:"+tiType);
    int type=Integer.valueOf(tiType);

        if(type==1||type==5){
            choiceservice.delectByTi_id(id);
        }else if (type==2){
            answerService.delectByTIID(id);
        }
        questionService.delectByid(id);
/*
        板块分数实体
         */
        TiBan tiBan=tiBanService.selectByBan(tiban);
        tiBan.setSumScore(tiBan.getSumScore()+Integer.valueOf(tiScore));
        tiBan.setSumSelect(tiBan.getSumSelect()-1);
        tiBanService.update(tiBan);
        return "删除成功";
    }
}
