<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 22:55
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
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="<%=basePath%>/css/sign.css" type="text/css">
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<form class="form-signin" action="<%=path%>/user/dologin" Method="Post">
    <h2 class="form-signin-heading">登录网站</h2>
    <label for="username" class="sr-only">username</label>
    <input
            type="text" id="username" class="form-control" name="username"
            placeholder="用户名" required autofocus>
    <label
            for="password" class="sr-only">Password</label>
    <input
            type="password" id="password" class="form-control"
            name="password" placeholder="密码" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
</form>
</body>
</html>
