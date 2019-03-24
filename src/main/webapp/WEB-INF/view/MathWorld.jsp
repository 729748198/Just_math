<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 9:20
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
    <title>大数世界</title>
    <link rel="stylesheet" href="<%=basePath%>/css/main.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/loginDialog.css" type="text/css">
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
</head>

<body>
<%

        String username= (String) request.getSession().getAttribute("user");
%>
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
    <img src="<%=basePath%>img/worldbgc.jpg" class="worldbcg" alt="">
    <!--主体部分-->
    <div class="worldmain">
        <!--用户头像及信息-->
        <div class="user">
            <img class="worlduser" src="<%=basePath%>img/worlduser.jpg" alt="">
            <span class="username"><b>${user}</b></span>
            <table id="customers">
                <tr>
                    <th><b>${follow.size()}</b></th>
                    <th><b>${fans.size()}</b></th>
                    <th><b>${myworlds.size()}</b></th>
                </tr>
                <tr>
                    <td>关注</td>
                    <td>粉丝</td>
                    <td>发表量</td>
                </tr>
            </table>
        </div>
        <!--发表栏-->
        <div class="worldsubmit">
            <%--<form method="post" action="<%=path%>/world/dofrom" enctype="multipart/form-data">--%>


            <%--<input name="title" type="text" >--%>
            <input class="world-user-submit"  name="content" id="world-user-submit" type="text"/><br>
            <%--<input type="file" name="file" value="选择图片">--%>
            <input  type="submit" class="world-submit-button">发  表</input>
            <%--</form>--%>
        </div>
        <!--分类按钮-->
        <div class="worldclassify">
            <ul class="world-classify-ul">
                <li class="world-classify-il world-allclass" id="allWorld">全部</li>
                <li class="world-classify-il world-articleclass" id="txtWorld">文章</li>
                <li class="world-classify-il world-imgclass" id="picWorld">图片</li>
                <li class="world-classify-il world-mvclass" id="vdoWorld">视频</li>
            </ul>
        </div>
        <!--栏目-->
        <div class="worldcolumn">
            <ul class="world-col-ul">
                <li class="world-col-li" id="jingxuan">精选</li>
                <li class="world-col-li" id="wode">我的小世界</li>
            </ul>
        </div>
        <!--内容-->
        <div class="worldcontent" id="content">
            <c:forEach items="${worlds}" var="world"  >
                <c:if test="${world.worldtype==0}">
                <tr>
                    <td>用户名：${world.user}</td>
                    <td>标题：${world.title}</td>
                    <td>内容：${world.content}</td>
                    <td>时间：<fmt:formatDate value="${world.creatTime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                </tr>
                </c:if>
                <c:if test="${world.worldtype==1}">
                    <tr>
                        <td>用户名：${world.user}</td>
                        <td>标题：${world.title}</td>
                        <td>内容：<img src="${world.content}"/></td>
                        <td>时间：<fmt:formatDate value="${world.creatTime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                    </tr>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
<SCRIPT>
    $(document).ready(function () {


            $.ajax({
                url:"<%=path%>/world/getallTxt",
                type:"get",
                success:function (data) {
                    var jsObject = JSON.parse(data);
                    var str='   <ul class="worldcontent">' ;
                    for(var i=0;i<jsObject.length;i++){
                        str+='<li class="worldcontent"><div class="tiezi">';
                        str+='<img src="<%=basePath%>/img/worlduser.jpg"  class="tie-user">';
                        str+='<p class="tie-username">'+jsObject[i].user+'</p>';
                        str+='<p class="tie-title">'+jsObject[i].title+'</p>';
                        str+='<text class="tie-main">'+jsObject[i].content+'</text></div></li>';
                    }
                    str+='</ul>';
                    $("#content").html(str);
                }
            })

        $("#picWorld").click(function () {
            $.ajax({
                url:"<%=path%>/world/getallPic",
                type:"get",
                success:function (data) {
                    var jsObject = JSON.parse(data);
                    var str="";
                    str+="<table class='dataintable2'>";
                    str+="<tr>" ;
                    str+="<th style='width:20%'>" ;
                    str+="标题" ;
                    str+="</th>" ;
                    str+="<th style='width:20%' >" ;
                    str+="图片" ;
                    str+="</th>" ;
                    str+="<th style='width:20%'>" ;
                    str+="发帖人" ;
                    str+="</th>" ;
                    str+="</tr>";
                    for(var i=0;i<jsObject.length;i++){
                        str+="<tr>";
                        str+="<td>"+i+"."+jsObject[i].title+"</td>";
                        str+="<td> <img src= '"+jsObject[i].content+"'/></td>";
                        str+="<td>"+jsObject[i].user+"</td>";
                        str+="</tr>";
                    }
                    str+="</table>";
                    $("#content").html(str);
                }
            })
        });
        $("#allWorld").click(function () {
            $.ajax({
                url:"<%=path%>/world/getall",
                type:"get",
                success:function (data) {
                    var jsObject = JSON.parse(data);
                    var str="";
                    str+="<table class='dataintable2'>";
                    str+="<tr>" ;
                    str+="<th style='width:20%'>" ;
                    str+="标题" ;
                    str+="</th>" ;
                    str+="<th style='width:20%' >" ;
                    str+="内容" ;
                    str+="</th>" ;
                    str+="<th style='width:20%'>" ;
                    str+="发帖人" ;
                    str+="</th>" ;
                    str+="</tr>";
                    for(var i=0;i<jsObject.length;i++){
                        if(jsObject[i].worldtype==0) {

                            str += "<tr>";
                            str += "<td>" + i + "." + jsObject[i].title + "</td>";
                            str += "<td>" + jsObject[i].content + "</td>";
                            str += "<td>" + jsObject[i].user + "</td>";
                            str += "</tr>";
                        }else if(jsObject[i].worldtype==1){
                            str+="<tr>";
                            str+="<td>"+i+"."+jsObject[i].title+"</td>";
                            str+="<td> <img src= '"+jsObject[i].content+"'/></td>";
                            str+="<td>"+jsObject[i].user+"</td>";
                            str+="</tr>";
                        }
                    }
                    str+="</table>";
                    $("#content").html(str);
                }
            })
        });
        $("#wode").click(function () {
            $.ajax({
                url:"<%=path%>/world/getbyname?username="+${user},
                type:"get",
                success:function(data){

                    var jsObject = JSON.parse(data);
                    var str="";
                    str+="<table class='dataintable2'>";
                    str+="<tr>" ;
                    str+="<th style='width:20%'>" ;
                    str+="标题" ;
                    str+="</th>" ;
                    str+="<th style='width:20%' >" ;
                    str+="内容" ;
                    str+="</th>" ;
                    str+="<th style='width:20%'>" ;
                    str+="发帖人" ;
                    str+="</th>" ;
                    str+="</tr>";
                    for(var i=0;i<jsObject.length;i++){
                        str+="<tr>";
                        str+="<td>"+i+"."+jsObject[i].title+"</td>";
                        str+="<td>"+jsObject[i].content+"</td>";
                        str+="<td>"+jsObject[i].user+"</td>";
                        str+="</tr>";
                    }
                    str+="</table>"
                    $("#content").html(str);
                }
            })

        });
        $("#jingxuan").click(function () {
            $.ajax({
                url:"<%=path%>/world/getjing",
                type:"get",
                success:function(data){

                    var jsObject = JSON.parse(data);
                    var str="";
                    str+="<table class='dataintable2'>";
                    str+="<tr>" ;
                    str+="<th style='width:20%'>" ;
                    str+="标题" ;
                    str+="</th>" ;
                    str+="<th style='width:20%' >" ;
                    str+="内容" ;
                    str+="</th>" ;
                    str+="<th style='width:20%'>" ;
                    str+="发帖人" ;
                    str+="</th>" ;
                    str+="</tr>";
                    for(var i=0;i<jsObject.length;i++){
                        str+="<tr>";
                        str+="<td>"+i+"."+jsObject[i].title+"</td>";
                        str+="<td>"+jsObject[i].content+"</td>";
                        str+="<td>"+jsObject[i].user+"</td>";
                        str+="</tr>";
                    }
                    str+="</table>"
                    $("#content").html(str);
                }
            })

        })

    })
</SCRIPT>


</body>
</html>
