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
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/assets/css/admin.css">
    <script src="<%=basePath%>/js/amazeui.min.js"></script>
    <style>
        a{
            text-decoration: none;
        }
    </style>
</head>
<body style="overflow: auto;">
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
            <a class="nava " href="<%=path%>/just/Rank">
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

        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">基本信息</a></li>
                <li><a href="#tab2">详细描述</a></li>
                <li><a href="#tab3">SEO 选项</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1" >

                    <table class="qa-table">
                           <tr class="qa-table">
                                            <%--帖子标题--%>
                                            <td class="qa-table qa-title">
                                                <nobr>
                                                    <text class="title">
                                                        <a href="<%=basePath%>/fatie/content" target="_blank" class="qa-title">${tie.forumMain.mainTitle}</a>
                                                    </text>
                                                    <text class="bubble">${tie.forumInfo.infoReply}</text>
                                                </nobr>
                                            </td>
                                    <%--照片--%>
                                <td class="qa-table qa-userimg"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="qa-table-user" ></td>
                                    <%--创建者--%>
                                <td class="qa-table qa-username">${tie.forumMain.mainCreatuser}</td>
                                    <%--创建时间--%>
                                <td class="qa-table qa-date"><fmt:formatDate value="${tie.forumMain.mainCreatime}" pattern="yyyy年MM月dd日" /></td>
                            </tr>


                    </table>
                    <script>
                        function gettie(){
                            $.ajax({
                            url:"<%=basePath%>/fatie/getall",
                                success:function(data){
                                    var jsObject = JSON.parse(data);
                                    console.log(jsObject);
                                    var html="";
                                }

                        })
                        };

                        $(document).ready(function () {
                            gettie();
                        })




                    </script>

                </div>

                <div class="am-tab-panel am-fade" id="tab2">
                    阿斯蒂芬阿斯顿发生的
                </div>

                <div class="am-tab-panel am-fade" id="tab3">
                    阿斯顿啊
                </div>

            </div>
        </div>

    </div>

</div>


</div>


</body>
</html>