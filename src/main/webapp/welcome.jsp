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
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath%>js/follow.js" type="text/javascript"></script>
    <style>
        *, *:before, *:after {
            box-sizing: border-box;
        }

        html {
            font-size: 18px;
            line-height: 1.5;
            font-weight: 300;
            color: #333;
            font-family: "Nunito Sans", sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-attachment: fixed;
        }

        .content {
            display: flex;
            margin: 0 auto;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            max-width: 1000px;
        }

        .heading {
            width: 100%;
            margin-left: 1rem;
            font-weight: 900;
            font-size: 1.618rem;
            text-transform: uppercase;
            letter-spacing: .1ch;
            line-height: 1;
            padding-bottom: .5em;
            margin-bottom: 1rem;
            position: relative;
        }
        .heading:after {
            display: block;
            content: '';
            position: absolute;
            width: 60px;
            height: 4px;
            background: linear-gradient(135deg, #1a9be6, #1a57e6);
            bottom: 0;
        }

        .description {
            width: 100%;
            margin-top: 0;
            margin-left: 1rem;
            margin-bottom: 3rem;
        }

        .card {
            color: inherit;
            cursor: pointer;
            width: calc(33% - 2rem);
            min-width: calc(33% - 2rem);
            height: 400px;
            min-height: 400px;
            perspective: 1000px;
            margin: 1rem;
            position: relative;

        }
        @media screen and (max-width: 800px) {
            .card {
                width: calc(50% - 2rem);
            }
        }
        @media screen and (max-width: 500px) {
            .card {
                width: 100%;
            }
        }

        .front,
        .back {
            display: flex;
            border-radius: 6px;
            background-position: center;
            background-size: cover;
            text-align: center;
            justify-content: center;
            align-items: center;
            position: absolute;
            height: 100%;
            width: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            transform-style: preserve-3d;
            transition: ease-in-out 600ms;
        }

        .front {
            background-size: cover;
            padding: 2rem;
            font-size: 1.618rem;
            font-weight: 600;
            color: #fff;
            overflow: hidden;
            font-family: Poppins, sans-serif;
        }
        .front:before {
            position: absolute;
            display: block;
            content: '';
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, #1a9be6, #1a57e6);
            opacity: .25;
            z-index: -1;
        }
        .card:hover .front {
            transform: rotateY(180deg);
        }
        .card:nth-child(even):hover .front {
            transform: rotateY(-180deg);
        }

        .back {
            background: #fff;
            transform: rotateY(-180deg);
            padding: 0 2em;
        }
        .card:hover .back {
            transform: rotateY(0deg);
        }
        .card:nth-child(even) .back {
            transform: rotateY(180deg);
        }
        .card:nth-child(even):hover .back {
            transform: rotateY(0deg);
        }

        .button {
            transform: translateZ(40px);
            cursor: pointer;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            font-weight: bold;
            color: #fff;
            padding: .5em 1em;
            border-radius: 100px;
            font: inherit;
            background: linear-gradient(135deg, #1a9be6, #1a57e6);
            border: none;
            position: relative;
            transform-style: preserve-3d;
            transition: 300ms ease;
        }
        .button:before {
            transition: 300ms ease;
            position: absolute;
            display: block;
            content: '';
            transform: translateZ(-40px);
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            height: calc(100% - 20px);
            width: calc(100% - 20px);
            border-radius: 100px;
            left: 10px;
            top: 16px;
            box-shadow: 0 0 10px 10px rgba(26, 87, 230, 0.25);
            background-color: rgba(26, 87, 230, 0.25);
        }
        .button:hover {
            transform: translateZ(55px);
        }
        .button:hover:before {
            transform: translateZ(-55px);
        }
        .button:active {
            transform: translateZ(20px);
        }
        .button:active:before {
            transform: translateZ(-20px);
            top: 12px;
        }
    </style>

</head>
<body>

<!--导航栏-->
<div class="nav">
    <img class="navbgc" src="<%=basePath%>/img/welcomenav.jpg" alt="">
</div>
<!--登录窗口-->
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css">
<a href="#" id="example" style="z-index: 9999; top:12px; right: 36px;">登 录 窗 口</a>
<div id="LoginBox">
    <div class="row1">
        登  录  窗  口<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
    </div>
    <div class="row">
        用户名: <span class="inputBox">
                <input type="text" id="txtName" placeholder="账号/邮箱">
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
    </div>
    <div class="row">
        密&nbsp;&nbsp;&nbsp;&nbsp;码: <span class="inputBox">
                <input type="text" id="txtPwd" placeholder="密码">
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
    </div>
    <div class="row">
        <a href="#" id="loginbtn">登录</a>
    </div>
</div>
<script type="text/javascript">
    $(function ($) {
        //弹出登录
        $("#example").hover(function () {
            $(this).stop().animate({
                opacity: '1'
            }, 600);
        }, function () {
            $(this).stop().animate({
                opacity: '0.6'
            }, 1000);
        }).on('click', function () {
            $("body").append("<div id='mask'></div>");
            $("#mask").addClass("mask").fadeIn("slow");
            $("#LoginBox").fadeIn("slow");
        });
        //
        //按钮的透明度
        $("#loginbtn").hover(function () {
            $(this).stop().animate({
                opacity: '1'
            }, 600);
        }, function () {
            $(this).stop().animate({
                opacity: '0.8'
            }, 1000);
        });
        //文本框不允许为空---按钮触发
        $("#loginbtn").on('click', function () {
            var txtName = $("#txtName").val();
            var txtPwd = $("#txtPwd").val();
            if (txtName == "" || txtName == undefined || txtName == null) {
                if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
                    $(".warning").css({ display: 'block' });
                }
                else {
                    $("#warn").css({ display: 'block' });
                    $("#warn2").css({ display: 'none' });
                }
            }
            else {
                if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {

                    $("#warn").css({ display: 'none' });
                    $(".warn2").css({ display: 'block' });
                }
                else {

                    $.ajax({
                        url: "<%=path%>/user/getUser/"+txtName,
                        type: "GET",           //请求方式
                        async: false,          //异步还是同步
                        cache: false,          //是否有缓存
                        success: function (data) {
                            var jsObject = JSON.parse(data);
                            var word=jsObject.password;
                            if(word==txtPwd){
                                window.location="<%=path%>/user/dologin?username="+txtName;


                            }else
                            {
                                alert("用户名和密码错误");
                            }
                        }
                    });
                    $(".warning").css({ display: 'none' });
                }
            }
        });
        //文本框不允许为空---单个文本触发
        $("#txtName").on('blur', function () {
            var txtName = $("#txtName").val();
            if (txtName == "" || txtName == undefined || txtName == null) {
                $("#warn").css({ display: 'block' });
            }
            else {
                $("#warn").css({ display: 'none' });
            }
        });
        $("#txtName").on('focus', function () {
            $("#warn").css({ display: 'none' });
        });
        //
        $("#txtPwd").on('blur', function () {
            var txtName = $("#txtPwd").val();
            if (txtName == "" || txtName == undefined || txtName == null) {
                $("#warn2").css({ display: 'block' });
            }
            else {
                $("#warn2").css({ display: 'none' });
            }
        });
        $("#txtPwd").on('focus', function () {
            $("#warn2").css({ display: 'none' });
        });
        //关闭
        $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
            $("#LoginBox").fadeOut("fast");
            $("#mask").css({ display: 'none' });
        });
    });
</script>
<div style="text-align:center;clear:both;margin-top:0">


</div>
<!--登录窗口-->

<!--container-->
<div class="container">
    <!--background-->
    <img src="<%=basePath%>/img/welcomebgc.jpg" class="welbcg" alt="">
    <!--主体部分-->
    <div class="welmain">
        <!--平台介绍-->
        <%--<a href="<%=path%>/just/Login" id="example">登 录 </a>--%>
        <div class="wel-intro">
            <img src="<%=basePath%>/img/wel-img-1.jpg" alt="" class="wel-img">
            <div class="wel-intro-text">
                <text style="font-size: 25px;font-weight: bold">“精互同”大学数学游戏式教学平台</text>是一款用于八九点克服了；几点上课；里番的数据来看房价多少短时间分；几点上课；安静了开放的；就啊；六点十分骄傲舒服的； 马上；eiffel单身快乐；分九分裤；是
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