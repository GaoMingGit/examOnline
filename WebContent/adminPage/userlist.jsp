<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找页面</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<link rel="stylesheet" href="../css/list.css">
<script type="text/javascript"> 

	//根据账号id具体查找
	function findByUserID(){
		var userID = $("#uid").val();
		var myForm = document.getElementById("myForm");
		myForm.submit();
	} 
	//根据账号模糊查找
	 function findByUserName(){
		 var username = $("#username").val();
		 var myForm = document.getElementById("myForm");
		 myForm.submit();
	} 
	//根据用户账号是否激活查找
	function fingByState(){
		var userState = $("#state").val();
		var myForm = document.getElementById("myForm");
		myForm.submit();
	}
</script>
</head>
<body>
<%@ include file="top.jsp" %>
<div class="centerdiv">
	<%@ include file="menu.jsp" %>
<!-- 快速导航栏部分 -->
	<div class="shortcut">
		<s></s>
	</div>
	<div class="content">
	<div class="find">
		<form action="${pageContext.request.contextPath }/adminDouser_findAllUser.action" id="myForm" method="post">
		<input type="text" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="输入用户账号ID" id="uid" name="uid" style="width: 150px;height: 50px;margin-left: 40px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;">
			<button onclick="findByUserID()">按用户账号ID查找</button>&nbsp;
			<input type="text" onkeyup="this.value=this.value.replace(/\s+/g,'')" id="username" placeholder="输入用户模糊账号" name="username" style="width: 150px;height: 50px;margin-left: 40px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;">
			<button onclick="findByUserName()">按用户账号查找</button>&nbsp;
			按用户状态
			<select  id="state" name="state" onchange="fingByState()">
				<option value="">---请选择---</option>
				<option value="1">激活状态</option>
				<option value="0">没激活状态</option>
			</select>
			<span>
				
			</span>
		</form>	
			
<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
	</div>
	<div class="table" style="margin-top: 70px;width: 100%;">
		<div class="studenttable" >
			<table cellpadding="0" cellspacing="0" >
					<thead>
						<td align="center" style="width: 60px;">账号ID</td>
						<td align="center">用户头像</td>
						<td align="center">用户账号</td>
						<td align="center">用户邮箱</td>
						<td align="center">用户报考驾校</td>
						<td align="center">用户联系电话</td>
						<td align="center">注册(开户)时间</td>
						<td align="center">用户状态</td>
					</thead>
					<c:forEach items="${pageBean.list }" var="userBean">
					<tr align="center" style="height: 60px;">
						<td width="20px" style="cursor:pointer "><strong style="color:blue">${userBean.uid }</strong></td>
						<td>
							<c:if test="${userBean.imagepath == null }">
								<img alt="图片正在加载" src="${pageContext.request.contextPath }/picture/noheader.jpg" style="height: 95%;width: 50%;">
							</c:if>
							<c:if test="${userBean.imagepath != null }">
								<img alt="图片正在加载" src="${pageContext.request.contextPath }/${userBean.imagepath}" style="height: 95%;width: 50%;">
							</c:if>
						</td>
						<td >${userBean.username }</td>
						<td >${userBean.email }</td>
						<td >${userBean.school }</td>
						<td >${userBean.phone }</td>
						<td >${userBean.registtime }</td>
						<td>
							<c:if test="${userBean.state == 1 }">已激活</c:if>
							<c:if test="${userBean.state == 0 }">没激活</c:if>
						</td>
						<td>
						</td>
							<td align="center">
							</td>
					</tr>
					</c:forEach>
			<tr>
  	<td colspan="10" align="center">
  	第<strong style="color: red">${pageBean.currentPage}</strong>页 / 总共<strong style="color: red">${pageBean.totalPage}</strong>页&nbsp;&nbsp;
  	每一页显示<strong style="color: red">${pageBean.pageSize }</strong>条&nbsp;&nbsp;&nbsp;
  	总记录数<strong style="color: red">${pageBean.totalCount }</strong>条
    		<c:if test="${pageBean.currentPage !=1 }">
    		<a href="${pageContext.request.contextPath}/adminDouser_findAllUser.action?currentPage=1&pageSize=${pageBean.pageSize }"><strong style="color: green">首页</strong></a>
    		<a href="${pageContext.request.contextPath}/adminDouser_findAllUser.action?currentPage=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize }"><strong style="color: green">上一页</strong></a>
			  		</c:if>
			  		<c:forEach begin="1" end="${pageBean.totalPage }" var="pagenum">
			  			<c:if test="${pageBean.currentPage == pagenum }">
			  				${pagenum }
			  			</c:if>
			  			<c:if test="${pageBean.currentPage != pagenum }">
    			<a style="color: blue" href="${pageContext.request.contextPath}/adminDouser_findAllUser.action?currentPage=${pagenum}&pageSize=${pageBean.pageSize }">${pagenum}</a>
			  			</c:if>
			  		</c:forEach>
			  		<c:if test="${pageBean.currentPage !=pageBean.totalPage }">
			  			<a href="${pageContext.request.contextPath}/adminDouser_findAllUser.action?currentPage=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize }">
			  			<strong style="color: green">下一页</strong></a> | 
			  			<a href="${pageContext.request.contextPath}/adminDouser_findAllUser.action?currentPage=${pageBean.totalPage}&pageSize=${pageBean.pageSize }">
			  			<strong style="color: green">尾页</strong></a>
			  		</c:if>
    		<input type="text" id="pagenum" name="pagenum"style="width: 150px;height: 40px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;"/>
    		<input type="button" value="跳转页" onclick="jump()" 
    		style="background-color: green; width: 65px; height: 36px;"/>
    		
    		<script type="text/javascript">
    			function jump(){
    				var totalpage = ${pageBean.totalPage};
    				var pagenum = document.getElementById("pagenum").value;
    				//判断输入的是一个数字
    				var reg =/^[1-9][0-9]{0,1}$/;
    				if(!reg.test(pagenum)){
    					//不是一个有效数字
    					alert("请输入符合规定的数字");
    					return ;
    				}
    				//判断输入的数字不能大于总页数
    				if(parseInt(pagenum)>parseInt(totalpage)){
    					//超过了总页数
    					alert("不能大于总页数");
    					return;
    				}
    				//转向分页显示的Servlet
    				window.location.href="${pageContext.request.contextPath}/adminDouser_findAllUser.action?currentPage="+pagenum;
    			}
    		</script>
  
  	</td>
  </tr>
  <tr>
  	<td colspan="10" align="center"><span style="color: red;"><strong>---某些试题的内容字段过长，将采用"......"形式展示---</strong></span></td>
  </tr>
			</table>
		</div>
	</div> 
	</div>
	</div>
</body>
</html>