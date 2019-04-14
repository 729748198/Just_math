<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/21
  Time: 18:49
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
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>精互同教学平台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <script src="<%=basePath%>/js/editor.js"></script>
    <%--<script src="<%=basePath%>/js/bootstrap-table.js"></script>--%>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
    <%--<link rel="stylesheet" href="<%=basePath%>/css/bootstrap-table.css">--%>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=basePath%>/css/AdminLTE.css">
    <link rel="stylesheet" href="<%=basePath%>/css/skin-blue.css">
    <%--<script type="text/javascript" src="<%=basePath%>/js/index.js" ></script>--%>
    <script type="text/javascript" src="<%=basePath%>/js/adminlte.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/font-awesome.css" >
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/ionicons.min.css" >


</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="adminLTE.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>精互同教学平台</b>后台</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <!-- Menu toggle button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 4 messages</li>
                            <li>
                                <!-- inner menu: contains the messages -->
                                <ul class="menu">
                                    <li><!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <!-- User Image -->
                                                <img src="<%=basePath%>/img/adminlte/user2-160x160.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <!-- Message title and timestamp -->
                                            <h4>
                                                Support Team
                                                <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                            </h4>
                                            <!-- The message -->
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                </ul>
                                <!-- /.menu -->
                            </li>
                            <li class="footer"><a href="#">See All Messages</a></li>
                        </ul>
                    </li>
                    <!-- /.messages-menu -->

                    <!-- Notifications Menu -->
                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <!-- Inner Menu: contains the notifications -->
                                <ul class="menu">
                                    <li><!-- start notification -->
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                        </a>
                                    </li>
                                    <!-- end notification -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>
                    <!-- Tasks Menu -->
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 9 tasks</li>
                            <li>
                                <!-- Inner menu: contains the tasks -->
                                <ul class="menu">
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <!-- Task title and progress text -->
                                            <h3>
                                                Design some buttons
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <!-- The progress bar -->
                                            <div class="progress xs">
                                                <!-- Change the css width attribute to simulate progress -->
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                                                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="<%=basePath%>/img/adminlte/user2-160x160.jpg" class="user-image" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">Alexander Pierce</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="<%=basePath%>/img/adminlte/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    Alexander Pierce - Web Developer
                                    <small>Member since Nov. 2012</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<%=basePath%>/img/adminlte/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Alexander Pierce</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <!-- search form (Optional) -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
                </div>
            </form>
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">HEADER</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="active"><a href="<%=path%>/just/teacher" target="_self"><i class="fa fa-link"></i> <span>上传填空题</span></a></li>
                <li><a href="<%=path%>/just/addChoice" target="_self"><i class="fa fa-link"></i> <span>上传选择题</span></a></li>
                <li><a href="<%=path%>/just/addchoice" target="_self"><i class="fa fa-link"></i> <span>上传选择题(不带公式)</span></a></li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <br>
        <p>增加一道选择题</p>
        <label for="ban">所属板块</label><input name="ban" id="ban" type="text" ><br>
        <label for="score">分数</label><input name="score" id="score" type="text" ><br>
        <label for="title">标题</label><input name="title" id="title" type="text" maxlength="1000"> <button id="q">确定</button><br>
        <div id="editorContainer"></div>
        <p id="Ca">选项A </p><button id="Ba">确定</button>
        <div id="editorContainer1"></div>
        <p id="Cb">选项B</p><button id="Bb">确定</button>
        <div id="editorContainer2"></div>
        <p id="Cc">选项C</p><button id="Bc">确定</button>
        <div id="editorContainer3"></div>
        <p id="Cd">选项D</p><button id="Bd">确定</button>
        <div id="editorContainer4"></div>
        <label for="answer">答案</label><input name="answer" id="answer" type="text"><br><br>
        <p id="jiexi">添加解析</p><button id="Bjiexi">确定</button>
        <div id="editorContainer5"></div>
        <button id="tijiao">提交</button>

        <script>
            var editor;
            var editor1;
            var editor2;
            var editor3;
            var editor4;
            var editor5;
            window.onload = function () {
                editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
                editor.insertInto(document.getElementById('editorContainer'));
                editor1 = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
                editor1.insertInto(document.getElementById('editorContainer1'));
                editor2 = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
                editor2.insertInto(document.getElementById('editorContainer2'));
                editor3 = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
                editor3.insertInto(document.getElementById('editorContainer3'));
                editor4 = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
                editor4.insertInto(document.getElementById('editorContainer4'));
                editor5 = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
                editor5.insertInto(document.getElementById('editorContainer5'));
            };
            $("#editorContainer").hide();
            $("#editorContainer1").hide();
            $("#editorContainer2").hide();
            $("#editorContainer3").hide();
            $("#editorContainer4").hide();
            $("#editorContainer5").hide();
        </script>



    </div>
    <script>
        $(document).ready(function () {

            $("#Ca").click(function () {
                $("#editorContainer1").show();
            });
            $("#Ba").click(function () {
                $("#editorContainer1").hide();
            });
            $("#Cb").click(function () {
                $("#editorContainer2").show();
            });
            $("#Bb").click(function () {
                $("#editorContainer2").hide();
            });
            $("#Cc").click(function () {
                $("#editorContainer3").show();
            });
            $("#Bc").click(function () {
                $("#editorContainer3").hide();
            });
            $("#Cd").click(function () {
                $("#editorContainer4").show();
            });
            $("#Bd").click(function () {
                $("#editorContainer4").hide();
            });
            $("#title").click(function () {
                $("#editorContainer").show();
            });
            $("#q").click(function () {
                $("#editorContainer").hide();
            });
            $("#jiexi").click(function () {
                $("#editorContainer5").show();
            });
            $("#Bjiexi").click(function () {
                $("#editorContainer5").hide();
            });
            $("#tijiao").click(function () {
                var title = $("div#editorContainer .wrs_container").html();
                var Aa=$("div#editorContainer1 .wrs_container").html();
                var Ab=$("div#editorContainer2 .wrs_container").html();
               var Ac =$("div#editorContainer3 .wrs_container").html();
                var Ad= $("div#editorContainer4 .wrs_container").html();
                var jiexi= $("div#editorContainer5 .wrs_container").html();
                var ban = $("#ban").val();
                var score = $("#score").val();
                var answer=$("#answer").val();
                console.log("题目"+title);
                console.log("a"+Aa);
                console.log("b"+Ab);
                console.log("c"+Ac);
                console.log("d"+Ad);
                console.log("jiexi"+jiexi);
                console.log("ban"+ban);
                console.log("score"+score);
                console.log("answer"+answer);

                $.ajax({
                    type: "POST",
                    url: "<%=basePath%>ti/doChoice",
                    data: {
                        "Ban":ban,
                        "Title":title,
                        "Score":score,
                        "Answer":answer,
                        "Aa":Aa,
                        "Ab":Ab,
                        "Ac":Ac,
                        "Ad":Ad,
                        "Jiexi":jiexi,
                        "type":5
                    },
                    // dataType: "json",
                    success: function (data) {
                        alert("成功插入");
                        window.location.reload();
                    },
                    error:function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("请求失败");
                        console.log(errorThrown);
                        console.log(textStatus);
                        console.log(XMLHttpRequest);
                    }
                })
            })
        })
    </script>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
    </footer>
</div>
</body>
</html>
