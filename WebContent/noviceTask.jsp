<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.Task"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新手学习</title>
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/menu.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.all.js"></script>
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript" src="js/my.js"></script>
<style type="text/css">
	body {
		background: #f9fafb url(images/pages/bg.gif) top repeat-x;
	}
</style>
<script type="text/javascript">
	$(window).load(function () {
	  	setInterval("corperationImage()", 300);
	});
</script>
<script type="text/javascript">
	var preDiv = null;
	function showMenuDiv(divId){
		var id = "btn_div_" + divId;
		var curDiv = document.getElementById(id);
		if(preDiv!=null && preDiv==curDiv){//关掉div
			preDiv = null;
			curDiv.style.display = "none";
		} else if(preDiv != null && preDiv!=curDiv){
			preDiv.style.display = "none";//关掉之前的div
			curDiv.style.display = "";
			preDiv = curDiv;
		} else if(preDiv == null){//新打开的div
			preDiv = curDiv;
			curDiv.style.display = "";
		}
	}
</script>
</head>
<body>
	<div class="loginbg_div" id="loginbg_div"></div>
    
	<div class="login_div" id="login_div">
		<%
			String peopleName = (String)session.getAttribute("peopleName");
			if(peopleName == null){
		%>
				<a href="login.jsp" style="left:40px; top:5px;">登录</a>
		<%
			} else {
		%>
				<a href="javascript:void(0)" style="left:40px; top:5px;"><%=peopleName %></a>
		<%
			}
		%>
			<a href="login!quitLogin" style="right:39px; top:5px;">退出</a>
	</div>	
	<div class="container_16" id="main">
		
		<div class="grid_16" id="top">
			<a href="#" id="qsm">quick select menu <img id="down" src="images/dropdowntriangle.gif" alt="dropdown" /><img id="up" src="images/dropdowntriangle_.gif" alt="dropdown" /></a>
			<div id="qsmContainer">
				<div id="qsmTop"></div>
				<div id="qsmMiddle">
					<div id="search">
						<input type="text" value="search site" onfocus="if(this.value == 'search site'){this.value = ''}" />
						<img src="images/search.gif" alt="search" />
					</div>
					<div class="clear"></div>
					<ul>
						<li><a href="index.jsp">主页</a></li>
						<li><a href="projects.jsp">团队成员</a></li>
						<li><a href="showAllTask.jsp">任务展示</a></li>
						<li><a href="about.jsp">关于</a></li>
						<li><a href="contact.jsp">联系</a></li>
					</ul>
				</div><!-- /#qsmMiddle -->
				<div id="qsmBottom"></div>
			</div>
		</div>
		<div class="clear"></div>
		
		<div class="grid_16" id="logo">
			<a href="index.jsp"><img src="images/logo.gif" title="在线软件工程" /></a>
		</div>
		<div class="clear"></div>
		
		<div class="grid_16" id="navigation">
			<ul>
				<li><a href="index.jsp"><span>主页</span></a></li>
				<% 
					String peopleType = (String)session.getAttribute("peopleType");
					if(peopleType!=null)
						if(peopleType.equals("user")){
				%>
							<li><a href="userRequest?userRequest=userTaskNoParticipate"><span>用户任务</span></a></li>
							<li><a href="noviceTask.jsp" class="current"><span>新手学习</span></a></li>
				<%
						}  
				%>
				<li><a href="about.jsp"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="#" class="current">新手学习</a></li>
				<li><a href="questionsAction!getUserQuestionsAndQuestions">查看已做题目</a></li>
				<li><a href="randomQuestion.jsp"><img src="images/骰子.png" height="12" width="12">&nbsp;随机做题</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
	
	<div class="container_16" id="content">
	
		<div class="grid_11 content" id="two_col">
			 <div class="mymenu">
			 	<div class="mytitle">
			 		自学习网站推荐
			 	</div>
			 	<span>
			 		&nbsp;&nbsp;&nbsp;&nbsp;根据自己喜欢的发展方向，选择合适的网站进行学习。
			 	</span>
		 		<span>
			 		<a style="margin-top: 103px" class="button3d" href="javascript:void(0)"  onclick="showMenuDiv('one')">网站推荐</a>
			 	</span>
			 </div>
			 
			 <div class="mymenu">
			 	<div class="mytitle">
			 		推荐学习
			 	</div>
			 	<span>
			 		&nbsp;&nbsp;&nbsp;&nbsp;通过推荐学习的步骤，你可以从一个菜鸟一步一步的迈向入门。
			 	</span>
		 		<span>
			 		<a class="button3d" href="javascript:void(0)" onclick="showMenuDiv('two')">推荐学习</a>
			 	</span>
			 </div>
			 
			 <div class="mymenu">
			 	<div class="mytitle">
			 		随机学习
			 	</div>
			 	<span>
			 		&nbsp;&nbsp;&nbsp;&nbsp;随机性的学习适用于基础比较好的人。
			 	</span>
			 	<span>
			 		<a class="button3d" style="margin-top: 103px" href="randomQuestion.jsp">随机学习</a>
			 	</span>
			 </div>
			 
			 <div class="btndiv" style="display:none;left:20px;" id="btn_div_one">
				<a href="http://www.w3school.com.cn/" title="w3cschool">w3cschool</a>
			 	<a href="http://www.educity.cn/" title="专业IT教育平台">专业IT教育平台</a>
			 	<a href="http://www.imooc.com/" title="慕课网">慕课网</a>
			 	<a href="http://www.csdn.net/" title="CSDN">CSDN</a>
			 </div>
			
			 <div class="btndiv" style="display:none;left:230px;" id="btn_div_two">
				<a href="agileDevelopment1.html" title="敏捷开发定义">敏捷开发定义</a>
			 	<a href="agileDevelopment2.html" title="敏捷开发建模">敏捷开发建模</a>
			 	<a href="agileDevelopment3.html" title="敏捷开发模式">敏捷开发模式</a>
			 	<a href="agileDevelopment4.html" title="敏捷开发流程">敏捷开发流程</a>
			 </div>
			
			 <div class="btndiv" style="display:none;left:600px;" id="btn_div_three">
			
			 </div>
			 
		</div><!-- /#two_col -->
		<div class="grid_5 news" id="one_col">
			<h2>如何进行一个任务的分派？</h2>
			<div id="testimonials">
				<div>
					<div>
					"首先将开发的任务进行描述，如需求分析，功能模块的划分， 开发时间限制，费用等等，然后将任务发布出去！"
					</div>
					<div class="by"><a href="javascript:">下一步</a></div>
				</div>
				<div>
					<div>
					"一定的时间之后可以查看自己的任务是否一定被人接手。"
					</div>
					<div class="by"><a href="javascript:">下一步</a></div>
				</div>
				<div>
					<div>
					"通过查看完成的任务，判断是否符合自己的需求并结束任务！"
					</div>
					<div class="by"> <a href="javascript:">完毕</a></div>
				</div>
			</div>
			
		</div><!-- /#one_col -->
		<div class="clear"></div>
		
	</div><!-- /#content -->
		
	<div id="footerwrapper">
		
		<div class="container_16">
		
			<div class="grid_16" id="footer">
				<span id="address"><b>在线软件工程 Web Solutions</b> - qq群:271413190 &nbsp;&nbsp; 邮箱:271413190@qq.com</span>
				<div>
					<ul class="services">
						<li>敏捷开发</li>
						<li>在线团队合作</li>
						<li>新手学习</li>
					</ul>
					<ul class="services">
						<li>项目开发者</li>
						<li>项目发布者</li>
						<li>web维护者</li>
					</ul>
					<ul class="links" id="first">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="about.jsp">关于</a></li>
						<li><a href="#">联系我们</a></li><!-- 自动打开qq  -->
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		
	</div><!-- /#footerwrapper -->
	<script type="text/javascript"> Cufon.now(); </script>
	
</body>
</html>