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

	//根据qid查找
	function findByUUID(){
		
		var qid = document.getElementById("qid").value;
		if(qid != null && qid != ''){
			window.location.href = "${pageContext.request.contextPath }/admin_findByUUID.action?qid="+qid;
		}else{
			alert("输入的内容不能为空");
			return false;
		}
		
	} 
	
	function findByQid(qid){
		window.location.href = "${pageContext.request.contextPath }/admin_findByUUID.action?qid="+qid;
	} 
	 function findDanxuan(){
		window.location.href = "${pageContext.request.contextPath }/admin_findByPage.action?cid=1";
	} 
	 function findPanduan(){
			window.location.href = "${pageContext.request.contextPath }/admin_findByPage.action?cid=2";
	}
	 function findDuoXuan(){
			window.location.href = "${pageContext.request.contextPath }/admin_findByPage.action?cid=3";
	}
	 function findImage(){
			window.location.href = "${pageContext.request.contextPath }/admin_findByIma.action";
	}
	 function deleteById(qid){
		/*  alert("要删除的id是"+id); */
		 var flag = confirm("你确定要删除这道题目吗???");
		 if(flag){
			 window.location.href = "${pageContext.request.contextPath }/admin_delete.action?qid="+qid;
		 } 
	 }
	 function changeById(qid){
			/*  alert("要删除的id是"+id); */
			 var flag = confirm("你确定要修改这道题目的内容吗???");
			 if(flag){
				 window.location.href = "${pageContext.request.contextPath }/admin_toEdictPage.action?qid="+qid;
			 } 
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
		<input onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="输入UUID编号" type="text" id="qid" name="qid" style="width: 350px;height: 50px;margin-left: 40px;transition: all 0.3s;
					color: #999;font-size: 16px;border: 1px solid #ccc;">
			<button onclick="findByUUID()">UUID编号查找</button>&nbsp;
			<button onclick="findDanxuan()">查看所有单选题</button>&nbsp;
	<button onclick="findPanduan()">查看所有判断题</button>&nbsp;
	<button onclick="findDuoXuan()">查看所有多选题</button>&nbsp;
	<button onclick="findImage()">查看所有图片</button>&nbsp;
			<span>
				
			</span>
			
<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
	</div>
	<div class="table" style="margin-top: 70px;width: 100%;">
		<div class="studenttable" >
			<table cellpadding="0" cellspacing="0" >
					<thead>
						<td align="center" width="12px">(UUID)编号</td>
						<td align="center">试题题目</td>
						<td align="center">选项A内容</td>
						<td align="center">选项B内容</td>
						<td align="center">选项C内容</td>
						<td align="center">选项D内容</td>
						<td align="center">正确答案</td>
						<td align="center">添加时间</td>
						<td align="center">题目类型</td>
						<td align="center">修改/删除</td>
					</thead>
					<%-- <s:iterator value="list"> --%>
					<c:forEach items="${pageBean.list }" var="questionBean">
					<tr align="center">
						<td width="20px" style="cursor:pointer "><strong style="color:blue">${questionBean.qid }</strong></td>
						<td style="cursor:pointer " onclick="findByQid('${questionBean.qid }')">${questionBean.question }</td>
						<td style="cursor:pointer " onclick="findByQid('${questionBean.qid }')">${questionBean.select_a }</td>
						<td style="cursor:pointer " onclick="findByQid('${questionBean.qid }')">${questionBean.select_b }</td>
						<td style="cursor:pointer " onclick="findByQid('${questionBean.qid }')">${questionBean.select_c }</td>
						<td style="cursor:pointer " onclick="findByQid('${questionBean.qid }')">${questionBean.select_d }</td>
						<td style="cursor:pointer " onclick="findByQid('${questionBean.qid }')">${questionBean.answer }</td>
						<td>${questionBean.addTime }</td>
						<td>
							<c:if test="${questionBean.cid == '1'}">单选题</c:if>
							<c:if test="${questionBean.cid == '2'}">判断题</c:if>
							<c:if test="${questionBean.cid == '3'}">多选题</c:if>
						</td>
							<td align="center">
							<%-- <input type="button" value="修改" onclick="changeById('${questionBean.qid}')">&nbsp; --%>
							<input type="button" value="删除" onclick="deleteById('${questionBean.qid}')">
						<%-- 	<a onclick="changeById('${questionBean.qid}')" href="javascript:;">
							<strong style="color: green">修改</strong></a>
							&nbsp;||&nbsp;
							<a onclick="deleteById('${questionBean.qid}')" href="javascript:;">
							<strong style="color: red">删除</strong></a> --%>
							</td>
					</tr>
					</c:forEach>
					<%-- </s:iterator> --%>
			<tr>
  	<td colspan="10" align="center">
  	第<strong style="color: red">${pageBean.currentPage}</strong>页 / 总共<strong style="color: red">${pageBean.totalPage}</strong>页&nbsp;&nbsp;
  	每一页显示<strong style="color: red">${pageBean.pageSize }</strong>条&nbsp;&nbsp;&nbsp;
  	总记录数<strong style="color: red">${pageBean.totalCount }</strong>条
    		<c:if test="${pageBean.currentPage !=1 }">
    		<a href="${pageContext.request.contextPath}/admin_getAll.action?currentPage=1&pageSize=${pageBean.pageSize }"><strong style="color: green">首页</strong></a>
    		<a href="${pageContext.request.contextPath}/admin_getAll.action?currentPage=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize }"><strong style="color: green">上一页</strong></a>
			  		</c:if>
			  		<c:forEach begin="1" end="${pageBean.totalPage }" var="pagenum">
			  			<c:if test="${pageBean.currentPage == pagenum }">
			  				${pagenum }
			  			</c:if>
			  			<c:if test="${pageBean.currentPage != pagenum }">
    			<a style="color: blue" href="${pageContext.request.contextPath}/admin_getAll.action?currentPage=${pagenum}&pageSize=${pageBean.pageSize }">${pagenum}</a>
			  			</c:if>
			  		</c:forEach>
			  		<c:if test="${pageBean.currentPage !=pageBean.totalPage }">
			  			<a href="${pageContext.request.contextPath}/admin_getAll.action?currentPage=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize }">
			  			<strong style="color: green">下一页</strong></a> | 
			  			<a href="${pageContext.request.contextPath}/admin_getAll.action?currentPage=${pageBean.totalPage}&pageSize=${pageBean.pageSize }">
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
    				window.location.href="${pageContext.request.contextPath}/admin_getAll.action?currentPage="+pagenum;
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