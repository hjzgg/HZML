<%@page import="com.hzml.entriy.TaskAppend"%>
<%@page import="com.hzml.entriy.Task"%>
<%@page import="com.hzml.entriy.DevelopingParty"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公司分配任务</title>
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
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
</head>
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
			<a href="index.jsp"><img src="images/logo.gif" alt="ChillyBlues" /></a>
		</div>
		<div class="clear"></div>
		
		<div class="grid_16" id="navigation">
			<ul>
				<li><a href="index.jsp"><span>主页</span></a></li>
				<li><a href="#" class="current"><span>公司管理</span></a></li>
				<li><a href="about.jsp"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		
		<div class="grid_16" id="display">
			 
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
	
		<div class="grid_11 content" id="two_col">
			<h2>请您对这次任务完成情况进行评价:</h2>
			<%
				TaskAppend taskAppend = (TaskAppend)session.getAttribute("evaluateTask_taskAppend");
				Task task = (Task)session.getAttribute("evaluateTask_task");
				List<DevelopingParty> developingPartyList = (List<DevelopingParty>)session.getAttribute("evaluateTask_DevelopingPartyList");
			%>
			<form action="#" method="post" name="contactForm" id="contactForm">
				<div style="padding-top: 20px;">
					<label>功能划分说明书: </label>
					<input style="width: 280px" type="text" name="projectPlan" id="projectPlan" value="<%=taskAppend.getTaskAllocationDoc()%>"/>
					<a style="float: right;  margin-right: 40px" class="button" href="uR!fileDownLoad?fileName=<%=taskAppend.getTaskAllocationDoc()%>"><span>下载</span></a>
				</div>
			</form>
			<div id="hjzggContent">
				<%
					if(task.getState()!=3){//没有评论过该项目
				%>
						<center>
							<hr style="border:5px dotted #33FFFF;border-bottom:0;border-right:0; border-left:0;width:550px;">
							<br>
							<h2>本项目的开发人员如下:</h2>
						</center>
						<form method="get" name="contactForm_main" id="contactForm_main">
							<input type="hidden" name="taskid" value="<%=taskAppend.getTaskid()%>">
							<div id="updateworkcontent">
								<%
									for(int i=0; i<developingPartyList.size(); ++i){
								%>
										<div id="updateworkcontent_content">
											<div style="background-image:url('./images/color.gif');">
												<center>开发者:<b style="font-size: 20px"> <%=developingPartyList.get(i).getDevelopName() + (developingPartyList.get(i).getDevelopName().equals(taskAppend.getTaskLeader()) ? "(组长)" : "") %></b></center>
											</div>
											<div style="margin-top: 20px">
											     <b style="float:left">项目完成评价:</b>
												 <input type="radio" style="margin-left: 60px" name="<%=developingPartyList.get(i).getDevelopName() %>" value="1" />非常满意
												 <input type="radio" style="margin-left: 40px" name="<%=developingPartyList.get(i).getDevelopName() %>" value="2" checked="checked"/>满意
												 <input type="radio" style="margin-left: 40px" name="<%=developingPartyList.get(i).getDevelopName() %>" value="3"/>一般
											</div>
										</div>
										<center>
											<hr style="border:5px dotted #33FFFF;border-bottom:0;border-right:0; border-left:0;width:550px;">
										</center>
								<%
									}
								%>
							</div>
						</form>
						<center><a class="button" style="margin-top: 10px; margin-left: 280px" href="javascript:void(0)" onclick="submitTaskScore('#contactForm_main')"><span>提交</span></a></center>
				  <%
					} else {
				  %>
				  		<center><h1>评论成功!</h1></center>&nbsp;&nbsp;&nbsp;&nbsp;<a href='allFinishedTask'>返回</a>
				  <%}%>
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