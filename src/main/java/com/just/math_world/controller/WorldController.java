package com.just.math_world.controller;

import com.just.math_world.entity.Math_world;
import com.just.math_world.entity.WorldFans;
import com.just.math_world.entity.WorldFollow;
import com.just.math_world.service.WorldFansService;
import com.just.math_world.service.WorldFollowService;
import com.just.math_world.service.WorldService;
import com.just.tools.MD5;
import org.aspectj.weaver.World;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author 贺文杰
 * 2018/12/25 16:18
 */
@Controller
@RequestMapping("world")
public class WorldController {
    @Autowired
    WorldService service;

    @Autowired
    WorldFollowService Followservice;

    @Autowired
    WorldFansService fansService;

    @ModelAttribute
    public  void kuayu(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
    }
    /**
     * 获取所有作品的接口
     * @return
     */
    @RequestMapping("/getall")
    @ResponseBody
    public List<Math_world> getallOK(){
        List<Math_world>lists=service.getall();
        return  lists;
    }
    /**
     * 获取所有图片作品的接口
     * @return
     */
    @RequestMapping("/getallPic")
    @ResponseBody
    public List<Math_world> getallPic(){
        List<Math_world>lists=service.getAllPic();
        return  lists;
    }
    /**
     * 获取所有文章作品的接口
     * @return
     */
    @RequestMapping("/getallTxt")
    @ResponseBody
    public List<Math_world> getallTxt(){
        List<Math_world>lists=service.getAllTxt();
        return  lists;
    }
    /**
     * 获取所有视频作品的接口
     * @return
     */
    @RequestMapping("/getallVdo")
    @ResponseBody
    public List<Math_world> getallVdo(){
        List<Math_world>lists=service.getAllVdo();
        return  lists;
    }
    /**
     * 接口：根据用户名获取列表
     * @param username
     * @return
     */
    @RequestMapping("/getbyname")
    @ResponseBody
    public List<Math_world> getbyname(String username){
        List<Math_world>lists=service.getbyuser(username);
        return  lists;
    }

    /**
     * 获取精品接口
     * @return
     */
    @RequestMapping("/getjing")
    @ResponseBody
    public List<Math_world> getAlljing(){
        List<Math_world>list=service.getAllJIng();
        return  list;
    }
 //关注模板

    /**
     * 获取全部关注
     * @return
     */
    @RequestMapping("/getallfollow")
    @ResponseBody
    public List<WorldFollow> getallfollow(){
        List<WorldFollow> list=Followservice.getall();

        return list;
    }

    /**
     * 根据用户名获取其关注列表
     * @param name 用户名
     * @return 关注列表
     */
    public   List<WorldFollow> getFollowByUsernane(String name){
        List<WorldFollow> list=Followservice.getByUsername(name);
        return list;
    }


    /**
     * 两个测试方法
     * @return
     */
    @RequestMapping("/getid")
    @ResponseBody
    public String getbyid(){
        System.out.println("宿舍");
        WorldFollow follow=Followservice.getbyid(1);
        System.out.println(follow.getId()+" "+follow.getUsername()+" "+follow.getFollowedUsername()+" "+follow.getStatus()+" "+follow.getCreatedAt());
        return follow.getUsername();
    }
    public WorldFans getfanbyid(){
        System.out.println("查询");
        return fansService.selectbyid(1);
    }



    @RequestMapping("/dofrom")
    public String doimg(MultipartFile file, HttpServletRequest request) throws IOException {

    String contentType=file.getContentType();
    System.out.println(contentType);
    String name= (String) request.getSession().getAttribute("user");
    String title=request.getParameter("title");
    System.out.println(title);
    String uri =MD5.md5(file.getOriginalFilename());
    String content="http://localhost:8080/img/"+uri+".jpg";
    Math_world world=new Math_world();
    world.setContent(content);
    world.setUser(name);
    world.setCreatTime(new Date());
    world.setWorldtype(1);
    world.setTitle(title);
    world.setIsOk(0);
    System.out.println(name);
    File loadPath = new File(content);
    System.out.println(loadPath);
    file.transferTo(loadPath);
    service.insertByUsername(world);

        return "MathWorld";
    }
}
