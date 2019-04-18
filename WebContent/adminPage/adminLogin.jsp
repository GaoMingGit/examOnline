<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录页面</title>
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
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	
	function checkUser(){
		var adminname = $("#adminname").val();
		var url = "${pageContext.request.contextPath}/admin_checkName.action";
		$.post(url,{adminname:adminname},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，管理员账号存在
					$("#msg").html("<font color='green'>&nbsp;&nbsp;管理员账号存在，可登录</font>");
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表管理员账号不存在
					$("#msg").html("<font color='red'>&nbsp;&nbsp;管理员账号不存在，不可登录</font>");
				}				
		},"json");
	}
	
	function login(){
		var adminname = $("#adminname").val();
		var adminpassword = $("#adminpassword").val();
		var myForm = document.getElementById("myForm");
		if(adminname == null || adminname == ''){
			alert("管理员账号输入框内容不能为空");
			return false;
		}
		if(adminpassword == null || adminpassword == ''){
			alert("管理员密码输入框内容不能为空");
			return false;
		}
		//myForm.submit();
		var url = "${pageContext.request.contextPath }/admin_adminLogin.action";
		$.post(url,{adminname:adminname,adminpassword:adminpassword},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，登录成功
					alert("管理员登录成功");
					window.location.href = "${pageContext.request.contextPath }/admin_toIndexUI.action";
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表登录失败
					$("#msg").html("<font color='red'>&nbsp;&nbsp;管理员账号或者密码错误，登录失败</font>");
					alert("管理员账号或者密码错误，登录失败");
				}				
		},"json");
	}
</script>
</head>
<body style="background: #f1f5ea">
<center><h2>基于JAVA 的 SSH小车驾照文科在线模拟考试的web开发 后台管理员登录页面</h2></center>
<div id="main" style="background-color: #FFFFE0">
	<div style="background: white;width: 50%;height: 100%;border: 1px white solid;margin: auto;">
		<center><h1 style="margin-top: 30px;">管理员账号登录</h1>
		
		<form action="${pageContext.request.contextPath }/admin_adminLogin.action" method="post" id="myForm"> 
		<table>
			<tr style="height:60px">
				<td align="center"><span id="msg">管理员账号登录</span> </td>
			</tr>
			<tr style="height:60px">
				<td align="center">
					<h3 style="color: red">
					${message1 }
					<s:actionmessage/>
					</h3>
				</td>
			</tr>
			<tr style="height:60px">
				<td align="center">账号:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="adminname" name="adminname" placeholder="请输入账号(空格键无效)" style="width: 70%;height: 45px;background-color: #eeeeee" onblur="checkUser()"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">密码:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="password" id="adminpassword" name="adminpassword" placeholder="请输入密码(空格键无效)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center"><input type="button" class="button" value="登录" onclick="login()"></td>
			</tr>
		</table>
		</form>
		</center>
	</div>
</div>
</body>
</html>