<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录页面</title>
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
} </style>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function toRegist(){
		window.location.href = "${pageContext.request.contextPath }/user/userregist.jsp";
	}
	
	function checkUser(){
		var username = $("#username").val();
		var url = "${pageContext.request.contextPath}/user_checkName.action";
		$.post(url,{username:username},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，代表用户名不存在
					$("#msg").html("<font color='red'>&nbsp;&nbsp;用户名不存在，请注册</font>");
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表用户名已经存在，可以用
					$("#msg").html("<font color='green'>&nbsp;&nbsp;用户名存在，可登录</font>");
				}				
		},"json");
	}
	
	function login(){
		var username = $("#username").val();
		var password = $("#password").val();
		var myForm = document.getElementById("myForm");
		if(username == null || username == ''){
			alert("账号内容不能为空");
			return false;
		}
		if(password == null || password == ''){
			alert("密码内容不能为空");
			return false;
		}
		myForm.submit();
	}
</script>
</head>
<body style="background: #f1f5ea">
<center><h2>基于JAVA 的 SSH小车驾照文科在线模拟考试的web开发的用户登录页面</h2></center>
<div id="main">
	<div style="background: white-space;width: 50%;height: 100%;float: left">
		<center><h1 style="margin-top: 30px;">登录</h1>
		
		<form action="${pageContext.request.contextPath }/user_login.action" method="post" id="myForm"> 
		<table>
			<tr style="height:60px">
				<td align="center"><span id="msg">注册的账号登录</span> </td>
			</tr>
			<tr style="height:60px">
				<td align="center">
					<h3 style="color: red">${message }<s:actionmessage/></h3>
					<h3><a href="https://mail.qq.com/cgi-bin/loginpage" target="_blank">${jihou }</a></h3>
				</td>
			</tr>
			<tr style="height:60px">
				<td align="center">账号:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="username" name="username" placeholder="请输入账号(空格键无效)" style="width: 70%;height: 45px;background-color: #eeeeee" onblur="checkUser()"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">密码:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="password" id="password" name="password" placeholder="请输入密码(空格键无效)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center"><input type="button" class="button" value="登录" onclick="login()"></td>
			</tr>
		</table>
		</form>
		<a href="${pageContext.request.contextPath }/user/resetPwdUI.jsp" target="_blank">忘记密码?</a>
		</center>
	</div>
	<div style="background: #fd253e;width: 50%;height: 100%;float: right">
		<center>
			<h2 style="color: white;margin-top: 150px">您好！朋友</h2>
			<h3 style="color: white;margin-top: 20px">输入您的个人信息注册成为会员。</h3>
			<h3 style="color: white;margin-top: 20px">下一个老司机就是您!!!</h3>
			<td align="center"><input type="button" class="button" value="注册" onclick="toRegist()"></td>
		</center>
	</div>
</div>
</body>
</html>