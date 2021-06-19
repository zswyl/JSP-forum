<%@ page contentType="text/html;charset=UTF-8"
         trimDirectiveWhitespaces="true" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    <title>添加留言界面</title>
    <script charset="utf-8"
            src="${pageContext.request.contextPath
        }/assets/js/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8"
            src="${pageContext.request.contextPath
        }/assets/js/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8"
            src="${pageContext.request.contextPath
        }/assets/js/kindeditor/lang/zh-CN.js"></script>
    <script>
        KindEditor
            .ready(function (K) {
                window.editor = K
                    .create(
                        '#editor_id',
                        {
                            uploadJson: 'Kindeditor/uploadFile',
                            fileManagerJson: 'Kindeditor/fileManager',
                            allowImageUpload: true, //多图上传
                            allowFileManager: true, //浏览图片空间
                            filterMode: false, //HTML特殊代码过滤
                            resizeType: 0,
                            width: '126%',
                            height: '250px',
                            items: ['fontname', 'fontsize',
                                'forecolor', 'hilitecolor', 'bold',
                                'italic', 'underline',
                                'removeformat', 'justifyleft',
                                'justifycenter', 'justifyright',
                                'insertorderedlist',
                                'insertunorderedlist', 'emoticons',
                                'image', 'multiimage', 'insertfile'],
                            afterBlur: function () {
                                this.sync();
                            }, //编辑器失去焦点(blur)时执行的回调函数（将编辑器的HTML数据同步到textarea）
                            afterUpload: function (url, data, name) { //上传文件后执行的回调函数，必须为3个参数
                                if (name == "image"
                                    || name == "multiimage") { //单个和批量上传图片时
                                    if (K("#pic").length > 0) { //文本框存在
                                        document
                                            .getElementById('piclist').options[document
                                            .getElementById('piclist').length] = new Option(
                                            url, url); //下拉列表框增加一条
                                        document
                                            .getElementById('piclist').selectedIndex += 1; //选定刚新增的这一条
                                        K("#indexpicimg")
                                            .html(
                                                "<img src='" + url + "' width='200' height='95' />"); //重置图片展示区DIV的HTML内容
                                        K("#pic").val(url); //重置文本框值
                                    }
                                }
                            }
                        });
            });
    </script>
</head>

<body class="logobg_style">
<div id="large-header" class="large-header note-page">
    <canvas id="demo-canvas" width="1350" height="630"></canvas>
    <div class="note-form">
        <div class="note-content">
            <h1 class="title_name">添加留言</h1>
            <form action="release" method="post" role="form" id="form_note"
                  class="login_padding" enctype="multipart/form-data">
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">标题:</div>
                        <input type="text" class="form-control" name="title" id="title"
                               placeholder="请输入标题" autocomplete="off">
                    </div>
                </div>

                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group">
                            <div class="input-group-addon">内容:</div>
                            <textarea id="editor_id" name="content"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">上传附件：</div>
                        <input type="file" class="form-control" name="file" id="file">
                    </div>
                </div>
                <div class="tishi"></div>
                <div class="form-group">
                    <input type="submit" class="btn btn-danger btn-block btn-login"
                           value="发布"/>
                </div>
                <div class="form-group">
                    <input type="reset" class="btn btn-danger btn-block btn-login"
                           value="重填"/>
                </div>
                <div class=" textright">
                    <a href="index" class="remember">返回留言板界面</a>
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
