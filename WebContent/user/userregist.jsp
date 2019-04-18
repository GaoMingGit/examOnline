<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/regist.css">
<title>用户注册页面</title>
</head>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function post_check(){
		var username = $("#username").val();
		var url = "${pageContext.request.contextPath}/user_checkName.action";
		$.post(url,{username:username},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，代表用户名可以用
					$("#msg").html("<font color='green'>&nbsp;&nbsp;用户名可用</font>");
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表用户名已经存在，不可以用
					$("#msg").html("<font color='red'>&nbsp;&nbsp;用户名已被注册</font>");
				}				
		},"json");
	}
	
	function checkForm(){
		var myForm = document.getElementById("myForm");
		var username = $("#username").val();
		var password = $("#password").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		if(username == null || username == ''){
			alert("用户名不能为空");
			return false;
		}
		if(password == null || password == ''){
			alert("用户密码不能为空");
			return false;
		}
		if(email == null || email == ''){
			alert("用户邮箱不能为空");
			return false;
		}
		
		if(phone == null || phone == ''){
			alert("用户的联系电话不能为空");
			return false;
		}
		
		//验证手机号码格式
		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test($("#phone").val())) {
        	alert("用户的联系电话格式不正确");
            return false;
        }
        
        //验证邮箱格式
         var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
         if(!myreg1.test($("#email").val())){
            alert('提示\n\n请输入有效的E_mail！(邮箱格式不正确)');
            return false;
         }
        myForm.submit();
	}
	
	function toLogin(){
		window.location.href = "${pageContext.request.contextPath }/user/userlogin.jsp";
	}
</script>

<body>
<center><h2>基于JAVA 的 SSH小车驾照文科在线模拟考试的web开发的用户注册账号页面</h2></center>
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
				<td align="center"><span id="msg">仔细填好每一项内容哦</span></td>
			</tr>
			<tr style="height:40px">
				<td align="center">账号:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="username" name="username" onblur="post_check()" placeholder="请输入账号(空格键无效)" style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">密码:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="password" id="password" name="password" placeholder="请输入密码(空格键无效)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:40px">
				<td align="center">邮箱:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="email" name="email" placeholder="请输入可用的邮箱(可通过它找回密码)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:40px">
				<td align="center">电话:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="phone" name="phone" placeholder="请输入可用的联系电话(空格键无效)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">
					<input type="radio" name="school" value="富安驾校">富安驾校
					<input type="radio" name="school" value="平安驾校">平安驾校
					<input type="radio" name="school" value="汇通驾校">汇通驾校
					<input type="radio" name="school" value="广安驾校">广安驾校
					<input type="radio" name="school" value="其他">其他
				</td>
			</tr>
			<tr style="height:60px">
				<td align="center"><input type="button" class="button" value="注册" onclick="checkForm()"></td>
			</tr>
		</table>
		</form>
		</center>
	</div>
</div>
</body>
</html>