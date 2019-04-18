<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息修改页面</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="centerdiv">
	<%@ include file="../menu.jsp" %>
	<center>
		<div class="content">
			<div style="margin-top: -40px;margin-left: -50px;height: 600px;" class="add">
			<div class="add_hd" align="left"><span>用户主要信息</span></div>
			<h3 style="color: green;margin-top: 15px">注意:<strong style="color: red">用户类型、账号名称、注册账号时间 </strong>&nbsp;这三项信息不可更改(处于不可编辑状态)</h3>
			<form action="${pageContext.request.contextPath }/user_updateUser.action" method="post" 
			 enctype="multipart/form-data" id="myForm">
			<table style="margin-left: 15px;">
				<tr>
					<td style="width: 130px">用户类型:</td>
					<td><input name="leibie" type="hidden" value="2">
					<input type="text" readonly="readonly" value="一般普通用户" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
				</tr>
				<tr>
					<td>账号名称:</td>
					<td><input name="username" type="text" readonly="readonly" value="${exitUser.username }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${exitUser.imagepath == null }"> 
						<img alt="" src="picture/noheader.jpg" style="width: 188px;height: 188px">						
						</c:if> 
						 <c:if test="${exitUser.imagepath != null }"> 
						<img id="img" alt="" src="${pageContext.request.contextPath }/${exitUser.imagepath}"
						style="width: 188px;height: 188px">
						</c:if> 
					</td>
				</tr>
				<tr>
				<td>联系电话:</td>
					<td><input name="phone" type="text" value="${exitUser.phone }" placeholder="此处填写信息不能为空" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更换头像:&nbsp;&nbsp;&nbsp;</td>
					<td><input name="upload" type="file" placeholder="有则上传，无则忽略此空不理" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;">图片大小两M以内</td>
				</tr>
				<tr>
				<td>电子邮箱:</td>
					<td><input name="email" type="text" value="${exitUser.email }" placeholder="此处填写信息不能为空" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注册账号时间&nbsp;&nbsp;&nbsp;</td>
					<td><input name="registtime" type="text" readonly="readonly" value="${exitUser.registtime }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
				</tr>
				<tr>
					<td>报考驾校:</td>
					<td>
					<input class="radio" type="radio" name="school" value="富安驾校"
						<c:if test="${exitUser.school == '富安驾校' }">checked</c:if>
					>富安驾校
						<input class="radio" type="radio" name="school" value="广安驾校"
							<c:if test="${exitUser.school == '广安驾校' }">checked</c:if>
						>广安驾校
						<input class="radio" type="radio" name="school" value="平安驾校"
							<c:if test="${exitUser.school == '平安驾校' }">checked</c:if>
						>平安驾校
						<input class="radio" type="radio" name="school" value="汇通驾校"
							<c:if test="${exitUser.school == '汇通驾校' }">checked</c:if>
						>汇通驾校
						<input class="radio" type="radio" name="school" value="全通驾校"
							<c:if test="${exitUser.school == '全通驾校' }">checked</c:if>
						>全通驾校
						<input class="radio" type="radio" name="school" value="其他驾校"
							<c:if test="${exitUser.school == '其他驾校' }">checked</c:if>
						>其他驾校
					
					</td>
					<td colspan="2" align="center"><input type="submit"  class="button"  value="提交修改信息">
				</tr>
			</table>
			</form>
		</div>
	
	</div>
	</center>
	</div>
</body>
</html>
