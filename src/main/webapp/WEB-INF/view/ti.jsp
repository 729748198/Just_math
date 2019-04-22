<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/9
  Time: 10:25
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
    <title>难题突破</title>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css">
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>

<!--container-->
<div class="mymath-container">
    <!--background-->
    <img src="<%=basePath%>img/exe-bcg.png" class="worldbcg" alt="">
    <!--导航栏-->
    <ul class="mymathnav">
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/index">
                <img src="<%=basePath%>img/exe-home.png" alt="" class="navimg-mm navimg1-mm">主页
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="<%=path%>/just/zuoti">
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
                    <li><a href="<%=path%>/just/dotian" class="exe-chapter">Ⅱ 导数与微分</a></li>
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
        <!--题目-->
        <div class="exe-exe">
            <!--抬头-->
            <p class="exe-chapter">高等数学 > 函数与极限</p>
            <!--emmm，这里的示例表示难度系数两颗星（一颗星 to left, white 66%, skyblue 33%, blue；两颗星 to right, blue, skyblue 66%, white 33%；三颗星 to right, blue, skyblue），嗯就是这样-->
            <div class="exe-progressbar" style="background: linear-gradient(to right, blue, skyblue 66%, white 33%); ">
                <img src="<%=basePath%>img/exe-probar.png" alt="" class="exe-probar">
            </div>
            <!--答题-->
            <div class="exe-content">
                <div class="exercise-content" style="border:1px solid #274b8b ;
padding: 5px 5px 10px 5px;">
                   ${title}
                    <br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <label>
                        <input type="radio" name="choice" value="A"/>A.${choice.A}
                    </label>
                    <label>
                        <input type="radio" name="choice" value="B"/>B.${choice.B}
                    </label>
                    <label>
                        <input type="radio" name="choice" value="C"/>C.${choice.C}
                    </label>
                    <label>
                        <input type="radio" name="choice" value="D" />D.${choice.D}
                    </label>
                    <div id="demo">

                    </div>
                </div>
                <%--<input type="text" class="exe-answer">--%>
                <p> <a id="tijiao"  class="exe-button exe-submit">提交</a></p>
                <a id="nextTi" class="exe-button exe-next">下一题</a>

            </div>
            <script>
                var ban="第一章";
                $("#tijiao").click(function () {
                    var radioValue = $('input:radio[name="choice"]:checked').val();
                    var html="";
                    var anser="${answer}";
                    if(radioValue==anser){
                        html+="<p style='color: green'>答案正确</p>";
                    }else {

                        html+="<p style='color: red'>答案错误！</p>";
                        html+="<p>正确答案为${answer}</p>";
                    }
                    $("#demo").html(html);
                });
                $("#nextTi").click(function () {
                    $.ajax({
                        url: "<%=basePath%>/ti/getBanRandom?ban="+ban,
                        type:"get",
                        dataType:"json",
                        success:function (data) {
                            var html="";
                            console.log(data);
                            html=html+"<h1>题目</h1><img src='<%=basePath%>/upload/e14ebdabeec1446191a3559d24e85a87.png'/>"+
                                    "<p></p>"
                            $(".exercise-content").html(html);
                        }

                    })
                })
            </script>
        </div>
    </div>

</div>


</body>
</html>
