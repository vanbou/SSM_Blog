<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <link href="<%=basePath%>css/bootstrap.min.css"  rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css"  rel="stylesheet">
    <!-- Data Tables -->
    <link href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css"  rel="stylesheet">
    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/flavr/flavr/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/flavr/flavr/css/flavr.css" />
    <link rel="stylesheet" href="<%=basePath%>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>

<body>
    <div id="wrapper">

        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>文章列表</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">主页</a>
                        </li>
                        <li>
                            <a>文章管理</a>
                        </li>
                        <li>
                            <strong>文章列表</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
								<div class="row">
										<div class="col-sm-3 m-b-xs">
											<select id="categoryId" name="categoryId" class="input-sm form-control input-s-sm inline" style="font-size: 12px;">
	                                            <option value="-1">请选择类别</option>
	                                            <c:forEach items="${categoryList}" var="category">
		                                            <option value="${category.id}">${category.getCategoryName()}</option>
	                                            </c:forEach>
	                                        </select>
	                                    </div>
	                                    <div class="col-sm-3 m-b-xs">
											<select id="tagId" name="tagId" class="input-sm form-control input-s-sm inline" style="font-size: 12px;">
	                                            <option value="-1">请选择标签</option>
	                                            <c:forEach items="${tagList}" var="tag">
		                                            <option value="${tag.id}">${tag.getTagName()}</option>
	                                            </c:forEach>
	                                        </select>
	                                    </div>
	                                    <div class="col-sm-3">
		                                        <div class="input-group">
		                                            <input type="text" id="keyword" placeholder="请输入标题" class="input-sm form-control" style="font-size: 12px;">
		                                            <span class="input-group-btn">
		                                        		<button type="button" class="btn btn-sm btn-primary" onclick="search()">搜索</button>
		                                        	</span>
		                                        </div>
	                                    </div>
	                                    
	                                    <button type="button" class="btn btn-sm btn-danger" onclick="addArticle()">新增文章</button>
                                </div>
                                
                                <!-- 表格数据：表格内容的展示 -->
                                <div id="dataList">
	                                
	                                
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

        </div>
    </div>

    </div>

    
    
    <!-- 新增页面 -->
    <div class="modal inmodal" id="addArticleModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div id="addArticleContent" class="modal-body">
            	
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
    <%--自定义的js--%>
    <script src="<%=basePath%>js/article/article.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/flavr/flavr/js/flavr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/flavr/base.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/zTree_v3/js/jquery.ztree.all-3.5.js"></script>
	
</body>

</html>
