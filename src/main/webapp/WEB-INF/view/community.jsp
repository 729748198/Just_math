<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/17
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- 判断el表达式是否为空的标准函数声明 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 判断el集合是否为空的声明 -->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大同社区</title>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css">
</head>
<body>

<!--container-->
<div class="mymath-container">
    <!--background-->
    <img src="<%=basePath%>img/com-bcg.jpg" class="worldbcg" alt="" >
    <!--导航栏-->
    <ul class="mymathnav">
        <li class="mymathnav">
            <a class="nava" href="#">
                <img src="<%=basePath%>img/navhome1.png" alt="" class="navimg-mm navimg1-mm">主页
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="#">
                <img src="<%=basePath%>img/navmymath.png" alt="" class="navimg-mm navimg2-mm">我的大数
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="#">
                <img src="<%=basePath%>img/navcommunity.png" alt="" class="navimg-mm navimg3-mm">大同社区
            </a>
        </li>
    </ul>
    <!--主体部分-->
    <div class="mymathmain" style="width: 825px;top:5px;left: 235px;">
        <!--个人头像-->
        <div class="user-mm">
            <img src="<%=basePath%>img/worlduser.jpg" alt="" class="user-mm">
            <a href="" class="user-mm-name">蟹老板XDH</a>
        </div>
        <!--聊天群组-->
        <div class="com-group">
            <p class="com-group">群聊</p>
            <br>
            <ul class="com-menu">
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像1.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像2.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像3.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像4.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像5.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像6.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu"> <a class="com-main">
                    <img src="<%=basePath%>img/头像7.png" alt="" class="com-img">
                    <p class="com-name">大数乐园</p>
                    <p class="com-last">哇哈哈哈哈哈！</p>
                    <p class="com-date">23:29</p>
                </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像8.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像6.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
                <li class="com-menu"> <a class="com-main">
                    <img src="<%=basePath%>img/头像7.png" alt="" class="com-img">
                    <p class="com-name">大数乐园</p>
                    <p class="com-last">哇哈哈哈哈哈！</p>
                    <p class="com-date">23:29</p>
                </a>
                </li>
                <li class="com-menu">
                    <a class="com-main">
                        <img src="<%=basePath%>img/头像8.png" alt="" class="com-img">
                        <p class="com-name">大数乐园</p>
                        <p class="com-last">哇哈哈哈哈哈！</p>
                        <p class="com-date">23:29</p>
                    </a>
                </li>
            </ul>
        </div>
        <!--聊天内容-->
        <div class="chatting">
            <p class="chatting">高数乐园</p>
            <div class="chatting-room">
                <ul class="chatting-content">
                    <li class="chatting-content others">
                        <p class="chatting-user">路人001</p>
                        <img src="<%=basePath%>img/头像1.png" alt="" class="chatting-user">
                        <p class="chatting-content">蟹老板威武!</p>
                    </li>
                    <li class="chatting-content others">
                        <p class="chatting-user">路人002</p>
                        <img src="<%=basePath%>img/头像1.png" alt="" class="chatting-user">
                        <p class="chatting-content">蟹老板威武！</p>
                    </li>
                    <li class="chatting-content mine">
                        <p class="chatting-user">蟹老板XDH</p>
                        <img src="<%=basePath%>img/worlduser.jpg" alt="" class="chatting-user">
                        <p class="chatting-content">客气客气！</p>
                    </li>
                    <li class="chatting-content others">
                        <p class="chatting-user">路人003</p>
                        <img src="<%=basePath%>img/头像1.png" alt="" class="chatting-user">
                        <p class="chatting-content">蟹老板威武！</p>
                    </li>
                    <li class="chatting-content others">
                        <p class="chatting-user">路人005</p>
                        <img src="<%=basePath%>img/头像1.png" alt="" class="chatting-user">
                        <p class="chatting-content">蟹老板威武！</p>
                    </li>
                    <li class="chatting-content others">
                        <p class="chatting-user">路人004</p>
                        <img src="<%=basePath%>img/头像1.png" alt="" class="chatting-user">
                        <p class="chatting-content">蟹老板威武！</p>
                    </li>
                    <li class="chatting-content mine">
                        <p class="chatting-user">蟹老板XDH</p>
                        <img src="<%=basePath%>img/worlduser.jpg" alt="" class="chatting-user">
                        <p class="chatting-content">客气客气！</p>
                    </li>
                </ul>
            </div>
            <input type="text" class="chat-reply">
            <a href="" class="chat-submit">发送</a>
        </div>




    </div>
</div>
</body>
</html>