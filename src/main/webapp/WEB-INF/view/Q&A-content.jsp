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
    <div class="worldmain" style="background-color: white">
        <div class="qa-content question">
            <p class="qa-title">数学建模是什么?</p>
            <p class="qa-question">
                有什么用，需要用到什么知识，好学吗？<br>
                我是大一的学生，数学成绩并不好，能学吗？不知道对我有什么用<br>
                希望各位高手给出详细的说明，谢谢！！
            </p>
            <p class="create-inf">162210702115 2019年1月1日</p>
        </div>
        <div class="qa-content answer">
            <p class="qa-answer">
                数学建模就是根据实际问题来建立数学模型，对数学模型来进行求解，然后根据结果去解决实际问题。

                当需要从定量的角度分析和研究一个实际问题时，人们就要在深入调查研究、了解对象信息、作出简化假设、分析内在规律等工作的基础上，用数学的符号和语言作表述来建立数学模型。

                数学建模就是建立数学模型，建立数学模型的过程就是数学建模的过程。数学建模是一种数学的思考方法，是运用数学的语言和方法，通过抽象、简化建立能近似刻画并"解决"实际问题的一种强有力的数学手段。
            </p>
            <p class="create-inf">162210702115   2019年1月1日</p>
        </div>
        <div class="qa-content answer">
            <p class="qa-answer">
                数学建模的详细定义网上多的我就不阐述了，说一点其他的~~
                数学的主要发展方向是数学结合计算机。运用数学的算法结合计算机技术解决实际问题，将来你会比单纯学计算机的水平高出一个档次，因为你的算法比他们的先进。而这也就是数学建模竞赛的主要考察的。
                数模比赛的含金量也是比较高的，你参加比赛得了名次，完全可以证明你是有一定实力的~~
                你担心数学成绩不好，其实是没有必要的，我参加过几次比赛，用的数学知识并没有很高深，高中数学也能解决很多问题了，主要就是优化，模拟，我觉得考验个人思维能力多一点，况且数学、计算机、写作三个方面呢，你只要有一方面特长就可以了~~
            </p>
            <p class="create-inf">162210702115   2019年1月1日</p>
        </div>

    </div>


</div>


</body>
</html>
