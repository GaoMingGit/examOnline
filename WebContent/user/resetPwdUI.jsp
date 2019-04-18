<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/regist.css">
<title>用户重置密码页面</title>
</head>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function post_check(){
		var username = $("#username").val();
		var url = "${pageContext.request.contextPath}/user_checkName.action";
		$.post(url,{username:username},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，代表用户名可以用
					$("#msg").html("<font color='red'>&nbsp;&nbsp;用户账号不存在，不可找回密码</font>");
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表用户名已经存在，表示可以找回密码
					$("#msg").html("<font color='green'>&nbsp;&nbsp;用户账号存在，可以找回密码</font>");
				}				
		},"json");
	}
	
	function checkForm(){
		var myForm = document.getElementById("myForm");
		var username = $("#username").val();
		var password = $("#password").val();
		var email = $("#email").val();
		var emailcode = $("#emailcode").val();
		if(username == null || username == ''){
			alert("用户账号输入框内容不能为空");
			return false;
		}
		if(email == null || email == ''){
			alert("用户邮箱输入框内容不能为空");
			return false;
		}
		
		if(emailcode == null || emailcode == ''){
			alert("邮箱验证码输入框内容不能为空");
			return false;
		}
		
        //验证邮箱格式
         var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
         if(!myreg1.test($("#email").val())){
            alert('提示\n\n请输入有效的E_mail！(邮箱格式不正确)');
            return false;
         }
         
         if(password == null || password == ''){
 			alert("用户新密码输入框内容不能为空");
 			return false;
 		}
        myForm.submit();
	}
	
	function toLogin(){
		window.location.href = "${pageContext.request.contextPath }/user/userlogin.jsp";
	}
	
	//异步校验用户输入的邮箱是否存在
	function checkEmail(){
		var email = $("#email").val();
		var username = $("#username").val();
		//验证邮箱格式
        var myreg1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg1.test($("#email").val())){
           alert('提示\n\n请输入有效的E_mail！(邮箱格式不正确)');
           return false;
        } 
        if(username == null || username == ''){
			alert("用户账号输入框内容不能为空");
			return false;
		}
		var url = "${pageContext.request.contextPath}/user_checkEmail.action";
		$.post(url,{email:email,username:username},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，代表用户邮箱存在
					$("#msg").html("<font color='green'>&nbsp;&nbsp;用户邮箱存在，可以接收到邮箱验证码</font>");
					//并发送邮件到邮箱中
					setTimeout("sendEmailCode()", 1500);
					
					return ;
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表用户邮箱不存在
					$("#msg").html("<font color='red'>&nbsp;&nbsp;<strong>用户邮箱不存在，接收不到邮箱验证码喔!!!</strong></font>");
				}				
		},"json");
	}
	
	//调用发送邮件的方法
	function sendEmailCode(){
		var url = "${pageContext.request.contextPath}/user_sendEmailCode.action?";
		$.post(url,function(data,status){
			if(data == 1){
				//如果data数据返回的是 1 ，代表用户邮箱村存在
				//$("#msg").html("<font color='green'>&nbsp;&nbsp;邮箱验证码发送成功</font>");
				alert("邮箱验证码发送成功,快快登录邮箱查看验证码");
			}else if(data == 2){
				//如果data数据返回的是 2 ，代表用户邮箱村不存在
				/* $("#msg").html("<font color='red'>&nbsp;&nbsp;<strong>用户邮箱不存在，接收不到邮箱验证码喔</strong></font>"); */
				alert("验证码邮件发送失败，后方正在抢修发送邮件的服务器，请稍后再操作");
			}				
	},"json");
	}
	
	//点击前往邮箱获取邮箱验证码
	function openEmail(){
		window.open("//mail.qq.com/cgi-bin/loginpage");
	}
</script>

<body>
<center><h2>小车驾照文科在线模拟考试系统重置密码页面</h2></center>
<div id="main">
<div style="background: #fd253e;width: 50%;height: 100%;float: left">
		<center>
			<h2 style="color: white;margin-top: 150px">您好！朋友</h2>
			<h3 style="color: white;margin-top: 20px">忘记密码不可怕，通过邮箱验证码找回来</h3>
			<h3 style="color: white;margin-top: 20px">轻松重置登录密码</h3>
			<h3 style="color: white;margin-top: 20px">邮箱验证码发送成功点击这里喔!!!</h3>
			<input type="button" class="button" value="登录邮箱" onclick="openEmail()">
		</center>
	</div>
	<div style="background: white-space;width: 50%;height: 100%;float: right">
		<center><h1 style="margin-top: 30px;">重置密码</h1>
		<form action="${pageContext.request.contextPath }/user_resetUserPwd.action" method="post" id="myForm">
		<table>
		<tr style="height:40px">
				<td align="center"><span id="msg">仔细填好每一项内容哦</span></td>
			</tr>
			<tr style="height:40px">
				<td align="center">账&nbsp;号:&nbsp;&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="username" name="username" onblur="post_check()" placeholder="请输入要找回密码的账号" style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:40px">
				<td align="center">邮&nbsp;箱:&nbsp;&nbsp;<input onblur="checkEmail()" onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" id="email" name="email" placeholder="请输入您注册账号的邮箱(接收邮箱验证码)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">验证码:&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="text" onblur="checkEmailCode()" id="emailcode" name="emailcode" placeholder="请输入收到的邮箱验证码(几秒钟内到达)"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center">新密码:&nbsp;<input onkeyup="this.value=this.value.replace(/\s+/g,'')" type="password" id="password" name="password" placeholder="请输入账号新密码"style="width: 70%;height: 45px;background-color: #eeeeee"></td>
			</tr>
			<tr style="height:60px">
				<td align="center"><input type="button" class="button" value="重置密码" onclick="checkForm()"></td>
			</tr>
		</table>
		</form>
		</center>
	</div>
</div>
</body>
</html>