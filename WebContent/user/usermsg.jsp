<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息显示页面</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="centerdiv">
	<%@ include file="../menu.jsp" %>
	<center>
		<div class="content">
			<div style="margin-top: -40px;margin-left: -50px;height: 600px;" class="add">
			<div class="add_hd" align="left"><span>用户主要信息</span></div>
			<h2><font style="color: #3A5FCD">${exitUser.username }&nbsp;&nbsp;&nbsp;</font>您的主要信息如下</h2>
			<h3 style="color: green;margin-top: 15px">注意:<strong style="color: red">此页面数据处于不可编辑状态</strong>&nbsp;</h3>
			<form action="${pageContext.request.contextPath }/user_toUserMessageUI.action" method="post" 
			 enctype="multipart/form-data">
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
					<td><input name="phone" type="text" readonly="readonly" value="${exitUser.phone }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
				</tr>
				<tr>
				<td>电子邮箱:</td>
					<td><input name="phone" type="text" readonly="readonly" value="${exitUser.email }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注册账号时间&nbsp;&nbsp;&nbsp;</td>
					<td><input name="idnumber" type="text" value="${exitUser.registtime }" readonly="readonly" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
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
					<td colspan="2" align="center"><input type="submit"  class="button"  value="进入修改状态">
				</tr>
			</table>
			</form>
		</div>
	
	</div>
	</center>
	</div>
</body>
</html>
