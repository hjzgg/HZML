<%@page import="com.hzml.entriy.Task" %>
<%@page import="com.hzml.entriy.DevelopingParty" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>任务详情</title>
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.all.js"></script>
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<style type="text/css">
	
	body {
		background: #f9fafb url(images/pages/bg.gif) top repeat-x;
	}
	
	#div_absolute {
		  position: absolute;
		  z-index:10;
		  left: 400px;
		  top: 500px;
		  width:450px;
		  height:350px;
		  display: none;
	}
	
</style>
<script type="text/javascript">
	function takeInDistribute(taskid){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			      document.getElementById("div_absolute").innerHTML=xmlhttp.responseText;
				  document.getElementById("div_absolute").style.display="block";
			  }
		 }
		xmlhttp.open("GET","userRequestToTakeInDistribute?taskid="+taskid,true);
		xmlhttp.send();
	}
	
	function mySkip(){
		window.location.href="userRequest?userRequest=userTaskParticipating";
	}
	
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
	<div id="div_absolute">
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
				<li><a href="#" class="current"><span>用户任务</span></a></li>
				<li><a href="noviceTask.jsp"><span>新手学习</span></a></li>
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
			 <h2>任务如下:</h2>
			 <% 
			 	Task task = (Task)session.getAttribute("showNoParticipateTask");
			 	if(task != null){
			 %>
				 <form action="#" method="get" id="contactForm">
					<div>
						<label>发布者: </label>
						<input type="text" name="name" id="name" value="<%=task.getPublishName() %>" readOnly/>
					</div>
					<div>
						<label>任务发布时间: </label>
						<input type="text" name="publishTime" id="publishTime" value="<%=task.getPublishTime() %>" readOnly />
					</div>
					<div>
						<label>任务完成时间: </label>
						<input type="text" name="finishTime" id="finishTime" value="<%=task.getDevelopmentTime() %>" readOnly />
					</div>
					<div>
						<label>任务费用: </label>
						<input type="text" name="money" id="money" value="<%=task.getMoney() %>" readOnly/>
					</div>
					<div>
						<label>任务描述:</label>
						<textarea name="message" rows="10" cols="20" id="message" readOnly><%=task.getTaskDescription() %></textarea>
					</div>
					<div>
						<label>任务说明文档: </label>
						<input type="text" name="document" id="document" value="<%=task.getDocumentationAddress() %>" readOnly/>
					</div>
					<a class="button" style="float:right;" href="uR!fileDownLoad?fileName=<%=task.getDocumentationAddress() %>"><span>下载文档</span></a>
				</form>
				<br>
				<br>
				<br>
				<%
					DevelopingParty curDevelopingParty = (DevelopingParty)session.getAttribute("curDevelopingParty");
					if(session.getAttribute("peopleName") != null && "user".equals((String)session.getAttribute("peopleType"))/* && curDevelopingParty.getEvaluate()>=100 */){//没有登录的用户只能查看任务
							if(task.getState() == 0){
				%>
								<a class="button" style="float:left;" href="javascript:void(0)" onclick="takeInDistribute('<%=task.getTaskid()%>')"><span>加入项目开发</span></a>
				<%
				   			 } else {
			    %>
				   				<a class="button" style="float:left;" href="javascript:void(0)"><span>项目已经开始或完成</span></a>
				 <%
				   			 }
					}
				 %>
			<%
				}
			%>
		</div><!-- /#two_col -->
		<div class="grid_5 news" id="one_col">
			<h2>如何参与一个项目的开发？</h2>
			<div id="testimonials">
				<div>
					<div>
					"对于公司分派的任务，可以在用户任务中查看到。可以根据自己的能力和爱好选择！"
					</div>
					<div class="by"><a href="javascript:">下一步</a></div>
				</div>
				<div>
					<div>
					"点击任务，进入任务详细信息界面，点击加入，就可以参与到这个项目的开发了!"
					</div>
					<div class="by"><a href="javascript:">下一步</a></div>
				</div>
				<div>
					<div>
					"如果你已经参与了项目的开发，那么必须按照项目开发的流程，按时更新自己的任务模块，不要影响整个团队的进度!"
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