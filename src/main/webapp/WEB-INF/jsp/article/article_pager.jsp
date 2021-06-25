<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table class="table table-striped table-bordered table-hover dataTables-example">
<thead>
    <tr>
        <th>Id</th>
        <th>标题</th>
        <th>栏目</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
</thead>
<%--<div>--%>
<tbody>
	<c:forEach items="${articleList}" var="article">
		<tr class="gradeX">
            <td>${article.id}</td>
            <td>
            	<a target="_blank" href="<%=basePath%>article/${article.id}">
            		${article.title}
            	</a>
            </td>
			<td>
				<a target="_blank" href="<%=basePath1%>/loadPage/${article.categoryId}" >
            		${article.categoryName}
            	</a>
			</td>
			<td>
				<c:if test="${article.status == 0}">正常</c:if>
            	<c:if test="${article.status == 1}">不可用</c:if>
            </td>
            <td>${article.time}</td>
            <td>
				<c:if test="${article.status == 0}">
					<button class="btn btn-info btn-xs" type="button"
                    title="关闭" onclick="updateStatue(${article.id},1)">关闭
    				</button>
    			</c:if>
    			<c:if test="${article.status == 1}">
    				<button class="btn btn-info btn-xs" type="button"
                    title="开启" onclick="updateStatue(${article.id},0)">开启
                    </button>
    			</c:if>

            </td>
        </tr>
	</c:forEach>
</tbody>
</table>


<jsp:include page="pager.jsp" flush="true"></jsp:include>