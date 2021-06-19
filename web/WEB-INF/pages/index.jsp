<%@ page contentType="text/html;charset=UTF-8"
         trimDirectiveWhitespaces="true" language="java" %>
<!doctype html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<meta charset="utf-8">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/bootstrap-4.5.2-dist/css/bootstrap.css">
<script
        src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/bootstrap-4.5.2-dist/js/bootstrap.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/js/jquery-1.11.0.min.js"
        type="text/javascript"></script>

<head>
    <meta charset="utf-8">
    <title>留言板</title>
</head>
<body style="background-color: Skyblue">
<header class="navbar navbar-expand-md bg-primary navbar-light   py-3">
    <div class="navbar-nav-scroll text-white">
        <h2>JSP贴吧</h2>
    </div>
</header>
<div style="margin: 10px"></div>
<div style="margin-left: 45px">
    <div class="d-flex w-100 justify-content-between">
        <a href="addMessage" class="btn btn-success"> 新帖子 </a>
        <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item"><c:if
                    test="${not empty sessionScope.userName}">
                当前用户 ：${sessionScope.userName} |<a href="logout">注销 </a>
            </c:if> <c:if test="${sessionScope.userName}">
                无用户：| <a href="login1" class="text-black">登录 </a>
            </c:if></li>
        </ul>
    </div>
    <div style="margin: 10px"></div>
    <c:forEach items="${requestScope.msg}" var="msg" varStatus="st">
        <div class="row">
            <div class="col  py-3 ">
                <img src="assets/images/${head[st.count-1]}" alt="图片" width="50px" height="50px"
                     style="margin: 12px">
                <p>用户：${unameString[st.count-1]}</p>
                <p>创建时间：${msg.pubTime}</p>
            </div>
            <div class="col-8  py-3">
                <div class="d-flex w-100 justify-content-between  bg-primary font-weight-bold text-white">
                    <p class="text-center">标题：${msg.title}</p>
                    <p class="text-center">第 ${st.count} 楼</p>
                </div>
                <div class=" border-warning rounded">
                    <p class=" font-weight-bolder">内容：${msg.content}</p>
                    <p>附件：<a href="${pageContext.request.contextPath}/assets/upload/${msg.attachment}">${msg.attachment}</a>
                    </p>
                </div>
                <div> <a href="reply">回复</a></div>
            </div>

        </div>
        <div class="border"></div>
    </c:forEach>
</div>
</body>

</html>