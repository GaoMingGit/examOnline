<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改试题</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<style type="text/css">
.radio {
	height: 25px;
	width: 25px;
}
</style>
<script type="text/javascript">
	function show(){
		var flag = confirm("你确定要提交该图片吗???");
		if(flag){
			return true;
		}else{
			return false;
		}
	}
</script>
<body>
<%@ include file="top.jsp" %>
	<%@ include file="menu.jsp" %>
<div class="content">
		<div class="add" style="margin-left: -30px;margin-top: -40px;">
			<div class="add_hd"><span>修改试题</span></div>
			<form action="${pageContext.request.contextPath }/AdminFindAllServlet?method=7&id=${questionBean.qid}&imagepath=${questionBean.imagepath}" method="post" 
			 enctype="multipart/form-data">
			<table>
				<tr>
					<td>试题题目:</td>
					<td>
					<input name="question" type="text" value="${questionBean.question }" style="width: 350px;border: 1px solid #ccc;height: 50px;"></td>
				</tr>
				<tr>
					<td style="width: 90px;">选项A内容:</td>
					<td><input name="select_a" type="text" value="${questionBean.select_a }" style="width: 350px;border: 1px solid #ccc;height: 50px;"></td>
					<td style="width: 90px;">选项B内容:</td>
					<td><input name="select_b" type="text" value="${questionBean.select_b }"  style="width: 350px;border: 1px solid #ccc;height: 50px;"></td>
					<c:if test="${questionBean.imagepath != null }">
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img alt="" src="${pageContext.request.contextPath }/${questionBean.imagepath}" height="150px" width="150px"></td>
					</c:if>
				</tr>
				<c:if test="${questionBean.select_c !='' }">
					<tr>
						<td style="width: 90px;">选项C内容:</td>
						<td><input name="select_c" type="text" value="${questionBean.select_c }" style="width: 350px;border: 1px solid #ccc;height: 50px;"></td>
						<td style="width: 90px;">选项D内容:</td>
						<td><input name="select_d" type="text" value="${questionBean.select_d }" style="width: 350px;border: 1px solid #ccc;height: 50px;"></td>
					</tr>
				</c:if>
				<tr>
					<td style="width: 90px;">试题解释</td>
					<td><textarea name="descc" rows="5" cols="40">${questionBean.descc }</textarea></td>
					<td style="width: 90px;">更改图片:</td>
					<td><input name="imagepath" type="file" placeholder="有则上传，无则忽略此空不理" ></td>
				</tr>
				<tr>
					<td style="width: 90px;">题目答案</td>
					<td><input class="radio" type="checkbox" name="answer" value="A"
						<c:if test="${fn:contains(questionBean.s,'A') }">checked</c:if>
					>A
						<input class="radio" type="checkbox" name="answer" value="B"
							<c:if test="${fn:contains(questionBean.s,'B') } }">checked</c:if>
						>B
						<input class="radio" type="checkbox" name="answer" value="C"
							<c:if test="${fn:contains(questionBean.s,'C') } }">checked</c:if>
						>C
						<input class="radio" type="checkbox" name="answer" value="D"
							<c:if test="${fn:contains(questionBean.s,'D') } }">checked</c:if>
						>D
					</td>
					<td style="width: 90px;">试题类型</td>
					<td>
						<input class="radio" type="radio" name="cid" value="1"
							<c:if test="${questionBean.cid == '1' }">checked</c:if>
						>单选题 
						<input class="radio" type="radio" name="cid" value="2"
							<c:if test="${questionBean.cid == '2' }">checked</c:if>
						>判断题
						<input class="radio" type="radio" name="cid" value="3"
							<c:if test="${questionBean.cid == '3' }">checked</c:if>
						>多选题
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"  class="button"  value="修改试题">
					<input type="reset"   class="button" value="重置"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>