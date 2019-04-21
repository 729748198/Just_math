<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15
  Time: 21:25
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
    <title>资料解析</title>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css">
</head>
<body>

<div class="mymath-container">
    <!--background-->
    <img src="<%=basePath%>img/database-bcg.png" class="worldbcg" alt="">
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
            <a class="nava" href="<%=path%>/just/ziliao">
                <img src="<%=basePath%>img/exe-db.png" alt="" class="navimg-mm navimg3-mm">资料解析
            </a>
        </li>
    </ul>
    <!--主体部分-->
    <div class="mymathmain" style="top:10px;height: 710px;">
        <!--章节-->
        <div class="exe-menu">
            目录<br>
            <div class="exe-chapter">
                <ul class="exe-chapter">
                    <li><a href="" class="exe-chapter">Ⅰ 函数与极限</a></li>
                    <li><a href="" class="exe-chapter">Ⅱ 导数与微分</a></li>
                    <li><a href="" class="exe-chapter">Ⅲ 微分中值定理与导数的应用</a></li>
                    <li><a href="" class="exe-chapter">Ⅳ 不定积分</a></li>
                    <li><a href="" class="exe-chapter">Ⅴ 定积分</a></li>
                    <li><a href="" class="exe-chapter">Ⅵ 定积分的应用</a></li>
                    <li><a href="" class="exe-chapter">Ⅶ 微分方程</a></li>
                    <li><a href="" class="exe-chapter">Ⅷ 空间解析几何与向量代数</a></li>
                    <li><a href="" class="exe-chapter">Ⅸ 多元函数微分法及其应用</a></li>
                    <li><a href="" class="exe-chapter">Ⅹ 重积分</a></li>
                    <li><a href="" class="exe-chapter">Ⅺ 曲线积分与曲面积分</a></li>
                    <li><a href="" class="exe-chapter">Ⅻ 无穷级数</a></li>
                    <li><a href="" class="exe-chapter">ⅩⅢ 线性代数</a></li>
                    <li><a href="" class="exe-chapter">ⅩⅣ 概率论与数理统计</a></li>
                </ul>
            </div>
        </div>
        <!--资料-->
        <div class="exe-exe">
            <!--抬头-->
            <p class="exe-chapter">高等数学 > 函数与极限</p>
            <!--内容-->
            <div class="exe-content">
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-knowledge">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/knowledge.png" alt="" class="db-content">
                    <p class="db-content">基础知识</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-expand">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/expand-knowledge.png" alt="" class="db-content" style="top: 45px;left:38px;">
                    <p class="db-content">拓展知识</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-history">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/histroy-exe.png" alt="" class="db-content" style="top: 45px;left:35px;">
                    <p class="db-content">往届练习题</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-videos">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/videos.png" alt="" class="db-content" style="top: 35px;left:32px;">
                    <p class="db-content">视频微课</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-bcg">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/bcg-database.png" alt="" class="db-content" style="top: 25px;left:38px;">
                    <p class="db-content">背景资料库</p>
                </a>
                <a href="<%=basePath%>/learn/ziliao" class="db-button db-kaoyan">
                    <img src="<%=basePath%>img/tubiao.png" alt="" class="db-tubiao">
                    <img src="<%=basePath%>img/kaoyan.png" alt="" class="db-content" style="top: 30px;left:25px;">
                    <p class="db-content">考研真题</p>
                </a>
            </div>
        </div>
    </div>

</div>



</body>
</html>
