<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户考试信息确认页面</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<script type="text/javascript">
function doJudge(){//判断是否选中的自定义函数
	if(document.getElementById('ck').checked=true){//判断id为ck的复选框(input框)的状态是否是选中，假设是选中
	$("#btn").removeAttr("disabled");//如果是，移除id为btn的标签的disabled属性
	}
}
</script>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="centerdiv">
	<%@ include file="../menu.jsp" %>
	<center>
	<div class="content">
		<div style="margin-top: -40px;margin-left: -50px;height: 600px;" class="add">
			<div class="add_hd" align="left"><span>考生主要信息</span></div>
			<h3 style="color: green;margin-top: 15px;font-size: 25px;"><strong style="color: green">考生主要信息如下</strong></h3>
			<form action="${pageContext.request.contextPath }/exam_keMuExam.action" method="post" >
			<table style="margin-left: 15px;">
				<tr>
					<td style="width: 130px">随机考生号:</td>
					<td><input name="leibie" type="text" readonly="readonly"  value="${userNmber }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
				</tr>
				<tr>
					<td>账号名称:</td>
					<td><input name="username" type="text" readonly  value="${exitUser.username }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
					<td colspan="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
				<td>报考驾校:</td>
					<td><input name="school" type="text" readonly="readonly" value="${exitUser.school }" style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"></td>
				</tr>
				<tr>
					<td>考试协议:</td>
					<td colspan="3">
						<textarea style="resize:none;" rows="3" cols="60"
						 readonly="readonly">①本次考试力求达到最真实的考试效果，考生需要认真作答玩每一道题目。 ②考试过程时间为45分钟，考试满分100分，考生成绩达到90分以上(包含90分)，才算及格。③以上的个人信息如果无误请点击同意协议进行随机抽题考试。祝考生考试愉快！</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" ><input onclick="doJudge()" id="ck" name="queren" type="radio" value=""><font style="color: green">已阅读并同意以上的考试协议</font></a></td>
					<td colspan="2" align="center"><input type="radio" name="queren" value="" checked>不同意以上协议</a></td>
					
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input name="lei" type="hidden"  value="${lei }">
						<input id="btn" type="submit"  class="button"  value="随机抽题考试" disabled="disabled">
					</td>
				</tr>
			</table>
			</form>
		</div>
		</div>
	</center>
</div>
</body>
</html>
