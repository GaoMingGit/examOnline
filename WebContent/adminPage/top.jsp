<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头部页面</title>
</head>
<body>
<!-- 头部 -->
	
	<header>
	<h1 style="color: white;margin-left: 55px;font-family: '楷体'">基于JAVA 的 SSH小车驾照文科在线模拟考试的web开发(管理员界面)</h1>
	<div class="personal">
		<img src="../picture/noheader.jpg" alt="图片正在加载...">
		<c:if test="${exitAdmin != null }">
			<table style="width: 150px;float: right;margin-top: 10px;">
				<tr>
					<td><strong style="color: red">${exitAdmin.adminname }</strong></td>
				</tr>
				<tr>
					<td><h3>
				<a href="${pageContext.request.contextPath}/admin_logout.action" style="margin-top: -40px;">退出登录</a>
				</h3></td>
				</tr>
			</table>
		</c:if>
			
	</div>
	</header>
	
	
	<%-- <header>
	<h1 style="color: white; margin-left: 55px; font-family: '楷体'">
		基于Java MVC模式的小车驾照文科在线模拟考试网站---<strong
			style="color: red; font-size: 38px">用户界面</strong>
	</h1>
	<div class="personal">
		<img src="picture/noheader.jpg" alt=""> <img
			src="${pageContext.request.contextPath}/" alt="">

		<div class="inner">
			<p>
				欢迎<strong style="color: red">${loginUser.username }</strong>登录
			</p>
			<a href="${pageContext.request.contextPath}/">退出登录</a>
		</div>
	</div>
	</header> --%>


</body>
</html>