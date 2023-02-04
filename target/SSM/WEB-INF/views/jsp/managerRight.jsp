<%--
  Created by IntelliJ IDEA.
  User: LQB
  Date: 2022/12/13
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限管理</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/index.css">
</head>
<body>

<div style="padding: 15px; font-size: 20px;">
    <h3 style="margin: 10px 0; text-align: center; ">权限管理</h3>
    <div style="display: flex;" >
        <div style="margin-left: 80px">
            <%--       系统管理员--%>
            <div id="SystemAdm">
            </div>
        </div>

        <div style="margin-left: 80px">
            <%--       资质审查员--%>
            <div id="DataAuditor">
            </div>
        </div>
        <div style="margin-left: 80px">
            <%--       房源发布员--%>
            <div id="Publisher">
            </div>
        </div>
    </div>
</div>
<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>
<script src="resources/js/power.js"></script>
</body>
</html>
