<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
    <link rel="stylesheet" id="main-css" href="<%=basePath%>css/demo/style.css" type="text/css" media="all">
    <link href="<%=basePath%>js/ueditor1_4_3/third-party/SyntaxHighlighter/shCoreDefault.min.css" rel="stylesheet" type="text/css" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="baidu-site-verification" content="emEdenaBVA">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title> 博客系统</title>

</head>

<body id="contain" class="home blog ui-c3">
<section class="container">
    <header class="header">
        <div class="logo_right"><span class="glyphicon glyphicon-search degfy_search"></span></div>
        <div class="logo_left"></div>
        <h1 class="logo"><a href="">博客系统</a></h1>
        <div class="widget_head"></div>
    </header>
    <div class="content-wrap">
        <div class="content">
            <header class="article-header">
                <h1 class="article-title">${article.getTitle()}</h1>
                <ul class="article-meta">
                    <li>作者：${article.author}&nbsp;&nbsp;&nbsp;&nbsp;发布于:${article.time}</li>
                    <li>分类：<a rel="category tag" data-original-title="" title="">${article.categoryName}</a></li>
                </ul>
            </header>
            <article class="article-content">
                ${article.content}
            </article>

            <div class="article-tags">
                标签：
<%--                <c:forEach items="${article.id}" var="tag">--%>
<%--                    <a href="javascript:void(0)"  rel="tag" data-original-title="" title="">${tag.tagName}</a>--%>
<%--                </c:forEach>--%>
            </div>

        </div>
</section>

<div id="back_hidden"></div>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jquery.lazyload/1.9.1/jquery.lazyload.js"></script>
</body>

</html>