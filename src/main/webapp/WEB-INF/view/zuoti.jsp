<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/9
  Time: 16:14
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
<html>
<head>
    <title>做题Demo</title>
    <script src="<%=basePath%>/js/editor.js"></script>
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>

<div id="ceshi">

</div>

<div id="demo">
    <script>
        $(document).ready(function () {
          console.log("ceshi");

            $.ajax({
              url: "<%=path%>/ti/test",
              type:"get",
              success:function (data) {
                  var jsObject = JSON.parse(data);
                  console.log(jsObject);
                  var Ti=jsObject.title;
                  console.log(Ti);
                  // $("#ceshi").html(Ti);
              }

          })
        })
    </script>
</div>

<br>
<br>
<script>
    var editor;
    window.onload = function () {
        editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'});
        editor.insertInto(document.getElementById('editorContainer'));
    }
</script>
<div id="editorContainer"></div>
<button id="su"> 提交</button>
<p id="messg"></p>
<div id="answer"></div>

<script>
    $(document).ready(function () {
        $("#su").click(function () {
            var doanswer=$(".wrs_container").html();
            $.ajax({
                type:"POST",
                url:"<%=path%>/ti/dotest",
                data:{
                    username:${user},
                    doanswer:doanswer,
                    ti_id:${ti_id}

                },
                dataType:"json",
                success:function (data) {
                    console.log(data.rightanswer);
                    $("#messg").html(data.mess);
                    $("#answer").html(data.rightanswer);

                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("请求失败");
                }

            })

        })

    })
</script>
</body>
</html>
