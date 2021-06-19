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
            var errorMeg = form_login.errorMeg.value;
            if (errorMeg != 'null') {
                alert(errorMeg);
                flag = false;
            }
            return flag;
        }
    </script>
    <title>登录</title>
</head>
<body class="logobg_style" onload="checkForm()">
<div id="large-header" class="large-header login-page">
    <canvas id="demo-canvas" width="1590" height="711"></canvas>
    <div class="login-form">
        <div class="login-content">
            <h1 class="title_name">账户登录</h1>
            <form action="login" method="post" role="form" id="form_login"
                  class="login_padding">
                <input type="hidden" name="errorMeg"
                       value="<%=request.getAttribute("errorMeg")%>">
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_user"></i>
                        </div>
                        <input type="text" class="form-control" name="userName"
                               value="${sessionScope.name}" id="username"
                               placeholder="请输入你的用户名" autocomplete="off">
                    </div>

                </div>

                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_password"></i>
                        </div>
                        <input type="password" class="form-control" name="password"
                               value="${sessionScope.password}" id="password" placeholder="密码"
                               autocomplete="off">
                    </div>
                </div>
                <div style="color: white" class="text-right">
                    <c:if test="${not empty sessionScope.name}">
                        <input type="checkbox" name="isLogin" checked value="on"
                               class="remember">
                    </c:if>
                    <c:if test="${empty sessionScope.name}">
                        <input type="checkbox" name="isLogin" value="on" class="remember">
                    </c:if>
                    记住密码
                </div>
                <div class="tishi"></div>
                <div class="form-group">
                    <input type="submit" class="btn btn-danger btn-block btn-login"
                           value="登录"/>
                </div>
                <div class="form-group">
                    <input type="reset" class="btn btn-danger btn-block btn-login"
                           value="重填"/>
                </div>
                <div class=" textright">
                    <a href="reg" class="remember">立即注册</a>
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
