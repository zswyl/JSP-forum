<%@ page contentType="text/html;charset=UTF-8"
         trimDirectiveWhitespaces="true" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
            type="text/css" rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/assets/font/css/font-awesome.min.css"
            type="text/javascript" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/normalize.css"
          type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/css.css"
          rel="stylesheet" type="text/css">
    <script
            src="${pageContext.request.contextPath}/assets/js/jquery-1.11.0.min.js"
            type="text/javascript"></script>
    <script
            src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootsnav.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"
            type="text/javascript"></script>

    <script type="text/javascript">
        function checkForm() {
            var flag = true;
            var existMsg = form_register.existMsg.value;
            if (existMsg != 'null') {
                alert(existMsg);
                flag = false;
            }
            return flag;
        }
    </script>

    <title>注册</title>
</head>
<body class="regbg_style" onload="checkForm()">
<div id="large-header" class="large-header reg-page">
    <canvas id="demo-canvas" width="1630" height="850"></canvas>
    <div class="reg-form">
        <div class="reg-content">
            <h1 class="title_name">用户注册</h1>
            <form action="registere" method="post" enctype="multipart/form-data" role="form" id="form_register"
                  class="reg_padding">
                <!-- 	<form action="registere" method="post" role="form"
                        id="form_register" class="reg_padding"> -->
                <div class="form-group clearfix">
                    <input type="hidden" name="existMsg"
                           value="<%=request.getAttribute("existMsg")%>">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_user"></i>
                        </div>
                        <input type="text" class="form-control" name="userName"
                               placeholder="创建用户名" autocomplete="off">
                    </div>
                    <div style="color: white" class="text-right">${userNameMsg}</div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_password"></i>
                        </div>
                        <input type="password" class="form-control" name="password"
                               placeholder="创建密码" autocomplete="off">
                    </div>
                    <div style="color: white" class="text-right">${passwordMsg}</div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_password"></i>
                        </div>
                        <input type="password" class="form-control" name="repassword"
                               id="password" placeholder="请再次输入密码" autocomplete="off">
                    </div>
                    <div style="color: white" class="text-right">${repasswordMsg}</div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_youxiang"></i>
                        </div>
                        <input type="email" class="form-control" name="email" id="email"
                               placeholder="注册邮箱" autocomplete="off">
                    </div>
                    <div style="color: white" class="text-right">${emailMsg}</div>

                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_sex"></i>
                        </div>
                        <input type="number" class="form-control" name="gender" id="sex"
                               placeholder="请输入你的性别:0代表女；1代表男" autocomplete="off">
                    </div>
                    <div style="color: white" class="text-right">${genderMsg}</div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_upload"></i>
                        </div>
                        <input type="file" class="form-control" name="head" placeholder="请上传你的头像">
                    </div>
                    <div style="color: white" class="text-right">${headMsg}</div>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-danger btn-block btn-login"
                           value="注册"/>
                </div>
                <div class="form-group">
                    <input type="reset" class="btn btn-danger btn-block btn-login"
                           value="重填"/>
                </div>
                <div class=" textright">
                    <a href="login1" class="remember">返回登录页面</a>
                </div>
            </form>
        </div>

    </div>
</div>

<script
        src="${pageContext.request.contextPath}/assets/js/TweenLite/TweenLite.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/js/TweenLite/EasePack.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/js/TweenLite/rAF.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/js/TweenLite/demo-1.js"></script>
</body>
</html>
