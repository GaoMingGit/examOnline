<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改密码</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<script type="text/javascript">

	function updatePwd(){
		var newPwd = $("#newpassword").val();
		if( newPwd == null || newPwd ==''){
			alert("新密码输入框不可为空");
			return false;
		}
		var url = "${pageContext.request.contextPath}/user_updateUserPwd.action";
		$.post(url,{newpassword:newPwd},function(data,status){
				if(data == 1){
					//如果data数据返回的是 1 ，代表用户修改密码成功
					setTimeout("right()", 1200);
					
				}else if(data == 2){
					//如果data数据返回的是 2 ，代表用户修改密码不成功
					setTimeout("wrong()", 1200);
				}				
		},"json");
	}
	
	function right(){
		alert("修改密码成功!!!请重新登录账号");
		window.location.href = "${pageContext.request.contextPath }/user/userlogin.jsp";
	}
	function wrong(){
		alert("修改密码失败");
	}
	
	function checkPwd(){
		var password = $("#password").val();
		if(password == null){
			alert("请输入您的原始密码");
			return false;
		}
		var url = "${pageContext.request.contextPath }/user_checkPwd.action";
		$.post(url,{password:password},function(data,status){
			if(data == 1){
				//如果data数据返回的是 1 ，代表用户输入原始密码错误
				$("#msg").html("<font color='green'>&nbsp;&nbsp;您输入的原始密码正确</font>");
				
			}else if(data == 2){
				//如果data数据返回的是 2 ，代表用户修改密码错误
				$("#msg").html("<font color='red'>&nbsp;&nbsp;您输入的原始密码错误</font>");
			}		
		});
	}
</script>
<style type="text/css">
.content1{
	margin-top:10px;
	overflow: hidden;
	background:#FFFFF0;
	height: 420px;
	overflow-y :auto;
	width: 100%;
	
}
.button {
	padding-left: 0!important;
	margin-left: 50px;
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
</style>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="centerdiv">
	<%@ include file="../menu.jsp" %>
	<center>
		<div class="content">
			<center><h2 style="color: grey">用户修改密码界面</h2></center>
			<div class="content1">
				<table border="1px;">
					<tr style="height: 60px;" >
							
					</tr>
					<tr style="height: 60px;" >
						<td style="width: 90px;" align="center">您当前的账号:</td>
						<td><input type="text" value="${exitUser.username }" readonly="readonly" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					</tr>
					<tr style="height: 60px;" >
						<td style="width: 90px;" align="center">原始密码(MD5加密):</td>
						<td><input type="password" id="password" name="password" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入原始密码" onblur="checkPwd()" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"><span id="msg"></span></td>
					</tr>
					<tr style="height: 60px;" >
						<td style="width: 90px;" align="center">新的密码:</td>
						<td><input type="password" name="newpassword" id="newpassword" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入新的密码" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					</tr>
					<tr style="height: 60px;" >
						<td style="width: 90px;" align="center"><input type="submit"  class="button" onclick="updatePwd()"  value="点击修改"></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</center>
</div>
</body>
</html>
