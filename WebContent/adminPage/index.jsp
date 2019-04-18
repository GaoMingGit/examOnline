<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理员首页</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<script type="text/javascript">
function init(){
	setInterval("changeIma()", 800);
}
var index = 0;
function changeIma(){
	var img = document.getElementById("img1");
	var temindex = index % 5 + 1 ; 
	img.src = "../images/ad"+temindex+".jpg";
	index = index + 1 ;
}</script>
<style type="text/css">
.frameset{
	 width:80%;
	 }
</style>
</head>
<body onload="init()">
	<%@ include file="top.jsp" %>
	<div class="centerdiv">
	<%@ include file="menu.jsp" %>
	<center>
<div class="content">
	<center>
		<h2 style="color: blue;margin-top: 60px;font-size: 30px">---欢迎您前来小车驾照文科在线模拟考试实用管理网站---</h2>
		<h3 style="color: #ccc;margin-top: 20px">轻松助你渡过小车文科考试</h3>
		<div style="margin-top: 20px">
			<img id="img1" src="../images/ad1.jpg" style="width: 800px;height: 200px">
		</div>
		<h3 style="color: green;margin-top: 100px">********************广东石油化工学院&nbsp;&nbsp;&nbsp;Copyright2018-12-1
		&nbsp;&nbsp;&nbsp;教育技术学&nbsp;&nbsp;&nbsp;高铭&nbsp;&nbsp;&nbsp;学年论文小作品********************</h3>
	</center>
	</div>
	</center>
</div>
</body>
</html>
