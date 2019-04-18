<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册页面</title>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function toLogin(){
		window.location.href = "${pageContext.request.contextPath }/user/userlogin.jsp";
	}
</script>
<style type="text/css">
h2{
	margin: 100px auto;
}
#main{
	display: block;  
    content: "";  
	margin: -80px auto;
	width: 50%;
	height: 500px;
	background: #fdf9ff;
	border-radius: 30px/10px;
    box-shadow: 3px 8px 10px rgba(0,0,0,0.8);
}
.button {
	padding-left: 0!important;
	height: 50px;
	width: 150px!important;
	background-color: #fff;
	color: #0866c6!important;
	cursor: pointer;
	border: 1px solid #0866c6!important;
}
.button:hover {
	background-color: #81dafb;
	color: #fff!important;
	transform: scale(1.1);
}
table {
	width: 100%;
}
a:link {
font-size: 20px;
color: blue;
text-decoration: none;
}
a:visited {
font-size: 20px;
color: blue;
text-decoration: none;
}
a:hover {
font-size: 20px;
color: blue;
text-decoration: none;
} 
</style>
</head>
<body>
<center><h2>小车驾照文科在线模拟考试系统登录页面</h2></center>
<div id="main">
<div style="background: #fd253e;width: 50%;height: 100%;float: left">
		<center>
			<h2 style="color: white;margin-top: 150px">您好！朋友</h2>
			<h3 style="color: white;margin-top: 20px">输入您的个人注册信息登录网站。</h3>
			<h3 style="color: white;margin-top: 20px">您离老司机的距离又近一步</h3>
			<td align="center"><input type="button" class="button" value="登录" onclick="toLogin()"></td>
		</center>
	</div>
	<div style="background: white-space;width: 50%;height: 100%;float: right">
		<center><h1 style="margin-top: 30px;">注册</h1>
		<form action="${pageContext.request.contextPath }/user_regist.action" method="post" id="myForm">
		<table>
		<tr style="height:40px">
				<td align="center"><span id="msg">欢迎您回来!!!</span></td>
			</tr>
			<tr style="height:40px">
				<td align="center"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">
					<h3 style="color: green"><s:actionmessage/><s:actionerror/></h3>
					<h3 style="color: green">${message }</h3>
				</td>
			</tr>
			<tr style="height:40px">
				<td align="center"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">
					
				</td>
			</tr>
			<tr style="height:60px">
				<td align="center"></td>
			</tr>
		</table>
		</form>
		</center>
	</div>
</div>
</body>
</html>