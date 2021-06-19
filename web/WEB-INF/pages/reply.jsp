<%--
  Created by IntelliJ IDEA.
  User: 江七
  Date: 2020/11/28
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<head>
    <title>回复</title>
</head>
<body>
<textarea id="editor_id" name="content"></textarea>
<!-- 留言信息列表展示 -->
<div>
    <ul>
        <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
        <c:forEach items="${requestScope.commentList}" var="comment">
            <!-- 如果留言信息是在本文章下的才显示 -->
            <c:if test="${comment.cContentid eq content.id && comment.cOtherid eq content.userid}">
                <li style="border-top: 1px dotted #01AAED">
                    <br/>
                    <div style="text-align: left;color:#444">
                        <div>
                            <span style="color:#01AAED">${comment.cUserid}</span>
                        </div>
                        <div>${comment.cContent}</div>
                    </div>
                    <div>
                        <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                            <span>${comment.cCreatetime}</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <p>
                                <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                            </p>
                            <hr style="margin-top: 7px;"/>
                        </div>
                        <!-- 回复表单默认隐藏 start-->
                        <div class="replycontainer layui-hide" style="margin-left: 61px;">
                            <form action="<%=request.getContextPath()%>/user/addreply" method="post" class="layui-form">
                                <input name="rContentid" id="rContentid" value="${content.id}" hidden="hidden"/>
                                <input name="rUserid" id="rUserid" value="${sessionScope.user.userid}" hidden="hidden"/>
                                <input name="rOtherid" id="rOtherid" value="${comment.cUserid}" hidden="hidden"/>
                                <input name="rWords" id="rWords" value="${comment.cId}" hidden="hidden"/>
                                <input name="rState" id="rState" value="0" hidden="hidden"/>
                                <div class="layui-form-item">
                                    <textarea name="rContent" id="rContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                </div>
                                <div class="layui-form-item">
                                    <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                </div>
                            </form>
                        </div>

                    </div>

                    <!-- 以下是回复信息 -->
                    <c:forEach items="${requestScope.replyList}" var="reply">
                        <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                        <c:if test="${reply.rContentid eq content.id && reply.rWords eq comment.cId}">
                            <div style="text-align: left;margin-left:61px;color: #444">
                                <div>
                                    <span style="color:#5FB878">${reply.rUserid}&nbsp;&nbsp;回复${reply.rOtherid}</span>
                                </div>
                                <div>${reply.rContent}</div>
                            </div>
                            <div>
                                <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                    <span>${reply.rCreatime}</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>
                                        <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                    </p>
                                    <hr style="margin-top: 7px;"/>
                                </div>
                                <!-- 回复表单默认隐藏 -->
                                <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                    <form action="<%=request.getContextPath()%>/user/addreply" method="post" class="layui-form">
                                        <input name="rContentid" id="rContentid" value="${content.id}" hidden="hidden"/>
                                        <input name="rUserid" id="rUserid" value="${sessionScope.user.userid}" hidden="hidden"/>
                                            <%--  <input name="rCreatime" id="rCreatime" value="<%=nowDate%>" hidden="hidden"/>--%>
                                        <input name="rOtherid" id="rOtherid" value="${comment.cUserid}" hidden="hidden"/>
                                        <input name="rWords" id="rWords" value="${comment.cId}" hidden="hidden"/>
                                            <%--<input name="rId" id="rId" value="${reply.rId}" hidden="hidden"/>--%>
                                        <div class="layui-form-item">
                                            <textarea name="rContent" id="rContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <button id="replyBtn1" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </c:if>
                    </c:forEach>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>

</body>
<script src="${pageContext.request.contextPath}/public/js/jquery-3.2.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="${pageContext.request.contextPath}/public/layui/src/layui.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function btnReplyClick(elem) {
        var $ = layui.jquery;
        if($(this)){
        }else if(!$(this)){
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
        }
        $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
        if ($(elem).text() == '回复') {
            $(elem).text('收起')
        } else {
            $(elem).text('回复')
        }
    }
    $("#replyBtn").click(function(){
        var rContentid = $("#rContentid1").val();
        var rUserid = $("#rUserid1").val();
        var rOtherid = $("#rOtherid1").val();
        var rContent = $("#rContent11").val();
        var rWords = $("#rWords1").val();
        var rState= $("#rState").val();
        $.ajax({
            url: '<%=request.getContextPath()%>/user/addreply',
            type: 'POST',
            data: [{
                rContentid: rContentid,
                rUserid: rUserid,
                rOtherid: rOtherid,
                rContent: rContent,
                rWords: rWords,
                rState:rState
            }],
            success: function(data){
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                    /* btn1: function(index){
                       /!*  $("body").html(data);*!/
                     }*/
                });
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });
</html>