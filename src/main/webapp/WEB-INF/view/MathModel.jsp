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
    <link rel="stylesheet" href="<%=basePath%>/css/main.css?version=1.001" type="text/css">
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
                <div class="MM-content MM-text">
                    <p class="biaoti">建模应用</p>
                    <p class="neirong">数学是研究现实世界数量关系和空间形式的科学，在它产生和发展的历史长河中，一直是和各种各样的应用问题紧密相关的。数学的特点不仅在于概念的抽象性，逻辑的严密性，结论的明确性和体系的完整性，而且在于它应用的广泛性。自从20世纪以来，随着科学技术的迅速发展和计算机的日益普及，人们对各种问题的要求越来越精确，使得数学的应用越来越广泛和深入，特别是在21世纪这个知识经济时代，数学科学的地位会发生巨大的变化，它正在从国家经济和科技的后备走到了前沿。经济发展的全球化、计算机的迅猛发展、数学理论与方法的不断扩充，使得数学已经成为当代高科技的一个重要组成部分和思想库，数学已经成为一种能够普遍实施的技术。培养学生应用数学的意识和能力已经成为数学教学的一个重要方面。</p>
                </div>
                <div class="MM-content MM-img">
                    <img src="<%=basePath%>img/mathmodel-example.jpg" class="MM-img" alt="">
                </div>
                <div class="MM-content MM-documt">
                    <a href="<%=basePath%>img/mathmodel-example.jpg" download="mathmodel-example.jpg" class="MM-documt">
                        <img src="<%=basePath%>img/MM-examplefile.png" alt="" class="MM-img">
                        <p class="biaoti">文件名——测试图片</p>
                    </a>
                </div>

            </div>





        </div>
    </div>

</div>
</div>
</body>
</html>