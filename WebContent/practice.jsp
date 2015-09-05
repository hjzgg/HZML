<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.QuestionList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>在线软件工程</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/css.css" type="text/css" />
<style type="text/css">

body {
		background: #f9fafb url(images/pages/bg.gif) top repeat-x;
}

</style>

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.all.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.easing.names.js"></script>
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script src="js/jquery-1.2.6.min.js" type="text/javascript"></script>
<script src="js/photo-slide.js" type="text/javascript"></script>

</head>
<%  //保证页面不会缓存 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragrma","no-cache");
	response.setDateHeader("Expires",0);
%>
<body>
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
						<li><a href="#">services</a></li>
						<li>
							<a href="blog.jsp">News</a>
							<ul>
								<li><a href="post.jsp">First newsitem</a></li>
								<li><a href="post.jsp">Second newsitem</a></li>
							</ul>
						</li>
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
				<li><a href="#" class="current"><span>用户任务</span></a></li>
				<li><a href="about.jsp" class="current"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		<div class="grid_16" id="display">
			 <ul id="subNavigation">
				<li><a href="#" style="color:blue; font-size: 20px">测试中...</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		<div id="wrap">
			<div id="slide">
				<img id="loading" src="images/loading.gif"/>
			    <form action="questionsAction!produceToQuestionList" method="post" id="question_answer" name="question_answer">
					<input type="hidden" name="developName" value="<%=(String)session.getAttribute("peopleName")%>">
				<%
					List<QuestionList> questionList = (List<QuestionList>)session.getAttribute("questionList");
					if(questionList != null)
					  for(int i=0; i<questionList.size(); ++i){
						QuestionList question = questionList.get(i);
				%>
						<div id="p<%=i+1%>">
							<span>
								<%=i+1%>.<%=question.getQuestionMsg() %>
								<br>
								<br>
								&nbsp;&nbsp;<input type="radio" name="optionSelect<%=i%>" value="1" checked="checked" /><%=question.getOptionA() %>
								<br> 
								&nbsp;&nbsp;<input type="radio" name="optionSelect<%=i%>" value="2" /><%=question.getOptionB() %>
								<br>
								&nbsp;&nbsp;<input type="radio" name="optionSelect<%=i%>" value="3" /><%=question.getOptionC() %>
								<br>
								&nbsp;&nbsp;<input type="radio" name="optionSelect<%=i%>" value="4" /><%=question.getOptionD() %>
							</span>
							<%
								if(i==questionList.size()-1){
							%>
									<a class="button3d" style="float:right;position:relative;left:-10px; top:-250px;width:60px; height:20px;"  href="javascript:void(0)" onclick="document.getElementById('question_answer').submit();">提交</a>
							<%
								}
							%>
						</div>
				<%
					}
				%>
				</form>
			</div> <!-- end wrap -->
		
			<div id="title"></div>
			<div id="previous"><b>Previous</b></div>
	
			<div id="next"><b>Next</b></div>
	
			<div id="buttons">
				<%
					if(questionList != null)
					  for(int i=0; i<questionList.size(); ++i){
				%>
						  <div id="b<%=i+1%>"><b><%=i+1%></b></div>
				<%
					  }
				%>
			</div> <!-- end buttons -->
		</div>
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