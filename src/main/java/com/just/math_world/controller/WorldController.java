package com.just.math_world.controller;

import com.just.JSPController;
import com.just.math_world.entity.Math_world;
import com.just.math_world.entity.WorldFans;
import com.just.math_world.entity.WorldFollow;
import com.just.math_world.service.WorldFansService;
import com.just.math_world.service.WorldFollowService;
import com.just.math_world.service.WorldService;
import com.just.tools.FileCreat;
import com.just.tools.MD5;
import org.apache.commons.io.FilenameUtils;
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
import org.apache.log4j.Logger;

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

    Logger logger=Logger.getLogger(WorldController.class);

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


    /**
     * 处理发送
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/dofrom")
    public String doimg(MultipartFile file,String title,String content,HttpServletRequest request,HttpServletResponse response) throws IOException {

        JSPController jspController=new JSPController();
        if(file.isEmpty()){
            logger.info("无文件");
            String name= (String) request.getSession().getAttribute("user");
            request.setAttribute("user",name);
            Math_world world=setWorld(name,content,new Date(),0,title,0);
             service.insertByUsername(world);

            return "redirect:/just/MathWorld";
        }
    String contentType=file.getContentType();
    logger.info("类型"+contentType);
    String name= (String) request.getSession().getAttribute("user");
    String uri =MD5.md5(file.getOriginalFilename());
    logger.info(uri);
    String ext = FilenameUtils.getExtension(file
                .getOriginalFilename());
    logger.info(ext);
    String url = request.getSession().getServletContext()
                .getRealPath("/upload/mathworld");

    //如果不存在，就创建一个
    FileCreat.creat(url);
    String path="/upload/mathworld/"+uri+"."+ext;

    url=url+"/"+uri+"."+ext;
    file.transferTo(new File(url));

    logger.info("插入图片");
    Math_world world=setWorld(name,path,new Date(),1,title,0);
    service.insertByUsername(world);

        return "redirect:/just/MathWorld";
    }

    /**
     *
     * @param name 用户名
     * @param content 内容
     * @param date 时间
     * @param type 类型0是文章，1是图片，2是视频
     * @param title 标题
     * @param bool 是否精品，默认是0
     * @return
     */
    public static Math_world setWorld(String name,String content,Date date,Integer type,String title,Integer bool){
        Math_world world=new Math_world();
        world.setContent(content);
        world.setCreatTime(date);
        world.setIsOk(bool);
        world.setTitle(title);
        world.setWorldtype(type);
        world.setUser(name);
        return world;

    }
}
