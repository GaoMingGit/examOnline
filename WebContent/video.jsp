<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频观看</title>
<!-- css 初始化 公共样式-->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/add.css">
<!-- ico 图标引入 -->
<link rel="shortcut icon" href="favicon.ico" />
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
	<%@ include file="top.jsp" %>
	<div class="centerdiv">
	<%@ include file="../menu.jsp" %>
	</div>
	<div class="content">
		
    <!-- <video width="100%" height="90%" controls="controls" autoplay="autoplay">
  <source src="https://ke.qq.com/course/345075" type="video/mp4" />
  <source src="http://www.iqiyi.com/w_19rr9wcj89.html" type="video/mp4" />
  <source src="https://ke.qq.com/course/345075" type="video/webm" />
  <object data="../i/movie.mp4" width="320" height="240">
    <embed width="https://ke.qq.com/course/345075" src="../i/movie.swf" />
  </object> -->
  <center><h2>视频播放页面之&nbsp;&nbsp;<font style="color: red">《学车理论考试培训》</font></h2></center>
  <video width="100%" height="90%" controls="controls" autobuffer="true" preload>
  <source src="https://ugcydzd.qq.com/uwMROfz0r5zA4aQXGdGnC2dfJ7zHkvDDYs6McZP0ugliry3b/q08132pw5pr.p712.2.mp4?sdtfrom=v1010&guid=c922e8d4b9358d63a58aca49da77cdc3&vkey=06E987F433F0FA31691B51E4BC82976717B4BC0899CC07C39C03092CBF45216F08B1DB0EBED6F8D5197CA647E9C103E295BC55625903D19AFE6F4D02D803D54B2BA6FAEDC16081C09F6D7A76D607B9F6F268E2AF5FDC088843CC6EA11B8E77284A40A55D305B788D1B91F31E524564EF00AD8C8F1E507792" type="video/mp4" />
  <object data="movie.mp4" width="320" height="240">
    <embed src="movie.swf" width="320" height="240" />
  </object>
</video>

  
</video>


	</div>
</body>
</html>
