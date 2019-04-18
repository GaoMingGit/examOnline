<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单页面</title>
</head>
<style>
a{
	font-size: 18px;
}
</style>
<body>
<!-- 左导航 -->
	<div class="slider">
		<p>NAVIGATION</p>
		
		<dl>
			<dt>
				<span></span>回到首页<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/index.jsp"><span></span>回到首页</a>
			</dd>
			
		</dl>
		<dl>
		
			<dt>
			
				<span></span>学习模块<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/exam_keMuLianXi.action?lei=1"><span></span>(随机抽题)科目一练习</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/exam_keMuLianXi.action?lei=4"><span></span>(随机抽题)科目四练习</a>
			</dd>
			
		</dl>
		
		<dl>
		
			<dt>
			
				<span></span>模拟考试模块<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/exam_toExamPageUI.action?lei=1"><span></span>模拟科一考试(单选)</a>
			</dd>
			<dd><!-- user_keMuExam.action?lei=4 -->
				<a href="${pageContext.request.contextPath }/exam_toExamPageUI.action?lei=4"><span></span>模拟科四考试(单多选)</a>
			</dd>
		</dl>
		
		<dl>
			<dt>
				<span></span>信息管理<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/user_getUserMessage.action"><span></span>查看个人信息</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/user_getUserMessage.action"><span></span>修改(完善)个人信息</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/user_toUpdatePwdUI.action"><span></span>修改密码</a>
			</dd>
		</dl>
		
		<dl>
			<dt>
				<span></span>历史纪录<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/user_lookPastScore.action" ><span></span>历史成绩</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/exam_lookWrongQuestion.action"><span></span>个人收藏的错题集</a>
			</dd>
		</dl>
		<dl>
			<dt>
				<span></span>辅助学习资料(您要了解的)<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/video.jsp"><span></span>视频观看</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/study.jsp"><span></span>关于考试注意事项</a>
			</dd>
		</dl>
		<dl>
			<dt>
				<span></span>关于网站<i></i>
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/adminPage/adminLogin.jsp" target="_blank"><span></span>访问网站后台</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/about.jsp"><span></span>关于网站解读</a>
			</dd>
		</dl>
	</div>
</body>
</html>