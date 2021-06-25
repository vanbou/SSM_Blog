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
        <title>富文本编辑器测试</title>
</head>

<body class="gray-bg">
    <script id="container" name="content" type="text/plain">这里写你的初始化内容</script>
	<script type="text/javascript" src="<%=basePath%>js/ueditor1_4_3/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/ueditor1_4_3/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
    var ue = UE.getEditor('container');
    </script>
</body>

</html>