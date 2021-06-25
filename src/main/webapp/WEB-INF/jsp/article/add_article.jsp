<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <link href="<%=basePath%>css/bootstrap.min.css"  rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css"  rel="stylesheet">
    <!-- Data Tables -->
    <link href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css"  rel="stylesheet">
    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/flavr/flavr/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/flavr/flavr/css/flavr.css" />
    <link href="<%=basePath%>css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/chosen/chosen.css" rel="stylesheet">

    <style>
        .input-upload{ position: relative;}
        .input-upload input[type="file"]{ position: absolute; left: 0px; top: 0px; width: 72px; height: 35px; opacity:.0;filter:alpha(opacity=00);}
    </style>
    <title>新增博客</title>
</head>
<body>
<div id="wrapper">

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%--<div class="row wrapper border-bottom white-bg page-heading">--%>

        <%--</div>--%>


        <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <form method="get" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">类别:</label>
                                    <div class="col-sm-4">
                                        <select class="form-control m-b" id="categoryId">
                                            <option value="-1">无</option>
                                            <c:forEach items="${categoryList}" var="category">
                                                <option value="${category.id}">${category.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">博客标题</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="title" class="form-control" placeholder="请填写博客名">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">博客内容:</label>
                                    <div class="col-sm-10">
                                        <script id="editor" type="text/plain"></script>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标签:</label>
                                    <div class="col-sm-10">
                                        <select data-placeholder="请选择标签" class="chosen-select" multiple style="width:450px;" tabindex="5">
                                            <c:forEach items="${tagList}" var="tag">
                                                <option value="${tag.id}" hassubinfo="true">${tag.tagName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
                                        <button class="btn btn-primary" type="button" onclick="saveArticle()">保存</button>
                                        <button class="btn btn-white" type="button" onclick="cancelSaveArticle()">取消</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

</div>

<!-- Mainly scripts -->
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>js/hplus.js"></script>
<script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath%>js/validation.js"></script>
<%--自定义js--%>
<script src="<%=basePath%>js/article/add_article.js"></script>
<script type="text/javascript" src="<%=basePath%>js/flavr/flavr/js/flavr.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/flavr/base.js"></script>
<script type="text/javascript" src="<%=basePath%>js/zTree_v3/js/jquery.ztree.all-3.5.js"></script>
<script src="<%=basePath%>js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ueditor1_4_3/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>js/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>
<script src="<%=basePath%>js/plugins/chosen/chosen.jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/imageUtils.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var UEDITOR_HOME_URL = "/js/ueditor1_4_3/";
        var ue = UE.getEditor('editor');
    })

    $(".chosen-select").chosen({
        max_selected_options:5,
        no_results_text:"û���ҵ�",
        allow_single_deselect:true
    });

</script>
</body>
</html>