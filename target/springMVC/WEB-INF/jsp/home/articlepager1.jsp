<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
    <link rel="stylesheet" id="main-css" href="<%=basePath%>css/demo/style.css" type="text/css" media="all" />
    <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
    <meta name="baidu-site-verification" content="emEdenaBVA" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>${ca.categoryName} - 博客系统</title>


</head>

<body id="contain" class="home blog ui-c3">
<section class="container">
    <header class="header">
        <div class="logo_right"><span class="glyphicon glyphicon-search degfy_search"></span></div>
        <div class="logo_left"></div>
        <h1 class="logo"><a href="">博客系统</a></h1>
        <ul class="nav">

            <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-61">
                <a href="<%=basePath %>">
                    <span class="glyphicon glyphicon-home"></span>首页
                </a>
            </li>
            <c:forEach items="${categoryList}" var="category">
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-61
		<c:if test="${ca.id == category.id}">
			current_page_item
		</c:if>
	">
                    <a href="<%=basePath%>loadPage/${category.id}">${category.categoryName}
                    </a></li>
            </c:forEach>

        </ul>		<div class="widget_head">
    </div>
    </header>
    <div class="content-wrap">
        <div class="content" id="content">
            <h3 class="title"><strong>${ca.categoryName}</strong></h3>
            <input type="hidden" id="categoryId" value="${ca.id}"/>

        </div>
    </div>
    <aside class="sidebar">
        <div class="widget widget_tags">
            <h3 class="title"><strong>热门标签</strong></h3>
            <ul class="widget_tags_inner">
                <c:forEach items="${tagList}" var="tag">
                    <li><a title="">${tag.tagName}</a></li>
                </c:forEach>
            </ul>
        </div>

        </div>
    </aside>
</section>

<div id="back_hidden"></div>
<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<%--自定义的路径--%>
<script type="text/javascript" src="<%=basePath%>js/category/article_list.js"></script>
</body>

</html>