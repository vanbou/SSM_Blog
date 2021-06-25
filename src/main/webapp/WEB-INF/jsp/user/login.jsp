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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <title>后台  - 登录</title>
    <link href="<%=basePath%>css/bootstrap.min.css"  rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css"  rel="stylesheet">
    <link href="<%=basePath%>css/animate.css"  rel="stylesheet">
    <link href="<%=basePath%>css/style.css"  rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/flavr/flavr/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/flavr/flavr/css/flavr.css" />
    <link href="<%=basePath%>css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <script type="text/javascript">
        // 登录
        function login(){
            var loginId = $("#loginId").val();
            var password = $("#password").val();
            if(isEmpty(loginId)){
                toastr.error("账户不能为空");
                return false;
            }

            if(isEmpty(password)){
                toastr.error("密码不能为空");
                return false;
            }
            $.ajax({
                url : "checklogin",
                data: $("#form").serialize(),
                method : "post",
                dataType : "json",
                success : function(data) {
                    if (data.resultCode == 'success') {
                        window.location.href = "../article/add";
                    }else{
                        toastr.error(data.errorInfo);
                        return false;
                    }
                }
            })
        }
    </script>
    <style>
        .loginscreen.middle-box{padding-top:260px;}
    </style>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-img"></h1>
        </div>

        <%--通过form表单将登录用户名/密码提交后台--%>
        <form id="form" class="m-t" role="form" >
            <div class="form-group"><h2 >博客系统登录后台</h2></div>
            <div class="form-group">
                <input type="text" name="name" id="loginId" class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
                <input type="password" name="passwd" id="password" class="form-control" placeholder="密码">
            </div>
            <button type="button" class="btn btn-primary block full-width m-b" onclick="login()">登 录</button>

        </form>
    </div>
</div>

<script src="<%=basePath%>js/jquery-2.1.1.min.js" ></script>
<script src="<%=basePath%>js/bootstrap.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/flavr/flavr/js/flavr.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/flavr/base.js"></script>
<script src="<%=basePath%>js/validation.js"></script>
<script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
</body>

</html>