<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.Task"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>查看分配任务</title>
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
<script type="text/javascript">
	$(window).load(function () {
	  	setInterval("corperationImage()", 300);
	});
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
			<ul id="subNavigation">
				<li><a href="distributionOfCompany.jsp">分配任务</a></li>
				<li><a href="allTask">查看任务</a></li>
				<li><a href="allFinishedTask" class="current">已完成任务</a></li>
				<li><a href="developToPublishMsgAction!getAllDevelopToPublishMsg">消息管理</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
	
		<div class="grid_11 content" id="two_col">
			<h2>所用完成任务列表:</h2>
			<%
				List<Task> taskList = (List<Task>)session.getAttribute("allFinishedTask");
				if(taskList != null)
					for(int i=0; i<taskList.size(); ++i){
						Task task = taskList.get(i);
			%>
					<div class="class1">
						任务<%=i+1%>
						<div style="background-image:url('./images/color.gif'); height: 25px">
							<h1 style="font-size:19px; color:#434c55; float: left;"><%=task.getTaskName() %></h1>
							<span style="float:right; cursor:pointer;" id="<%=i+"stateBut"%>" onClick="$use('<%=i+"contentx"%>','<%=i+"stateBut"%>')">展开</span>
						</div>
	       				<div class="class1content" id="<%=i+"contentx"%>">
							<form action="#" method="get" id="contactForm">
								<div>
									<label>任务名称:</label>
									<input type="text" name="taskName" id="taskName"  value="<%=task.getTaskName()%>"/>
								</div>
								<div>
									<label>任务完成时间: </label>
									<input type="text" name="finishTime" id="finishTime" value="<%=task.getDevelopmentTime()%>" readOnly />
								</div>
								<div>
									<label>任务费用: </label>
									<input type="text" name="money" id="money" value="<%=task.getMoney()+"元"%>" readOnly/>
								</div>
								<div>
									<label>任务描述:</label>
									<textarea name="message" rows="10" cols="20" id="message" readOnly> <%=task.getTaskDescription() %> </textarea>
								</div>
								<div>
									<label>任务说明文档: </label>
									<input type="text" name="document" id="document" value="<%=task.getDocumentationAddress() %>" readOnly/>
								</div>
								<a class="button" style="float:right;" href="DownloadFile"><span>下载文档</span></a>
								<div style="padding-top: 20px;">
									<label>任务项目源码: </label>
									<input type="text" name="taskAddress" id="taskAddress" value="<%=task.getTaskAddress() %>" readOnly/>
								</div>
								<a class="button" style="float:right;" href="uR!fileDownLoad?fileName=<%=task.getTaskAddress() %>"><span>下载项目</span></a>
							</form>
							<div style="width:100%; height: 50px; position: relative;">
								<div style="z-index: 1; position:absolute; left:30%; top:0px;">
									<%
										if(task.getState()<3){
									%>
											<a class="button3d" style="width:50px;" href="companyAndDistributeAction!evaluateTask?taskid=<%=task.getTaskid() %>">项目评分</a>
									<%
										} else {
									%>			
											<a class="button3d" style="width:50px;" href="companyAndDistributeAction!evaluateTask?taskid=<%=task.getTaskid() %>">项目完毕</a>
									<%
										}
									%>
								</div>
								<!-- 加入在线支付  -->
								<div style="z-index: 2; position:absolute;  left:60%; top:0px;">
									<%
										if(task.getState()!=4){
									%>
											<a class="button3d" style="width:50px" href="companyAndDistributeAction!onlinePaymentRequest?taskid=<%=task.getTaskid()%>">在线支付</a>
									<%
										} else {
									%>			
											<a class="button3d" style="width:50px" href="javascript:void(0)">支付完毕</a>
									<%
										}
									%>
								</div>	
							</div>		
						</div>
					</div>
			<% } %>
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