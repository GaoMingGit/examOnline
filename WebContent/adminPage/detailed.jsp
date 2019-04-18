<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题详细的页面</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<%@ include file="top.jsp" %>
<div class="centerdiv">
	<%@ include file="menu.jsp" %>
<div class="content">
	<dt>试题的(UUID)编号:&nbsp;&nbsp;<font color="green">${questionBean.qid }</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>
				首次添加至题库时间:&nbsp;&nbsp;&nbsp;&nbsp;<font color="green">${questionBean.addTime }</font>&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</dt><br>
	<table style="height: 200px;width: 93%;">
	<tr>
		<td ><p id ="1" class="timu"><dt><font color="blue">试题题目:&nbsp;&nbsp;</font>${questionBean.question }</dt><br></td>
	</tr>
	<tr>
		<td colspan="1"><dd"> A. ${questionBean.select_a }</dd><br></td>
		<c:if test="${questionBean.select_d == ''}">
			<!-- 图片的路径不为空就显示图片 -->
			<c:if test="${questionBean.imagepath != null}">
				<td rowspan="2"> <img alt="" src="${pageContext.request.contextPath }/${questionBean.imagepath}" style="height: 100px;width: 50%;"></td>
			</c:if>
		</c:if>
		
		<c:if test="${questionBean.select_d != ''}">
		<!-- 图片的路径不为空就显示图片 -->
			<c:if test="${questionBean.imagepath != null}">
		<td rowspan="4"> <img alt="" src="${pageContext.request.contextPath }/${questionBean.imagepath}" style="height: 100px;width: 50%;"></td>
		</c:if>
		</c:if>
	</tr>
	<tr>
		<td><dd> B. ${questionBean.select_b }</dd><br></td>
	</tr>
	
	<c:if test="${questionBean.select_c != ''}">
					<c:if test="${questionBean.select_c != null}">
	<tr>
		<td><dd> C. ${questionBean.select_c }</dd><br></td>
	</tr>
	</c:if>
				</c:if>
	<c:if test="${questionBean.select_d != ''}">
	<tr>
		<td><dd> D. ${questionBean.select_d }</dd><br></td>
	</tr>
	</c:if>
	<tr>
		<td>
			<h2 style="color: red">正确答案&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${questionBean.answer }</h2>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div style="background: pink;width: 100%;height: 200px;">
				<p style="color: green;font-size: 20px;">答案解释:&nbsp;&nbsp;${questionBean.descc }</p></div>
			</div>
		</td>
	</tr>
</table>

	</div>
	</div> 
</body>
</html>