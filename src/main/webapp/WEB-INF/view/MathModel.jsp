<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/11 0011
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- 判断el表达式是否为空的标准函数声明 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!-- 判断el集合是否为空的声明 -->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数学建模</title>
    <link rel="stylesheet" href="<%=basePath%>/css/main.css" type="text/css">
    <script src="<%=basePath%>/js/jquery.min.js"></script>
</head>
<body>
<div class="mymath-container">
    <!--background-->
    <img src="<%=basePath%>img/mathmodel-bgc.jpg" class="worldbcg" alt="">
    <!--导航栏-->
    <ul class="mymathnav">
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/index">
                <img src="<%=basePath%>img/exe-home.png" alt="" class="navimg-mm navimg1-mm">主页
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/ti">
                <img src="<%=basePath%>img/exe-exe.png" alt="" class="navimg-mm navimg2-mm">难题突破
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="<%=path%>">
                <img src="<%=basePath%>img/exe-db.png" alt="" class="navimg-mm navimg3-mm">数学建模
            </a>
        </li>
    </ul>
    <!--主体部分-->
    <div class="mymathmain" style="top:10px;height: 710px;">
        <!--目录-->
        <div class="exe-menu">
            目录<br>
            <div class="exe-chapter">
                <ul class="exe-chapter" style="list-style: none">
                    <li><a href="" class="exe-chapter" style="padding-bottom: 15%;padding-top:15%;padding-left: 0;text-align: center;font-size:18px; width: 100%">入门了解</a></li>
                    <li><a href="" class="exe-chapter" style="padding-bottom: 15%;padding-top:15%;padding-left: 0;text-align: center;font-size:18px; width: 100%">资源共享</a></li>
                    <li><a href="" class="exe-chapter" style="padding-bottom: 15%;padding-top:15%;padding-left: 0;text-align: center;font-size:18px; width: 100%">真题详解</a></li>
                    <li><a href="" class="exe-chapter" style="padding-bottom: 15%;padding-top:15%;padding-left: 0;text-align: center;font-size:18px; width: 100%">重点指引</a></li>
                    <li><a href="" class="exe-chapter" style="padding-bottom: 15%;padding-top:15%;padding-left: 0;text-align: center;font-size:18px; width: 100%">辅助工具</a></li>
                </ul>
            </div>
        </div>
        <div class="exe-exe">
            <!--抬头-->
            <p class="exe-chapter">数学建模 > 入门了解</p>
            <!--资料-->
            <div class="exe-content">
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-knowledge">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/knowledge.png" alt="" class="db-content">
                    <p class="db-content">基础知识</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-expand">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/expand-knowledge.png" alt="" class="db-content" style="top: 45px;left:38px;">
                    <p class="db-content">拓展知识</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-history">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/histroy-exe.png" alt="" class="db-content" style="top: 45px;left:35px;">
                    <p class="db-content">往届练习题</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-videos">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/videos.png" alt="" class="db-content" style="top: 35px;left:32px;">
                    <p class="db-content">视频微课</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-bcg">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/bcg-database.png" alt="" class="db-content" style="top: 25px;left:38px;">
                    <p class="db-content">背景资料库</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-kaoyan">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/kaoyan.png" alt="" class="db-content" style="top: 30px;left:25px;">
                    <p class="db-content">考研真题</p>
                </a>



            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>