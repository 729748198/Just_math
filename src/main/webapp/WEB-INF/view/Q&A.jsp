<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 9:31
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
</head>
<body>
<!--导航栏-->
<div class="nav">
    <img class="navbgc" src="<%=basePath%>img/q&anav.jpg" alt="">
    <ul class="worldnav">
        <li class="worldnav">
            <a class="nava" href="http://localhost:8080/just/index">
                <img src="<%=basePath%>img/navhome.png" alt="" class="navimg navimg1">主页
            </a>
        </li>
        <li class="worldnav">
            <a class="nava" href="http://localhost:8080/just/MathWorld">
                <img src="<%=basePath%>img/navworld.png" alt="" class="navimg navimg2">大数世界
            </a>
        </li>
        <li class="worldnav">
            <a class="nava" href="http://localhost:8080/just/Q&A">
                <img src="<%=basePath%>img/navq&a.png" alt="" class="navimg navimg3">师生答疑
            </a>
        </li>
        <li class="worldnav">
            <a class="nava" href="http://localhost:8080/just/Rank">
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
            <%--<form action="<%=basePath%>saveshouyeContent1" method="post" id="saveTiezi">--%>
                <%--<label for="mainTitle">帖子标题</label>--%>
                <%--<input type="text" name="mainTitle" id="mainTitle" placeholder="最大长度80个汉字" style="width:360px;">--%>
                <%--<c:choose>--%>
                    <%--<c:when test="${sessionScope.loginFlag}">--%>
                        <%--<button type="button" class="btn btn-primary btn-xs text-right" onclick="subForm()" >发表帖子</button>--%>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                        <%--<button type="button" class="btn btn-primary btn-xs text-right" onclick="goLogin()">发表帖子</button>--%>
                    <%--</c:otherwise>--%>
                <%--</c:choose>--%>
                <%--<!-- 加载编辑器的容器 -->--%>
                <%--<div style="padding: 0px;margin: 0px;width: 100%;height: 100%;" >--%>
                    <%--<script id="container" name="content" type="text/plain">--%>

                    <%--</script>--%>
                <%--</div>--%>
            <%--</form>--%>

            <%--<!-- 配置文件 -->--%>
            <%--<script type="text/javascript" src="<%=basePath %>/js/uedit/js/ueditor.config.js"> </script>--%>
            <%--<!-- 编辑器源码文件 -->--%>
            <%--<script type="text/javascript" src="<%=basePath %>/js/uedit/js/ueditor.all.js"> </script>--%>
            <%--<!-- 实例化编辑器 -->--%>
            <%--<script type="text/javascript">--%>
                <%--var editor = UE.getEditor('container');--%>
                <%--var success = ${sessionScope.loginFlag};--%>
                <%--editor.addListener('ready',function (){--%>
                    <%--if(success){--%>
                        <%--console.log("OK");--%>
                        <%--return;--%>
                    <%--}else{--%>
                        <%--editor.setDisabled('fullscreen');--%>
                        <%--editor.setContent('<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=basePath%>login.jsp" target="_parent" onclick="goLogin()">请登录</a>');--%>
                    <%--}--%>
                <%--});--%>
                <%--function goLogin(){--%>
                    <%--if (confirm('发帖前请先登录,确定跳转登录页面')){--%>
                        <%--window.location.href="<%=basePath%>login.jsp";--%>
                    <%--}--%>
                <%--}--%>
                <%--function subForm (){--%>
                    <%--var content = editor.getContent();--%>
                    <%--var mainTitle = $("#mainTitle").val();--%>
                    <%--if (content === '' || mainTitle === ''){--%>
                        <%--alert ("请输入标题与内容");--%>
                    <%--}else{--%>
                        <%--$("#saveTiezi").submit();--%>
                    <%--}--%>
                <%--}--%>
            <%--</script>--%>
            <table class="qa-table">
                <c:forEach items="${tiezi}" var="tie"  >
                <tr class="qa-table">
                    <th class="qa-table">${tie.mainTitle}</th>
                    <%--<th class="qa-table">1283</th>--%>
                    <th class="qa-table"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="qa-table-user" ></th>
                    <th class="qa-table">${tie.mainCreatuser}</th>
                    <th class="qa-table"><fmt:formatDate value="${tie.mainCreatime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></th>
                </tr>
                </c:forEach>
            </table>
        </div>

    </div>

</div>
<form >
    <label >帖子标题</label>
    <input type="text" name="mainTitle" placeholder="最大长度80个汉字" style="width:360px;">
    <button type="submit" class="btn btn-primary btn-xs text-right">
        发表帖子
    </button>
    <div>
        <script id="container" name="content" type="text/plain">

        </script>
    </div>
</form>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=basePath%>/js/uedit/js/ueditor.config.js"> </script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=basePath%>/js/uedit/js/ueditor.all.js"> </script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var editor = UE.getEditor('container');
</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>/js/jquery-1.8.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath %>/js/bootstrap.min.js"></script>
</body>
</html>