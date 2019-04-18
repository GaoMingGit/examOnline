<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.content1{
	margin-top:10px;
	overflow: hidden;
	background: #d2eefe;
	height: 420px;
	overflow-y :auto;
	width: 100%;
	
}
</style>
</head>
<script type="text/javascript">

	//根据id添加错题到错题集中
	function addWrong(qid){
		//var flag = confirm("您确定要将这道题目添加到错题集吗(添加后可以到错题集中查看)");
		if(true){
			var url = "${pageContext.request.contextPath }/exam_addWrong.action";
			$.post(url,{id:qid},function(data,status){
					if(data == 1){
						//如果data数据返回的是 1 ，代表用户名不存在
						//$("#msg").html("<font color='red'>&nbsp;&nbsp;用户名不存在，请注册</font>");
						setTimeout("tishi()", 500);
					}else if(data == 2){
						//如果data数据返回的是 2 ，代表用户名已经存在，可以用
						//$("#msg").html("<font color='green'>&nbsp;&nbsp;用户名存在，可登录</font>");
						setTimeout("tishi1()", 1000);
					}				
			},"json"); 
		//window.location.href = "${pageContext.request.contextPath }/user_addWrong.action?qid="+qid;
		}
	}
	
	//提示1
	function tishi(){
		alert("成功添加错题，您可以到菜单栏的历史集中中的错题集查看错题");
	}
	//提示2
	function tishi1(){
		alert("不好意思此操作失败");
	}
</script>
<body>
<%@ include file="../top.jsp" %>
<div class="centerdiv">
<%@ include file="../menu.jsp" %>
	<div class="content">
		<h5>
			<font color='red'>用户刚刚模拟考试的错题集合一览表</font>
		</h5>
		<strong>一、用户刚刚模拟考试的错题集合一览表</strong>
		<div class="content1">
		<div style="width: 78%;">
		<%-- <form action="${pageContext.request.contextPath }/user_checkAnswer.action" method="post"> --%>
		<c:forEach items="${wrongList }" var="questionBean">
			<table  style="margin-left: 20px;">
				<tr>
					<td colspan="3">
					第${questionBean.number }题:&nbsp;<font id ="${questionBean.number }" color="red">
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
							您的答案:&nbsp;&nbsp;&nbsp;<font style="color: red">
							<c:if test="${questionBean.userWrongAnswer == null}">您此题不作答</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${questionBean.userWrongAnswer != null}">${questionBean.userWrongAnswer }</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<input type="button" class="button" value="添加到错题集" onclick="addWrong('${questionBean.qid}')">
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