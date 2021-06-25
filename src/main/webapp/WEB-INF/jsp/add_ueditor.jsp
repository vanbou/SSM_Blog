<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%  String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB18030">
    <link href="<%=basePath%>css/bootstrap.min.css"  rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
    <title>新增博客</title>
</head>
<body>
<div class="ibox-content">
    <form method="get" class="form-horizontal">
        <div class="hr-line-dashed"></div>
        <div class="form-group">
            <label class="col-sm-2 control-label">内容:</label>
            <div class="col-sm-10">
                <script id="editor" type="text/plain"></script>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-2">
                <button class="btn btn-primary" type="button" onclick="saveArticle()">保存内容</button>
                <button class="btn btn-white" type="button" onclick="cancelSaveArticle()">取消</button>
            </div>
        </div>
    </form>
</div>

<!-- Mainly scripts -->
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<%--自定义js--%>
<script src="<%=basePath%>js/article/add_article_test.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=basePath%>js/ueditor1_4_3/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=basePath%>js/ueditor1_4_3/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>js/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script src="<%=basePath%>js/plugins/chosen/chosen.jquery.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var ue = UE.getEditor('editor');
    })

    // 初始化多选框
    $(".chosen-select").chosen({
        max_selected_options:5,
        no_results_text:"没有找到",
        allow_single_deselect:true
    });

</script>
</body>
</html>