<%--
  Created by IntelliJ IDEA.
  User: LQB
  Date: 2022/12/13
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理登录</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8"/>
    <meta name="keywords"
          content="Working Signin form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <link href="//fonts.googleapis.com/css2?family=Karla:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/login.css" type="text/css" media="all"/>
</head>

<body>

<!-- form section start -->
<section class="w3l-workinghny-form">
    <!-- /form -->
    <div class="workinghny-form-grid">
        <div class="wrapper">
            <div class="logo" style="margin-bottom: 20px;">
                <h1>后端管理平台</h1>
            </div>
            <div class="workinghny-block-grid">
                <div class="workinghny-left-img align-end">
                    <img src="resources/imgs/2.png" class="img-responsive" alt="img"/>
                </div>
                <div class="form-right-inf">
                    <div class="login-form-content">
                        <div class="one-frm">
                            <label>账号</label>
                            <input id="account" type="text" name="Name" placeholder="" required=""
                                   style="font-size: 20px;">
                        </div>
                        <div class="one-frm">
                            <label>密码</label>
                            <input id="password" type="password" name="Password" placeholder="" required=""
                                   style="font-size: 20px;">
                        </div>
                        <button class="btn btn-style mt-3" id="login">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/login.js"></script>
</body>
</html>
