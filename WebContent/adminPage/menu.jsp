<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员菜单</title>

</head>
<body>
<div class="slider">
		<p>NAVIGATION</p>
		<dl>
			<dt>
				<span></span>回到首页<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/adminPage/index.jsp"><span></span>回到首页</a>
			</dd>
			
		</dl>
		<dl>
			<dt>
				<span></span>题目模块<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/admin_toAddQuestionUI.action"><span></span>添加试题</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/admin_getAll.action"><span></span>查看所有试题</a>
			</dd>
		</dl>
		
		<dl>
			<dt>
				<span></span>用户模块<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/adminDouser_findAllUser.action" ><span></span>查看所有用户列表</a>
			</dd>
			<dd>
				<a href="#" target="main"><span></span>待续功能开发1</a>
			</dd>
		</dl>
		
		<dl>
			<dt>
				<span></span>待续功能开发区<i></i>
			</dt>
			<dd>
				<a href="#"><span></span>待续功能开发1</a>
			</dd>
			<dd>
				<a href="#"><span></span>待续功能开发2</a>
			</dd>
			<dd>
				<a href="#"><span></span>待续功能开发3</a>
			</dd>
		</dl>
	</div>
</body>
</html>