<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/9
  Time: 16:14
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
<html>
<head>
    <title>做题Demo</title>
    <script src="https://www.wiris.net/demo/editor/editor"></script>
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>


<div>
    ${ti}
</div>

<br>
<br>
<script>
    var editor;
    window.onload = function () {
        editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
        editor.insertInto(document.getElementById('editorContainer'));
    }
</script>
<div id="editorContainer"></div>
<button id="su"> 提交</button>
<script>
    $(document).ready(function () {
        $("#su").click(function () {
            console.log($(".wrs_container").html());
            var doanswer=$(".wrs_container").html();


        })

    })
</script>
</body>
</html>
