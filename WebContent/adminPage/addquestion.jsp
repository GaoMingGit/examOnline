<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加试题</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<style type="text/css">
.radio {
	height: 25px;
	width: 25px;
}
</style>

<body>
<%@ include file="top.jsp" %>
<div class="centerdiv">
	<%@ include file="menu.jsp" %>
<div class="content">
		<div class="add" style="margin-top: -40px;">
			<div class="add_hd"><span>添加试题</span></div>
			<s:fielderror></s:fielderror>
			<form name="form" action="${pageContext.request.contextPath }/admin_save.action" method="post" enctype="multipart/form-data" id="myForm">
			<table>
				<tr>
					<td style="width: 70px;">试题题目:</td>
					<!-- style="width: 350px;height: 50px;padding-left: 20px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;" -->
					<td><input id="question" name="question" type="text" placeholder="请输入" style="width: 350px;border: 1px solid #ccc;height: 50px;"></td>
				</tr>
				<tr>
					<td style="width: 90px;">选项A内容:</td>
					<td><input onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="输入选项A内容(此处填写信息不能为空)" id="select_a" name="select_a" type="text" placeholder="请输入" style="width: 200px;border: 1px solid #ccc;height: 50px;"></td>
					<td style="width: 90px;">选项B内容:</td>
					<td><input onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="输入选项B内容(此处填写信息不能为空)" id="select_a" name="select_b" type="text" placeholder="请输入" style="width: 200px;border: 1px solid #ccc;height: 50px;"></td>
				</tr>
				<tr>
					<td style="width: 90px;">选项C内容:</td>
					<td><input onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="输入选项C内容(有就填写)" name="select_c" type="text" placeholder="请输入" style="width: 200px;border: 1px solid #ccc;height: 50px;"></td>
					<td style="width: 90px;">选项D内容:</td>
					<td><input onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="输入选项D内容(有就填写)" name="select_d" type="text" placeholder="请输入" style="width: 200px;border: 1px solid #ccc;height: 50px;"></td>
				</tr>
				<tr>
					<td style="width: 90px;">试题解释:</td>
					<td><textarea name="descc" rows="5" cols="40"></textarea></td>
					<td style="width: 90px;">上传图片(两兆以内):</td>
					<td><input name="upload" type="file" style="width: 200px;border: 1px solid #ccc;height: 50px;"></td>
				</tr>
				<tr>
					<td style="width: 90px;">题目答案:</td>
					<td><input class="radio" type="checkbox" name="answer" value="A">A
						<input class="radio" type="checkbox" name="answer" value="B">B
						<input class="radio" type="checkbox" name="answer" value="C">C
						<input class="radio" type="checkbox" name="answer" value="D">D
						<span><font style="color: red">(单选题的答案只勾选一个)</font></span>
					</td>
					<td style="width: 90px;">试题类型:</td>
					<td>
						<input class="radio" type="radio" name="cid" value="1">单选题 
						<input class="radio" type="radio" name="cid" value="2">判断题
						<input class="radio" type="radio" name="cid" value="3">多选题
						<span><font style="color: red">(必须选填)</font></span>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="button" value="添加试题" onclick="check()">
					<input type="reset"   class="button" value="重置"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	</div>
</body>
</html>