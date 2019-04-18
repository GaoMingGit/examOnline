<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模拟考试模式</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<link rel="stylesheet" href="../css/exam.css">
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
$(function(){
	$(document).click(function(e) { // 在页面任意位置点击而触发此事件
		var id = $(e.target).attr("id"); 
		  $("."+id).css("background-color","#04cafc");// e.target表示被点击的目标
	});
});
$(function(){
	setInterval("jishi()", 1000);
})
/* 设置考试时间是45分钟 */
var maxTime = 60*45;
function jishi(){
	if(maxTime>=0){ 
		var minutes = Math.floor(maxTime / 60);
		var seconds  = Math.floor(maxTime % 60);
		msg = "距离模拟考试结束还有"+minutes+"分"+seconds+"秒";  
		$("#span").html("<font color='red'>&nbsp;考试倒计时:&nbsp;</font>"+minutes+"分"+seconds+"秒");
		/* 当考试倒计时剩下5分钟时，提醒用户剩余时间 */
		if( maxTime == 5*60){
			alert("离模拟考试结束时间还有5分钟，请加紧时间作答题目");
		}
		--maxTime;
	}	
}
function doSubmitForm(){
	var flag = confirm("交卷之前先看看答题卡号是否所有的题目都作答完毕了???您确定要交卷吗???");
	var form = document.getElementById("myForm");
	if(flag){
		form.submit();
	}
}
</script>
<body>
<%@ include file="../top.jsp" %>
<div class="centerdiv">
<%@ include file="../menu.jsp" %>
	<div class="daojishi">
		<span id="span"><font >考试倒计时<font>:45分钟0秒</font></font></span>
	</div>
	<div class="content">
	<c:if test="${num =='4' }">
		<h5>
			小车文科科目四模拟考试<font color='red'>(模拟考试)</font>
		</h5>
		</c:if>
		<c:if test="${num =='1' }">
		<h5>
			小车文科科目一模拟考试<font color='red'>(模拟考试)</font>
		</h5>
		</c:if>
		<strong>一、选择题(每题5分，共20题，满分100分)<font color='red'>---每一道题都必须作答</font></strong>
		<div class="content1">
		<div style="width: 220px;height: 220px;background: #f1f5ea;position: fixed;margin-left: 60%;margin-top:2px;">
			<center>
			<h2>题号卡</h2>
				<ul>
				<c:forEach begin="1" end="20" var="num" step="1">
					<li class="ti${num }"><a href="#${num }" style="font-size: 28px; line-height: 28px;color: grey">${num }</a></li>
				</c:forEach>
				</ul>
			</center>
		</div>
		<!-- <input type="button" class="button" value="上一题" style="margin-top:300px;position: fixed;margin-left: 1%">
		<input type="button" class="button" value="下一题" style="margin-top:300px;position: fixed;margin-left: 18%"> -->
		<input type="button" class="button" value="交卷" style="margin-top:300px;position: fixed;margin-left: 35%" onclick="doSubmitForm()">
		<div style="width: 78%;">
		<form action="${pageContext.request.contextPath }/exam_checkAnswer.action" method="post" id="myForm">
		<c:forEach items="${questionList }" var="questionBean">
			<table>
				<tr>
					<td colspan="3">
					第${questionBean.number }题:&nbsp;<font id ="${questionBean.number }" color="red">
					<c:if test="${questionBean.cid !='3' }">(单选题)</c:if>
					<c:if test="${questionBean.cid =='3' }">(多选题)</c:if>
					</font>:${questionBean.question }
					</td>
				</tr>
				
				<c:if test="${questionBean.cid =='3' }">
					<tr>
						<td colspan="2"><input type="checkbox" id="ti${questionBean.number }" name="${questionBean.qid }" value="A">A.${questionBean.select_a }</td>
						<c:if test="${questionBean.imagepath != null }">
							<td rowspan="3"> <img alt="" src="${pageContext.request.contextPath }/${questionBean.imagepath}" style="height: 200px;width: 200px;"></td>
						</c:if>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox" id="ti${questionBean.number }" name="${questionBean.qid }" value="B">B.${questionBean.select_b }<br></td>
					</tr>
						<tr>
							<td colspan="3"><input type="checkbox" id="ti${questionBean.number }" name="${questionBean.qid }" value="C" >C.${questionBean.select_c }</td>
						</tr>
						<tr>
							<td colspan="3"><input type="checkbox" id="ti${questionBean.number }" name="${questionBean.qid }" value="D">D.${questionBean.select_d }</td>
						</tr>
				</c:if>
				
				<!-- 当题目类型不是 “3”(不是多选题的时候) 页面显示是单选的按钮 -->
				<c:if test="${questionBean.cid !='3' }">
					<tr>
						<td colspan="2"><input type="radio" id="ti${questionBean.number }" name="${questionBean.qid }" value="A">A.${questionBean.select_a }</td>
						<c:if test="${questionBean.imagepath != null }">
							<td rowspan="3"> <img alt="" src="${pageContext.request.contextPath }/${questionBean.imagepath}" style="height: 200px;width: 200px;"></td>
						</c:if>
					</tr>
					<tr>
						<td colspan="2"><input type="radio" id="ti${questionBean.number }" name="${questionBean.qid }" value="B">B.${questionBean.select_b }<br></td>
					</tr>
					<c:if test="${questionBean.select_c !='' }">
						<tr>
							<td colspan="3"><input type="radio" id="ti${questionBean.number }" name="${questionBean.qid }" value="C" >C.${questionBean.select_c }</td>
						</tr>
						<tr>
							<td colspan="3"><input type="radio" id="ti${questionBean.number }" name="${questionBean.qid }" value="D">D.${questionBean.select_d }</td>
						</tr>
					</c:if>
				</c:if>
			</table>
		</c:forEach>
		</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
