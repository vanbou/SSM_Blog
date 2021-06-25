<%--<%@ page language="java" import="java.util.*, java.net.URLEncoder, com.tulun.blog.model.*" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <link rel="stylesheet" id="main-css" href="<%=basePath%>css/demo/style.css" type="text/css" media="all">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="baidu-site-verification" content="emEdenaBVA">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>博客系统</title>


</head>

<body id="contain" class="home blog ui-c3">
<section class="container">
    <header class="header">
        <div class="logo_right"><span class="glyphicon glyphicon-search degfy_search"></span></div>
        <div class="logo_left"></div>
        <h1 class="logo"><a href="">博客系统</a></h1>
        <ul class="nav">

            <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-61">
                <a href="">
                    <span class="glyphicon glyphicon-home"></span>首页
                </a>
            </li>

            <%--类别--%>
            <c:forEach items="${categoryList}" var="category">
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-61">
                    <a href="<%=basePath%>loadPage/${category.id}"></span>${category.categoryName}
                    </a></li>
            </c:forEach>

        </ul>
        <div class="widget_head"></div>
    </header>
    <div class="content-wrap">
        <div class="content" id="content">
            <h3 class="title"><strong>最新发布</strong></h3>
            <input type="hidden" id="categoryId" value="-1"/>
        </div>
    </div>
    <aside class="sidebar">

        <div class="widget widget_tags">
            <h3 class="title"><strong>热门标签</strong></h3>
            <ul class="widget_tags_inner">
                <c:forEach items="${tagList}" var="tag">
                    <li><a title="" href="javascript:;" >${tag.tagName}</a></li>
                </c:forEach>
            </ul>
        </div>
    </aside>

</section>

<%--从本项目的指定路径获取js文件--%>
<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<%--自定义js--%>
<script type="text/javascript" src="<%=basePath%>js/article/article_list.js"></script>

</body>

</html>