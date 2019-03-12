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
    <title>“精·互·同”游戏式教学平台</title>
    <link rel="stylesheet" href="<%=basePath%>/css/main.css" type="text/css">
</head>
<body>
<!--导航栏-->
<div class="nav">
    <img class="navbgc" src="<%=basePath%>/img/welcomenav.jpg" alt="">
</div>

<!--container-->
<div class="container">
    <!--background-->
    <img src="<%=basePath%>/img/welcomebgc.jpg" class="welbcg" alt="">
    <!--主体部分-->
    <div class="welmain">
        <!--平台介绍-->
        <div class="wel-intro">
            <img src="<%=basePath%>/img/wel-img-1.jpg" alt="" class="wel-img">
            <div class="wel-intro-text">
                <text style="font-size: 25px;font-weight: bold">“精互同”大学数学游戏式教学平台</text>是一款用于八九点克服了多少开了房；几点上课；里番的数据来看房价多少短时间分；几点上课；安静了开放的；就啊；六点十分骄傲舒服的； 马上；eiffel单身快乐；分九分裤；是
            </div>
        </div>
        <!--叶老师介绍-->
        <div class="wel-teacher">
            <text class="teacher-1">关于叶慧老师</text>
            <img src="<%=basePath%>/img/worlduser.jpg" alt="" class="wel-teacher">
            <text class="teacher-2">叶慧 <br> <text style="font-size:15px;font-weight: normal">理学院副教授</text></text>
            <text class="teacher-3">注重教学创新，很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很 <br>漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮很漂亮 </text>
        </div>
        <!--图片轮播-->
        <div id="container">
            <ul class="pic">
                <li><a href="javascript:;"><img src="<%=basePath%>/img/jing.jpg" alt="pic1"></a></li>
                <li><a href="javascript:;"><img src="<%=basePath%>/img/hu.jpg" alt="pic2"></a></li>
                <li><a href="javascript:;"><img src="<%=basePath%>/img/tong.jpg" alt="pic3"></a></li>

            </ul>
        </div>
        <!--微信二维码-->
        <div class="wel-link">
            <text class="wel-link">
                扫描二维码 <br>
                下载 <b>小程序</b>
            </text>
            <img src="<%=basePath%>/img/2-code.png" alt="" class="wel-link">
        </div>



    </div>
</div>
</body>
</html>