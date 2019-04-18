<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>练习模式</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<link rel="stylesheet" href="../css/exercise.css">
<link rel="stylesheet" href="../css/timu.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<style type="text/css">
.radio {
	height: 25px;
	width: 25px;
	margin-left: 20px;
	margin-right: 5px;
	vertical-align: middle; /*文字单选按钮垂直居中对齐*/
}

</style>
</head>
<script type="text/javascript">
</script>
<body>
<%@ include file="../top.jsp" %>
<div class="centerdiv">
<%@ include file="../menu.jsp" %>
	<div class="content">
		<h5>
			考试作答详情页面
		</h5>
		<div class="content1">
			<table border="1px;">
				<tr>
					<td colspan="1">
						<center>欢迎&nbsp;&nbsp;<font style="color: blue;font-size: 18px;">${exitUser.username }</font>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>本次考试时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: blue;font-size: 18px;">${pastScoreBean.examtime }</font></span></center>
					</td>
				</tr>
				
				<c:if test="${pastScoreBean.score == 100}">
					<tr>
						<td colspan="3">
						<center>你的总分是:<font style="color: green;font-size: 18px;">
						${pastScoreBean.score }</font>&nbsp;&nbsp;&nbsp;&nbsp;
						其中答对题目:&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: green;font-size: 18px;">${pastScoreBean.righttotal }</font>&nbsp;&nbsp;&nbsp;&nbsp;条&nbsp;&nbsp;&nbsp;&nbsp;
						答错题目:&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: red;font-size: 18px;">${pastScoreBean.wrongtotal }</font>&nbsp;&nbsp;&nbsp;&nbsp;条
						</center></td>
					</tr>
					<tr>
						<td colspan="3">
							<center><font style="color: green">您可以在左边菜单栏中选择继续模拟考试喔!!!</font></center>
						</td>
					</tr>
				</c:if>
				<c:if test="${pastScoreBean.score != 100}">
					<tr>
						<td colspan="3">
						<center>你的总分是:<font style="color: green;font-size: 18px;">
						${pastScoreBean.score }</font>&nbsp;&nbsp;&nbsp;&nbsp;
						其中答对题目:&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: green;font-size: 18px;">${pastScoreBean.righttotal }</font>&nbsp;&nbsp;&nbsp;&nbsp;条&nbsp;&nbsp;&nbsp;&nbsp;
						答错题目:&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: red;font-size: 18px;">${pastScoreBean.wrongtotal }</font>&nbsp;&nbsp;&nbsp;&nbsp;条
						</center></td>
					</tr>
					<tr>
						<td colspan="3">
							<center><a href="${pageContext.request.contextPath }/exam_lookWrong.action" style="color: blue">--->点击前往查看本次考试错题集页面</a></center>
						</td>
					</tr>
					
					<tr>
						<td colspan="3">
							<center>*************注意:当且仅当您的本次测试得分为100分，以上链接点击为空白页*************</center>
						</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					</c:if>
				</table>
		</div>
		</div>
	</div>
</body>
</html>