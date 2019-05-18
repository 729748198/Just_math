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
        #container{
            position: absolute;
            width:100%;
            height:100%;
            overflow: hidden;
            top:0;
            left:0;
            z-index: 999;
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
<div class="container" >
    <!--background-->
    <img src="<%=basePath%>img/q&abgc.jpg" class="worldbcg" alt="">
    <!--主体部分-->
    <div class="worldmain" style="background-color: white">
        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs" style="color: white">
                <li class="am-active"><a href="#tab1">看帖子</a></li>
                <li><a href="#tab2">发帖子</a></li>
                <li><a href="#tab3">@我的</a></li>
            </ul>

            <div class="am-tabs-bd ">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="height: 650px;overflow:auto; " >
                    <table class="qa-table">
                           <tr class="qa-table">
                                <%--帖子标题--%>
                                <td class="qa-table qa-title">
                                    <nobr>
                                        <text class="title">
                                            <a href="<%=basePath%>/fatie/content" target="_blank" class="qa-title">帖子标题</a>
                                        </text>
                                        <text class="bubble">12</text>
                                    </nobr>
                                </td>
                                    <%--照片--%>
                                <td class="qa-table qa-userimg"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="qa-table-user" ></td>
                                    <%--创建者--%>
                                <td class="qa-table qa-username">创建者</td>
                                    <%--创建时间--%>
                                <td class="qa-table qa-date">创建时间</td>
                            </tr>
                       <%--<c:forEach items="${tiezi}" var="tie"  >--%>
                           <%--<tr class="qa-table">--%>
                                   <%--&lt;%&ndash;帖子标题&ndash;%&gt;--%>
                               <%--<td class="qa-table qa-title">--%>
                                   <%--<nobr>--%>
                                       <%--<text class="title">--%>
                                           <%--<a href="<%=basePath %>/fatie/content" class="qa-title" target="_blank">${tie.forumMain.mainTitle}</a>--%>
                                       <%--</text>--%>
                                       <%--<text class="bubble">${tie.forumInfo.infoReply}</text>--%>
                                   <%--</nobr>--%>
                               <%--</td>--%>
                                   <%--&lt;%&ndash;照片&ndash;%&gt;--%>
                               <%--<td class="qa-table qa-userimg"><img src="<%=basePath%>img/worlduser.jpg" alt="" class="qa-table-user" ></td>--%>
                                   <%--&lt;%&ndash;创建者&ndash;%&gt;--%>
                               <%--<td class="qa-table qa-username">${tie.forumMain.mainCreatuser}</td>--%>
                                   <%--&lt;%&ndash;创建时间&ndash;%&gt;--%>
                               <%--<td class="qa-table qa-date"><fmt:formatDate value="${tie.forumMain.mainCreatime}" pattern="yyyy年MM月dd日" /></td>--%>
                           <%--</tr>--%>
                       <%--</c:forEach>--%>
                    </table>
                </div>

                <div class="am-tab-panel am-fade" id="tab2">
                    <form action="<%=basePath%>fatie/dofatie" method="post" id="saveTiezi">
                        <label for="mainTitle">帖子标题</label>
                        <input type="text" name="mainTitle" id="mainTitle" placeholder="最大长度25个汉字" style="width:360px;">
                        <button type="button" class="btn btn-primary btn-xs text-right" onclick="subForm()">发表帖子</button>

                        <!-- 加载编辑器的容器 -->
                        <div style="display: inline-block;position:relative;padding: 0px;margin: 0px;width: 100%;height: 100%;top:36px;left:0;" >
                            <script id="container" name="content" type="text/plain" >
                            </script>
                        </div>
                    </form>
                    <!-- 配置文件 -->
                    <script type="text/javascript" src="<%=basePath %>js/uedit/js/ueditor.config.js"> </script>
                    <!-- 编辑器源码文件 -->
                    <script type="text/javascript" src="<%=basePath %>js/uedit/js/ueditor.all.js"> </script>
                    <!-- 实例化编辑器 -->
                    <script type="text/javascript">
                        var editor = UE.getEditor('container');
                        function subForm (){
                            var content = editor.getContent();
                            var mainTitle = $("#mainTitle").val();
                            if (content === '' || mainTitle === ''){
                                alert ("请输入标题与内容");
                            }else{
                                $("#saveTiezi").submit();
                            }
                        }
                    </script>
                </div>

                <div class="am-tab-panel am-fade" id="tab3">
                    <table class="qa-table">
                        <c:forEach items="${tiezi}" var="tie"  >
                            <tr class="qa-table">
                                    <%--帖子标题--%>
                                <td class="qa-table qa-title">
                                    <nobr>
                                        <text class="title">
                                            <a href="" class="qa-title">${tie.forumMain.mainTitle}</a>
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
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>

    </div>

</div>

<script>
    function gettie(){
        $.ajax({
            url:"<%=basePath%>/fatie/getall",
            success:function(data){
                var jsObject = JSON.parse(data);
                console.log(jsObject);
                console.log(jsObject[0].forumInfo.infoId);
                var html="<table class=\"qa-table\">\n";
                for(var i=0;i<jsObject.length;i++){
                html+="                           <tr class=\"qa-table\">\n" +
                    "                                <%--帖子标题--%>\n" +
                    "                                <td class=\"qa-table qa-title\">\n" +
                    "                                    <nobr>\n" +
                    "                                        <text class=\"title\">\n" +
                    "                                            <a href=\"<%=basePath%>/fatie/content\" target=\"_blank\" class=\"qa-title\">"+
                    jsObject[i].forumMain.mainTitle+
                    "</a>\n" +
                    "                                        </text>\n" +
                    "                                        <text class=\"bubble\">"+
                    jsObject[i].forumInfo.infoId+
                    "</text>\n" +
                    "                                    </nobr>\n" +
                    "                                </td>\n" +
                    "                                    <%--照片--%>\n" +
                    "                                <td class=\"qa-table qa-userimg\"><img src=\"<%=basePath%>img/worlduser.jpg\" alt=\"\" class=\"qa-table-user\" ></td>\n" +
                    "                                    <%--创建者--%>\n" +
                    "                                <td class=\"qa-table qa-username\">"+
                    jsObject[i].forumMain.mainCreatuser+
                    "</td>\n" +
                    "                                    <%--创建时间--%>\n" +
                    "                                <td class=\"qa-table qa-date\">"+
                    jsObject[i].forumMain.mainCreatime+
                    "</td>\n" +
                    "                            </tr>\n" ;
                }
                html+="                    </table>";
                $("#tab1").html(html);
                $("#tab3").html(html);
            }

        })
    }

    $(document).ready(function () {
        gettie();
    })
</script>

</body>
</html>