<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/17
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- 判断el集合是否为空的声明 -->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大同社区</title>
    <jsp:include page="admin/commonfile.jsp"/>
    <script src="${ctx}/js/sockjs.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css">
</head>
<body>

<!--container-->
<div class="mymath-container">
    <!--background-->
    <img src="<%=basePath%>img/com-bcg.jpg" class="worldbcg" alt="" >
    <!--导航栏-->
    <ul class="mymathnav">
        <li class="mymathnav">
            <a class="nava" href="#">
                <img src="<%=basePath%>img/navhome1.png" alt="" class="navimg-mm navimg1-mm">主页
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="#">
                <img src="<%=basePath%>img/navmymath.png" alt="" class="navimg-mm navimg2-mm">我的大数
            </a>
        </li>
        <li class="mymathnav">
            <a class="nava" href="#">
                <img src="<%=basePath%>img/navcommunity.png" alt="" class="navimg-mm navimg3-mm">大同社区
            </a>
        </li>
    </ul>
    <!--主体部分-->
    <div class="mymathmain" style="width: 825px;top:5px;left: 235px;">
        <!--个人头像-->
        <div class="user-mm">
            <img src="<%=basePath%>img/worlduser.jpg" alt="" class="user-mm">
            <a href="" class="user-mm-name">${user}</a>
        </div>
        <!--聊天群组-->
        <div class="com-group">
            <p class="com-group">在线列表</p>
            <br>
            <div class="am-panel-hd">
                <h3 class="am-panel-title">在线列表 [<span id="onlinenum"></span>]</h3>
            </div>
            <ul class="am-list am-list-static am-list-striped" >
                <li>图灵机器人 <button class="am-btn am-btn-xs am-btn-danger" id="tuling" data-am-button>未上线</button></li>
            </ul>
            <ul class="am-list am-list-static am-list-striped" id="list">
            </ul>
        </div>
        <!--聊天内容-->
        <div class="chatting">
            <p class="chatting">高数乐园</p>
            <div class="chatting-room">
                <div class="am-scrollable-vertical" id="chat-view" style="height: 510px;">
                    <ul class="am-comments-list am-comments-list-flip" id="chat">
                    </ul>

                </div>
                <%--<ul class="chatting-content">--%>
                    <%--<li class="chatting-content others">--%>
                        <%--<p class="chatting-user">路人002</p>--%>
                        <%--<img src="<%=basePath%>img/头像1.png" alt="" class="chatting-user">--%>
                        <%--<p class="chatting-content">蟹老板威武！</p>--%>
                    <%--</li>--%>
                    <%--<li class="chatting-content mine">--%>
                        <%--<p class="chatting-user">蟹老板XDH</p>--%>
                        <%--<img src="<%=basePath%>img/worlduser.jpg" alt="" class="chatting-user">--%>
                        <%--<p class="chatting-content">客气客气！</p>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <textarea class="chat-reply" id="message" name="message" rows="5"  placeholder="这里输入你想发送的信息..."></textarea>
                <button class="am-btn am-btn-default" type="button" onclick="getConnection()"><span class="am-icon-plug"></span> 连接</button>
                <button class="am-btn am-btn-default" type="button" onclick="closeConnection()"><span class="am-icon-remove"></span> 断开</button>
                <button class="am-btn am-btn-default" type="button" onclick="checkConnection()"><span class="am-icon-bug"></span> 检查</button>
                <button class="am-btn am-btn-default" type="button" onclick="clearConsole()"><span class="am-icon-trash-o"></span> 清屏</button>
                <button class="am-btn am-btn-default" type="button" onclick="sendMessage()"><span class="am-icon-commenting"></span> 发送</button>
            </div>

        </div>
    </div>
</div>
<script>
    if("${message}"){
        layer.msg('${message}', {
            offset: 0
        });
    }
    if("${error}"){
        layer.msg('${error}', {
            offset: 0,
            shift: 6
        });
    }
    $("#tuling").click(function(){
        var onlinenum=$("#onlinenum").text();
        if($(this).text()=="未上线"){
            $(this).text("已上线").removeClass("am-btn-danger").addClass("am-btn-success");
            showNotice("图灵机器人加入，你可以与其交流");
            $('#onlinenum').text(parseInt(onlinenum)+1);
        }
        else
        {
            $(this).text("未上线").removeClass("am-btn-success").addClass("am-btn-danger");
            showNotice("图灵机器人加入，你可以与其交流");
            $('#onlinenum').text(parseInt(onlinenum)-1);
        }
    });

    var wsServer = null;
    var ws = null;
    wsServer = "ws://" + location.host+"${pageContext.request.contextPath}" + "/chatServer";	//WebServer的路径
    ws = new WebSocket(wsServer); //创建WebSocket对象
    ws.onopen = function (evt) {  //打开时候进行额回掉函数
        layer.msg("已经建立连接", { offset: 0}); //提示已经建立
    };
    ws.onmessage = function (evt) { //用于显示后台传递的数据
        analysisMessage(evt.data);  //解析后台传回的消息,并予以展示
    };
    ws.onerror = function (evt) {  //错误提示
        layer.msg("产生异常", { offset: 0});
    };
    ws.onclose = function (evt) {//关闭提示
        layer.msg("已经关闭连接", { offset: 0});
    };
    /**
     * 连接按钮，进行连接
     */
    function getConnection(){
        if(ws == null){
            ws = new WebSocket(wsServer); //创建WebSocket对象
            ws.onopen = function (evt) {
                layer.msg("成功建立连接!", { offset: 0});
            };
            ws.onmessage = function (evt) {
                analysisMessage(evt.data);  //解析后台传回的消息,并予以展示
            };
            ws.onerror = function (evt) {
                layer.msg("产生异常", { offset: 0});
            };
            ws.onclose = function (evt) {
                layer.msg("已经关闭连接", { offset: 0});
            };
        }else{
            layer.msg("连接已存在!", { offset: 0, shift: 6 });
        }
    }
    /**
     * 关闭连接
     */
    function closeConnection(){
        if(ws != null){
            ws.close();
            ws = null;
            $("#list").html("");    //清空在线列表
            layer.msg("已经关闭连接", { offset: 0});
        }else{
            layer.msg("未开启连接", { offset: 0, shift: 6 });
        }
    }
    /**
     * 检查连接
     */
    function checkConnection(){
        if(ws!=null){
            layer.msg(ws.readyState==0?"连接异常":"连接正常",{offset:0});
        }else{
            layer.msg("连接未开启!",{offset:0,shift:6});
        }
    }

    /**
     * 发送信息给后台
     */
    function sendMessage(){
        if(ws==null){
            layer.msg("连接未开启!",{offset:0,shift:6});
            return null;
        }
        var message=$("#message").val();//获取发送的信息
        var to=$("#sendto").text()=="全体成员"?"":$("#sendto").text();//获取要发送给的人，如果为全体成员则to设置为空
        if(message==null|message==""){
            layer.msg("请输入内容！",{offset:0,shift:6});
        }
        $("#tuling").text()=="已上线"?tuling(message):console.log("图灵机器人未开启");//图灵机器人
        ws.send(JSON.stringify({  //发送信息给后台，发送的格式为JSON:{ message:{cotent:message,from:"user",to:to,time:Daee()},type:"message" }
            message:{content:message,
                from:'${user}',
                to:to,
                time:getDateFull()
            },
            type:"message"
        }));
    }
    /**
     * 解析后台传来的消息
     * "massage" : {
     *              "from" : "xxx",
     *              "to" : "xxx",
     *              "content" : "xxx",
     *              "time" : "xxxx.xx.xx"
     *          },
     * "type" : {notice|message},
     * "list" : {[xx],[xx],[xx]}
     */
    function analysisMessage(message){
        message=JSON.parse(message);//将后台发来的数据解析出JSON数据
        console.log(message);
        if(message.type=="message"){	//如果格式为message则展示数据到
            showChat(message.message);
        }
        if(message.type=="notice"){	//如果为notice则广播
            showNotice(message.message);
        }
        if(message.list != null && message.list != undefined){     //如果列表部位空，显示好友在线列表
            showOnline(message.list);
        }
    }
    function showChat(message){
        var to = message.to == null || message.to == ""? "全体成员" : message.to;   //获取接收人
        var from;
        var fromtitle;
        var isSef = '${user}' == message.from ? "am-comment-flip" : "";   //如果是自己则显示在右边,他人信息显示在左边
        var isSefhead='${user}'==message.from? "information":"otherinfo";
        if(message.to=='${user}'){
            to="你";
        }
        if(message.from=='${user}')
        {
            messagetitle="你";
        }
        else
        {
            messagetitle=message.from;
        }


        var html = "<li class=\"am-comment "+isSef+" am-comment-primary\"><a href=\"${ctx}/"+isSefhead+"/"+message.from+"\"><img width=\"48\" height=\"48\" class=\"am-comment-avatar\" alt=\"\" src=\"<%=basePath%>img/worlduser.jpg\"></a><div class=\"am-comment-main\">\n" +
            "<header class=\"am-comment-hd\"><div class=\"am-comment-meta\">   <a class=\"am-comment-author\" href=\"#link-to-user\">"+messagetitle+"</a> 在<time> "+message.time+"</time> 发送给 "+to+" </div></header><div class=\"am-comment-bd\"> <p>"+message.content+"</p></div></div></li>";
        $("#chat").append(html);
        $("#message").val("");  //清空输入区
        var chat = $("#chat-view");
        chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
    }
    function showNotice(notice){
        $("#chat").append("<div><p class=\"am-text-success\" style=\"text-align:center\"><span class=\"am-icon-bell\"></span> "+notice+"</p></div>");
        var chat = $("#chat-view");
        chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
    }
    function showOnline(list){
        $("#list").html("");    //清空在线列表
        console.log(list.length);
        $.each(list, function(index, item){     //添加私聊按钮
            var li = "<li>"+item+"[自己]</li>";
            if('${user}' != item){    //排除自己
                li = "<li>"+item+" <button type=\"button\" class=\"am-btn am-btn-xs am-btn-primary am-round\" onclick=\"addChat('"+item+"');\"><span class=\"am-icon-phone\"><span> 私聊</button><button type=\"button\" class=\"am-btn am-btn-xs am-btn-primary am-round\" onclick=\"checkinfo('"+item+"');\"><span class=\"am-icon-phone\"><span> 查看资料</button></li>";
            }
            $("#list").append(li);
        });
        $("#onlinenum").text($("#list li").length);     //获取在线人数
    }
    function addChat(user){
        var sendto=$("#sendto");
        var receive=sendto.text()=="全体成员"?"":sendto.text()=",";
        if(receive.indexOf(user)==-1){
            sendto.text(receive+user);
        }
    }
    function tuling(message){
        var html;
        $.getJSON("http://www.tuling123.com/openapi/api?key=6ad8b4d96861f17d68270216c880d5e3&info=" + message,function(data){
            if(data.code == 100000){
                html = "<li class=\"am-comment am-comment-primary\"><a href=\"#link-to-user-home\"><img width=\"48\" height=\"48\" class=\"am-comment-avatar\" alt=\"\" src=\"<%=basePath%>img/worlduser.jpg\"></a><div class=\"am-comment-main\">\n" +
                    "<header class=\"am-comment-hd\"><div class=\"am-comment-meta\">   <a class=\"am-comment-author\" href=\"#link-to-user\">Robot</a> 发表于<time> "+getDateFull()+"</time> 发送给: ${user}</div></header><div class=\"am-comment-bd\"> <p>"+data.text+"</p></div></div></li>";
            }
            if(data.code == 200000){
                html = "<li class=\"am-comment am-comment-primary\"><a href=\"#link-to-user-home\"><img width=\"48\" height=\"48\" class=\"am-comment-avatar\" alt=\"\" src=\"<%=basePath%>img/worlduser.jpg\"></a><div class=\"am-comment-main\">\n" +
                    "<header class=\"am-comment-hd\"><div class=\"am-comment-meta\">   <a class=\"am-comment-author\" href=\"#link-to-user\">Robot</a> 发表于<time> "+getDateFull()+"</time> 发送给: ${user}</div></header><div class=\"am-comment-bd\"> <p>"+data.text+"</p><a href=\""+data.url+"\" target=\"_blank\">"+data.url+"</a></div></div></li>";
            }
            $("#chat").append(html);
            var chat = $("#chat-view");
            chat.scrollTop(chat[0].scrollHeight);
            $("#message").val("");  //清空输入区
        });
    }
    function checkinfo(item)
    {
        window.location.href="${ctx}/otherinfo/"+item;
    }

    function clearConsole(){
        $("#chat").html("");
    }
    function appendZero(s){return ("00"+ s).substr((s+"").length);}
    function getDateFull(){
        var date=new Date();
        var currentdate = date.getFullYear() + "-" + appendZero(date.getMonth() + 1) + "-" + appendZero(date.getDate()) + " " + appendZero(date.getHours()) + ":" + appendZero(date.getMinutes()) + ":" + appendZero(date.getSeconds());
        return currentdate;
    }
</script>
</body>
</html>