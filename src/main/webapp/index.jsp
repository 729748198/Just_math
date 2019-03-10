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
<script >
    window.location.href="just/index";
</script>
</body>
</html>
