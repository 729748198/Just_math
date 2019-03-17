<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 9:34
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
    <title>积分排行</title>
    <link rel="stylesheet" href="<%=basePath%>/css/main.css" type="text/css">
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<!--导航栏-->
<div class="nav">
    <img class="navbgc" src="<%=basePath%>img/ratingnav.jpg" alt="">
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
    <img src="<%=basePath%>img/ratingbgc.jpg" class="worldbcg" alt="">
    <!--主体部分-->
    <div class="worldmain">
        <!--排行榜菜单-->
        <div class="rating-col">
            <ul class="rating-col">
                <li class="rating-col0">排行榜</li>
                <li class="rating-col1"><button class="rating-col1" id="he">总排行</button></li>
                <li class="rating-col1"><button class="rating-col1">章节排行</button></li>
                <li class="rating-col2"><button class="rating-col" id="one"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第一章</button></li>
                <li class="rating-col2"><button class="rating-col" id="two"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第二章</button></li>
                <li class="rating-col2"><button class="rating-col" id="three"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第三章</button></li>
                <li class="rating-col2"><button class="rating-col" id="four"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第四章</button></li>
                <li class="rating-col2"><button class="rating-col" id="five"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第五章</button></li>
                <li class="rating-col2"><button class="rating-col" id="six"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第六章</button></li>
                <li class="rating-col2"><button class="rating-col" id="seven"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第七章</button></li>
                <li class="rating-col2"><button class="rating-col" id="eight"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第八章</button></li>
                <li class="rating-col2"><button class="rating-col" id="nine"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第九章</button></li>
                <li class="rating-col2"><button class="rating-col" id="ten"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第十章</button></li>
                <li class="rating-col2"><button class="rating-col" id="eleven"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第十一章</button></li>
                <li class="rating-col2"><button class="rating-col" id="tweven"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 高数第十二章</button></li>
                <li class="rating-col2"><button class="rating-col" id="gailv"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 概率论</button></li>
                <li class="rating-col2"><button class="rating-col" id="lisan"><img src="<%=basePath%>img/button.png" alt="" class="rating-button"> 离散数学</button></li>
            </ul>
        </div>
        <!--玩家排行-->
        <div id="content">
        <div class="rating-user">
            <img src="<%=basePath%>img/worlduser.jpg" alt="" class="rating-user">
            <div class="rating-user-ifo">
                <p class="rating-user-name" >${user}</p>
                <p class="rating-user-mingci">第${me}名</p>
            </div>
            <div class="rating-user-score" >
                ${he}
            </div>
        </div>
        <!--排行榜-->
        <div class="rating-content">
            <table class="rating-table">
                <tr class="rating-table-tr">
                    <th class="rating-table-th medal rating-col1"><img src="<%=basePath%>img/first.png" alt="" class="rating-medal"></th>
                    <th class="rating-table-user rating-col2"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="rating-table-user"></th>
                    <th class="rating-table-th rating-col3">${first.username}</th>
                    <th class="rating-table-th rating-col4 rating-three">${first.he}</th>
                </tr>
                <tr class="rating-table-tr">
                    <th class="rating-table-th medal rating-col1"><img src="<%=basePath%>img/second.png" alt="" class="rating-medal"></th>
                    <th class="rating-table-user rating-col2"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="rating-table-user"></th>
                    <th class="rating-table-th rating-col3">${second.username}</th>
                    <th class="rating-table-th rating-col4 rating-three">${second.he}</th>
                </tr>
                <tr class="rating-table-tr">
                    <th class="rating-table-th medal rating-col1"><img src="<%=basePath%>img/third.png" alt="" class="rating-medal"></th>
                    <th class="rating-table-user rating-col2"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="rating-table-user"></th>
                    <th class="rating-table-th rating-col3">${thread.username}</th>
                    <th class="rating-table-th rating-col4 rating-three">${thread.he}</th>
                </tr>
                <% int count=4;%>
                <c:forEach items="${rank}" var="r">


                <tr class="rating-table-tr">
                    <th class="rating-table-th rating-col1"><%=count%></th>
                    <th class="rating-table-user rating-col2"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="rating-table-user"></th>
                    <th class="rating-table-th rating-col3">${r.username}</th>
                    <th class="rating-table-th rating-col4">${r.he}</th>
                </tr>
                    <% count++;%>
                </c:forEach>
            </table>
        </div>
        </div>
        <script>
            $(document).ready(function () {
                $(".rating-col2").click(function () {
                    var ban=this.text;
                    alert(ban);
                })
            })
        </script>
        <!--榜单规则-->
        <div class="rating-rules">
            <div style="left: 10px;top:10px;display: inline;position: absolute;">
                <p style="font-size: 18px;font-weight: bold;text-align: center;left:60px;line-height: 25px;display: inline;position: relative;">榜单规则</p>
                <p style="font-size: 15px;font-weight: bold">榜单总规</p>
                <p style="font-size: 12px;line-height: 20px;">榜单范围：</p>
                <p style="font-size: 12px;line-height: 20px;">榜单构成：</p>
                <br><br>
                <p style="font-size: 15px;font-weight: bold">计分规则</p>
                <p style="font-size: 12px;line-height: 20px;">计分项目:</p>
                <p style="font-size: 12px;line-height: 20px;">章节计分:</p>
                <p style="font-size: 12px;line-height: 20px;">游戏计分:</p>
                <p style="font-size: 12px;line-height: 20px;">阅读计分:</p>
                <p style="font-size: 12px;line-height: 20px;">讨论计分:</p>
                <p style="font-size: 12px;line-height: 20px;">分享计分:</p>
            </div>
        </div>
    </div>


</div>
</body>
</html>
