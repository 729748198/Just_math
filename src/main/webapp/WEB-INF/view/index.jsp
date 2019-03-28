<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/25
  Time: 23:35
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
    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath%>/css/main.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/loginDialog.css" type="text/css">
    <script src="<%=basePath%>/js/jquery.min.js"></script>
</head>
<body>
<%--<c:choose>--%>
<%--<c:when test="${!empty user}">--%>
    <%--<p>欢迎您,${user}</p>--%>
<%--</c:when>--%>
<%--<c:otherwise>--%>
    <%--<a href="<%=path%>/just/Login" id="example">登 录 </a>--%>
<%--</c:otherwise>--%>
<%--</c:choose>--%>

<img src="<%=basePath%>img/homepagebcg.png" alt="" class="hp-bgc">
<!--精模块-->

<div class="jing">
    精
    <div class="menu jing-menu">
        <ul class="hp-menu">
            <li><a href="<%=path%>/just/ti" target="_blank" class="hp-a">难题突破</a></li>
            <li><a href="http://134.175.36.112:8009/" target="_blank" class="hp-a">竞技乐园</a></li>
            <li><a href="<%=path%>/just/ziliao" target="_blank" class="hp-a">资料库</a></li>
        </ul>
    </div>
</div>
<!--互哇哈哈哈-->
<div class="hu">
    互
    <div class="menu hu-menu">
        <ul class="hp-menu">
            <li><a href="<%=path%>/just/MathWorld" target="_blank" class="hp-a">大数世界</a></li>
            <li><a href="<%=path%>/just/Q&A" target="_blank" class="hp-a">师生答疑</a></li>
            <li><a href="<%=path%>/just/Rank" target="_blank" class="hp-a">排行榜</a></li>
        </ul>
    </div>
</div>

<!--同模块-->
<div class="tong">
    同
    <div class="menu tong-menu">
        <ul class="hp-menu tong-menu">
            <li class="tong-menu"><a href="<%=path%>/just/MyMath" target="_blank" class="hp-a tong-a1">我的大数</a></li>
            <li class="tong-menu"><a href="<%=path%>/just/community" target="_blank" class="hp-a tong-a2">大同社区</a></li>
        </ul>
    </div>
</div>
</body>
</html>
