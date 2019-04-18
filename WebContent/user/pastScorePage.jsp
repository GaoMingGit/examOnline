<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史成绩</title>
<link rel="stylesheet" href="../css/list.css">
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
</head>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
</script>
<style>
tr:hover {
	background:yellow;
	}
</style>
<body>
<%@ include file="../top.jsp" %>
<div class="centerdiv">
<%@ include file="../menu.jsp" %>
<div class="content">
	
	<center><h2><strong style="color: green">${exitUser.username }</strong>&nbsp;&nbsp;&nbsp;前十条历史成绩记录如下</h2></center>
		<div class="table">
		<div class="studenttable" >
			<table cellpadding="0" cellspacing="0" style="margin-left: 0px;margin-top: 0px" border="1px">
					<tr style="background-color: grey">
						<td align="center" style="width: 120px">用户账号(名称)</td>
						<td align="center">测试得分(5分/道)</td>
						<td align="center">对题(道)</td>
						<td align="center">错题(道)</td>
						<td align="center">测试时间</td>
					</tr>
				<c:if test="${size == 0}">
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
						<tr align="center">
							<td colspan="7">
							<h2 style="font-size: 25px">当前检测到你还没有历史成绩的记录喔，快前去模拟考试体验一把！！！</h2>
							</td>
						</tr>
				</c:if>
				<c:if test="${size != 0}">
					<c:forEach items="${pastScoreList }" var="past">
						<tr align="center">
							<td width="20px">${past.user.username }</td>
							<td><strong style="color: green">${past.score }</strong>&nbsp;&nbsp;分</td>
							<td>做对&nbsp;&nbsp;<strong style="color: green">${past.righttotal }</strong>&nbsp;&nbsp;道</td>
							<td>做错&nbsp;&nbsp;<strong style="color: red">${past.wrongtotal }</strong>&nbsp;&nbsp;道</td>
							<td>${past.examtime }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	</div>
	</div>
</body>
</html>