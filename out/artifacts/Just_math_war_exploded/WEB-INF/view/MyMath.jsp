<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>我的大数</title>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css">
</head>
<body>
<!--container-->
<div class="mymath-container">
    <!--background-->
    <img src="<%=basePath%>img/mymathbgc.jpg" class="worldbcg" alt="">
    <!--导航栏-->
    <ul class="mymathnav">
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/index">
                <img src="<%=basePath%>img/navhome1.png" alt="" class="navimg-mm navimg1-mm">主页
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/MyMath">
                <img src="<%=basePath%>img/navmymath.png" alt="" class="navimg-mm navimg2-mm">我的大数
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/community">
                <img src="<%=basePath%>img/navcommunity.png" alt="" class="navimg-mm navimg3-mm">大同社区
            </a>
        </li>
    </ul>
    <img src="<%=basePath%>img/mymath-title.png" alt="" class="navtitle-mm">
    <!--主体部分-->
    <div class="mymathmain">
        <!--个人头像-->
        <div class="user-mm">
            <img src="<%=basePath%>img/worlduser.jpg" alt="" class="user-mm">
            <a href="" class="user-mm-name">${user}</a>
        </div>
        <!--章节-->
        <div class="project-mm">
            <div class="project-mm-content">
                <p>1----12:</p>
                <p class="text-indent">高等数学第一章至第十二章</p>
                <p>X:</p>
                <p class="text-indent">线性代数</p>
                <p>G：</p>
                <p class="text-indent">概率论</p>
            </div>
        </div>
        <!--注释说明-->
        <div class="zhushi-mm">
            <div class="zhushi-mm-content">
                <p>完成度：</p>
                <p class="zhushi-right">0%---30%:</p>
                <p class="zhushi-right">31%---70%:</p>
                <p class="zhushi-right">71%---100%:</p>
            </div>
            <img src="<%=basePath%>img/mymath-img2.png" alt="" id="zhushiimg1-mm">
            <img src="<%=basePath%>img/mymath-img1.png" alt="" id="zhushiimg2-mm">
        </div>
        <!--我的大树-->
        <div class="mytree">
            <img src="<%=basePath%>img/mytree.png" alt="" id="tree">
            <div class="mychapter mychapter1">
                <p class="mychapter mychapter1" style="background-color:#0A4D8B">1</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter2">
                <p class="mychapter mychapter2" style="background-color:#4C9DB8">2</p>
                <div class="myprogress">本章节已完成50%</div>
            </div>
            <div class="mychapter mychapter3">
                <p class="mychapter mychapter3" style="background-color:#50D8CE">3</p>
                <div class="myprogress">本章节已完成88%</div>
            </div>
            <div class="mychapter mychapter4">
                <p class="mychapter mychapter4" style="background-color:#0A4D8B">4</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter5">
                <p class="mychapter mychapter5" style="background-color:#0A4D8B">5</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter6">
                <p class="mychapter mychapter6" style="background-color:#0A4D8B">6</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter7">
                <p class="mychapter mychapter7" style="background-color:#0A4D8B">7</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter8">
                <p class="mychapter mychapter8" style="background-color:#0A4D8B">8</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter9">
                <p class="mychapter mychapter9" style="background-color:#0A4D8B">9</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter10">
                <p class="mychapter mychapter10" style="background-color:#0A4D8B">10</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter11">
                <p class="mychapter mychapter11" style="background-color:#0A4D8B">11</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapter12">
                <p class="mychapter mychapter12" style="background-color:#0A4D8B">12</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapterG">
                <p class="mychapter mychapterG" style="background-color:#0A4D8B">G</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>
            <div class="mychapter mychapterX">
                <p class="mychapter mychapterX" style="background-color:#0A4D8B">X</p>
                <div class="myprogress">本章节已完成5%</div>
            </div>

        </div>

    </div>





</body>
</html>