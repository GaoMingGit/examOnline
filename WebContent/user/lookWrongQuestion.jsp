<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错题集</title>
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
.content1{
	margin-top:10px;
	overflow: hidden;
	background:#FFFFF0;
	height: 420px;
	overflow-y :auto;
	width: 100%;
	
}
</style>
</head>
<script type="text/javascript">
	function remove(){
		alert("啊哈哈哈~~~~~此功能有待开发!!!");
	}
</script>
<body>
<%@ include file="../top.jsp" %>
<div class="centerdiv">
<%@ include file="../menu.jsp" %>
	<div class="content">
		<h5>
			<font color='red'>${exitUser.username }</font>用户历史错题集合一览表
		</h5>
		<strong>一、用户错历史题集合一览表</strong>
		<div class="content1">
		<div style="width: 78%;">
		<c:if test="${size == 0 }">
			
			<center><h2 style="color:#FF7F24;margin-top: 60px; ">检测到您先前没添加有错题喔~~~~~~~建议您去模拟考试然后添加错题喔~~~</h2></center>
		</c:if>
		<c:forEach items="${wrongQuestionBeanList }" var="questionBean">
			<table  style="margin-left: 20px;">
				<tr>
					<td colspan="3">
					错题题号:${questionBean.qid }:&nbsp;<font id ="${questionBean.qid }" color="red">
					<c:if test="${questionBean.cid !='3' }">(单选题)</c:if>
					<c:if test="${questionBean.cid =='3' }">(多选题)</c:if>
					</font>:${questionBean.question }
					</td>
				</tr>
				
					<tr>
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.${questionBean.select_a }</td>
						<c:if test="${questionBean.imagepath != null }">
							<td rowspan="3"> <img alt="" src="${pageContext.request.contextPath }/${questionBean.imagepath}" style="height: 200px;width: 200px;"></td>
						</c:if>
					</tr>
					<tr>
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B.${questionBean.select_b }<br></td>
					</tr>
					<c:if test="${questionBean.select_c !='' }">
						<tr>
							<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C.${questionBean.select_c }</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D.${questionBean.select_d }</td>
						</tr>
					</c:if>
					
					<tr>
						<td colspan="2">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正确答案:&nbsp;&nbsp;&nbsp;<font style="color: green">${questionBean.answer }</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							您当时作答的答案:&nbsp;&nbsp;&nbsp;<font style="color: red">
							<c:if test="${questionBean.userWrongAnswer == null}">您此题不作答</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${questionBean.userWrongAnswer != null}">${questionBean.userWrongAnswer }</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<input type="button" class="button" value="移除错题集" onclick="remove()">
						</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;试题解释:<font style="color: red">${questionBean.descc }</font><br><hr></td>
					</tr>
			</table>
		</c:forEach>
		<!-- </form> -->
		</div>
	</div>
	</div>
	</div>
</body>
</html>