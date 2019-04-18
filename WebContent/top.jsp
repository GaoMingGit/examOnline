<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/js.js"></script>
<title>头部页面</title>
</head>
<body>
<!-- 头部 -->
	<c:if test="${exitUser == null }">
	<header>
	<h1 style="color: white;margin-left: 55px;font-family: '楷体'">基于JAVA 的 SSH小车驾照文科在线模拟考试的web开发(用户界面)</h1>
	<div class="personal">
		<img src="${pageContext.request.contextPath}/picture/noheader.jpg" alt="图片正在加载...">
		
		<div class="inner">
			<a href="${pageContext.request.contextPath}/user/userlogin.jsp"><strong style="color: red">请用户登录</strong></a>
		</div>
	</div>
	</header>
	</c:if>
	
	<c:if test="${exitUser != null }">
		<header>
		<h1 style="color: white;margin-left: 55px;font-family: '楷体'">基于Java MVC模式的小车驾照文科在线模拟考试网站(用户界面)</h1>
		<div class="personal">
			<c:if test="${exitUser.imagepath == null }">
			<img src="${pageContext.request.contextPath}/picture/noheader.jpg" alt="图片正在加载...">
			</c:if>
			<c:if test="${exitUser.imagepath != null }">
			<img src="${pageContext.request.contextPath}/${exitUser.imagepath}" alt="图片正在加载...">
			</c:if>
			<div class="inner">
				<p>
					欢迎<strong style="color: red">&nbsp;&nbsp;${exitUser.username }&nbsp;&nbsp;</strong>登录
				</p>
				<a href="${pageContext.request.contextPath}/user_logout.action">退出登录</a>
			</div>
		</div>
		</header>
	</c:if>
</body>
</html>