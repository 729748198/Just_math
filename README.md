# Just_math
校园项目

### 技术栈

* 后端： SSM
* 前端： JSP+Jquery
后台使用layui模板
* 数据库：Mysql 5.7

修改resources文件夹下的jdbc.properties，启动项目



### 项目结构

├─.idea  
│  ├─inspectionProfiles  
│  └─libraries  
├─db  ————数据库文件  
├─src  
│  └─main  
│      ├─java  
│      │  └─com  
│      │      └─just  
│      │          ├─fatie  ————发帖模块   
│      │          ├─learn  ————学习板块（目前没有用）  
│      │          ├─math_world  ————大数世界模块  
│      │          ├─ti  ————做题模块  
│      │          ├─tools  ————格式类工具  
│      │          ├─user  ————用户模块包括排名逻辑  
│      │          └─webSorcket   ————大同社区模块（一个在线聊天页面）  
│      ├─resources  ——配置文件，本来打算加入Shiro,没有搞定  
│      └─webapp  
│          ├─admin  ————后台页面，使用了Layui  
│          ├─assets  
│          ├─css  
│          ├─img  
│          │  └─adminlte  
│          │      └─credit  
│          ├─js  
│          │  └─uedit  ——百度编辑器  
│          ├─layui 
│          ├─static  ————静态资源有点混乱  
│          └─WEB-INF  
│              └─view  ————视图页面  
└─target     
    │  ├─upload  ————上传后的文件在这里  
    ├─maven-archiver  
    └─test-classes  
        ├─ti  
        └─user  



### 要点解释：  

1. #### 页面控制交互  

   关于jsp页面对应的内容，都可以在这个控制层找到注释。  

   java  
   └─com  
   	└─just  
       	└─JSPController  

   JSPController是控制页面跳转的控制器，传点参数到新页面，可以全改为ajax渲染

2. #### 公式编辑器：

   (1).首先引入js文件



   (2).需要插入编辑器的地方写一个div占位符

   ![1561360558075](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1561360558075.png)

   (3).JavaScript渲染

   ![1561360913473](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1561360913473.png)

   

   

   此时，编辑器已经出现了，编辑器的显示隐藏用![1561360972178](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1561360972178.png)就可以

   （4）.上传题目公式

   ![1561361483070](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1561361483070.png)

   

               var answerformarch=editor.getMathML();  ————获取公式的字符串，用来与正确答案进行比对
               var answerforshow=$(".wrs_container").html();  ————获取公式的JavaScript代码，可以在html中展示为公式
               
               后端传入数据库就行。

       
   (5). 公式在页面上的展示

   ![1561366870637](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1561366870637.png)

   用ajax获取到这段html代码后，直接嵌入到div中，就可以展示为公式了。

   

      $("#right").html(data.rightanswer);

3. #### 后台（管理页面）

    └─webapp
           ├─admin 

   后台页面，使用了Layui，访问链接为：<http://localhost:8080/Just_math/admin/index.html>

   只使用了Layui的数据表格，教程为：<https://www.layui.com/doc/modules/table.html>

   
