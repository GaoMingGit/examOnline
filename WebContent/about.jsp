<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于考试注意事项</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/add.css">
<link rel="stylesheet" href="css/about.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
	<%@ include file="top.jsp" %>
	<div class="centerdiv">
		<%@ include file="../menu.jsp" %>
	</div>
	<div class="content">
		<div id="main">
		<center><h2 style="margin-top: -20px;color: #FFA500">关于本网站的一些详细说明</h2></center>
		<div style="border-radius:3px 4px 5px 6px;margin-left: 40px;border: solid 8px #FFA500;float: left;clear: left;height: 30%;width: 20%;margin-top: 20px;">
		<img alt="图片正在加载中..." src="${pageContext.request.contextPath }/picture/tupian.jpg" style="height: 100%;width: 100%;"></div>
		<p style="text-indent:25px;margin-top: 30px;">本网站的开发纯属由个人兴趣去开发，无商业利益驱使,不用作商业价值使用.</p>
		<p style="text-indent:25px;padding: 20px;line-height:2.0;letter-spacimg:1.2">
		随着汽车时代的到来，越来越多的家庭开始购买私家车作为代步工具。平常生活中可以看到越来越多的人开车走上了公路。
		而我国法律规定，成年人必须要持驾照开车，所以近几年来，考驾照越来越成为社会人热衷的一件事了.
		考驾照必定需要考文科试，开发一个具有相应题目给网站浏览者在线练习、模拟考试的网站，可以让考驾照的人
		更加掌握考试内容，在每次模拟考试后立马得知自己的分数看到自己的进度，同时也省掉了看实体复习的书本，极大的方便了考驾照的人。</p>
		<h3 style="margin-top: -12px;color: #0000EE">本网站开发用到的一些相关技术和想说的话</h3>
		<p>①:本网站个人采用 <font style="color: red;">Spring + Struts + Hibernate +Mysql数据库</font> 技术结合搭建开发的.</p>
			<p>②:用户账号的注册采用了Ajax异步数据请求技术加邮件激活账号技术实现的.</p>
			<p>③:由于<font style="color: red;">开发时间匆促</font>，本网站上线的功能不是太多<font style="color: red;">(后期继续更新需求)</font>，但目前实现的</p>
			<p>功能还是符合网站主题开发所需</p>
			<p>④:个人开发不容易，有什么做的不够好的，请微信扫右边二维码，或者前往本人QQ</p>
			<div style="border-radius:3px 4px 5px 6px;margin-right: 40px;border: solid 8px #C1FFC1;float: right;clear: right;height: 30%;width: 20%;margin-top: -140px;">
		<img alt="图片正在加载中..." src="${pageContext.request.contextPath }/picture/erweima.jpg" style="height: 100%;width: 100%;"></div>
			<p>邮箱<font style="color: blue;">1585168893@qq.com&nbsp;</font>等方式联系本人开发者.</p>
		<p>⑤:本网站的一切解释权在于本人开发者，您的关注将是我继续开发的不懈动力</p>
		</div>
	</div>
</body>
</html>
