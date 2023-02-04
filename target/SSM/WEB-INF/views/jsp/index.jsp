<%--
  Created by IntelliJ IDEA.
  User: LQB
  Date: 2022/12/6
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title id="one"></title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-theme.css" media="screen">
    <link rel="stylesheet" href="resources/css/index.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black" id="title"></div>

        <ul class="layui-nav layui-layout-right" style="margin-right: 60px">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="resources/imgs/兰博基尼2.jpeg" class="layui-nav-img">
                    ${acc}
                </a>
                <dl class="layui-nav-child">
                    <dd data-toggle="modal" data-target="#updateModal" id="updatePwd"><a href="#">修改密码</a></dd>
                    <dd id="logout"><a href="#">注销</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <%--    修改密码弹出框--%>
    <div>
        <div style="z-index: 99999;" class="modal fade" id="updateModal" tabindex="-1"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 420px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 18px;">修改密码</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="text-align: center">
                        <div style="margin-top: 10px">
                            <label>原始密码</label>
                            <input placeholder="请输入原密码" id="friPwd"/>
                        </div>
                        <div style="margin-top: 10px">
                            <label>新的密码</label>
                            <input placeholder="请输入新的密码" id="secPwd"/>
                        </div>
                        <div style="margin-top: 10px">
                            <label>确认密码</label>
                            <input placeholder="请再次输入密码" id="thrPwd"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button style="outline: none; background-color: rgb(40,167,69);" type="button"
                                class="btn btn-secondary" data-dismiss="modal">关闭
                        </button>
                        <button style="outline: none; background-color: rgb(11,196,223);" type="button"
                                class="btn btn-primary" id="savePwd">保存
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-body" id="bodys">
        <!-- 内容主体区域 -->
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll" style="width: 198px !important;">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test" id="power">
            </ul>
        </div>
    </div>

    <script src="resources/js/jQuery.min.js"></script>
    <script src="resources/js/layui-v2.6.8/layui/layui.js"></script>
    <script src="resources/js/jq.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/index.js"></script>
</div>
</body>
</html>
