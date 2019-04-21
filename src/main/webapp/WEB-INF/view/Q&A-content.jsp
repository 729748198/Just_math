<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/21 0021
  Time: 10:37
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
    <title>师生答疑</title>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css">
    <script src="<%=basePath%>/js/jquery.min.js"></script>
</head>
<body>
<!--导航栏-->
<div class="nav">
    <img class="navbgc" src="<%=basePath%>img/q&anav.jpg" alt="">
    <ul class="worldnav">
        <li class="worldnav">
            <a class="nava" href="<%=path%>/just/index">
                <img src="<%=basePath%>img/navhome.png" alt="" class="navimg navimg1">主页
            </a>
        </li>
        <li class="worldnav">
            <a class="nava" href="<%=path%>/just/MathWorld">
                <img src="<%=basePath%>img/navworld.png" alt="" class="navimg navimg2">大数世界
            </a>
        </li>
        <li class="worldnav">
            <a class="nava" href="<%=path%>/just/Q&A">
                <img src="<%=basePath%>img/navq&a.png" alt="" class="navimg navimg3">师生答疑
            </a>
        </li>
        <li class="worldnav">
            <a class="nava" href="<%=path%>/just/Rank">
                <img src="<%=basePath%>img/navrating.png" alt="" class="navimg navimg4">积分排行
            </a>
        </li>
    </ul>
    ​</div>

<!--container-->
<div class="container">
    <!--background-->
    <img src="<%=basePath%>img/q&abgc.jpg" class="worldbcg" alt="">
    <!--主体部分-->
    <div class="worldmain">
        <!--栏目-->
        <ul class="qa-col">
            <li class="qa-col qa-col1"><button class="qa-button" type="button">看帖子</button></li>
            <li class="qa-col qa-col2"><button class="qa-button" type="button">发帖子</button></li>
            <li class="qa-col qa-col3"><button class="qa-button" type="button">@回复我</button></li>
        </ul>

        <!--内容-->
        <div class="qa-box">
            <table class="qa-table">
                    <tr class="qa-table">
                            <%--帖子标题--%>
                        <td class="qa-table qa-title">

                        </td>

                        <td class="qa-table qa-userimg"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="qa-table-user" ></td>
                            <%--创建者--%>
                        <td class="qa-table qa-username">dfsa</td>
                            <%--创建时间--%>
                        <td class="qa-table qa-date">1999年</td>
                    </tr>

            </table>



        </div>

    </div>


</div>


</body>
</html>
