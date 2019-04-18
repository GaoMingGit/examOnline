// 左侧边滑动

$(document).ready(function(){
	$(".slider dd").hide();
	$(".slider dt").click(function(){
		// 这里不能用parent(),因为parent只会查找一级，在这里它的父级是dl,本dl下查找的dt还是自己本身，
		// parents则会往上一直查到查找到祖先节点，这样就能找到除了它的其他兄弟dt,清除他们的dt_action样式,
		// 而保留当前点击的样式不被清除；
		$(this).parents().find("dt").removeClass("dt_action");
		// removeclass()和addclass()的顺序不能换
		$(this).addClass("dt_action"); 
		$(this).parent().find("dd").removeClass("mymenu");
		$(".mymenu").slideUp();
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("mymenu");
		
		})
	})

function jiaojuan(){
		var flag = confirm("交卷之前，你确定所有的题目都作答了吗???");
		if(flag){
			window.location.href = "${pageContext.request.contextPath }/ExamServlet?id=2";
		}else{
			return false;
		}
	}
	
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
			$("#span").html("<font color='red'>&nbsp;练习倒计时:&nbsp;</font>"+minutes+"分"+seconds+"秒");
			/* 当考试倒计时剩下5分钟时，提醒用户剩余时间 */
			if( maxTime == 5*60){
				alert("离模拟考试结束时间还有5分钟，请加紧时间作答题目");
			}
			--maxTime;
		}	
	}
