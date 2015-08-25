<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.Task"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
				<li><a href="#" class="current"><span>用户任务</span></a></li>
				<li><a href="#"><span>新手学习</span></a></li>
				<li><a href="about.jsp" class="current"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="userRequest?userRequest=userTaskNoParticipate" class="current">没有参与的任务</a></li>
				<li><a href="userRequest?userRequest=userTaskParticipating">正在参与的任务</a></li>
				<li><a href="userRequest?userRequest=userTaskFinish">已经完成的任务</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
	
		<div class="grid_11 content" id="two_col">
			<h2>未参与的任务如下:</h2>
			<%
			//////////////////////////////分页代码
			int pageCur=0, pageBegin=0, pageTot=0, num= 0;
			final int pageSize = 6;//每一面显示的任务的数目
			List<Task> taskList = (List<Task>)session.getAttribute("userTaskNoParticipate");
			num = taskList.size();//总个数 
			pageTot = num%pageSize == 0 ? num/pageSize : num/pageSize+1;//总页数
			String curPage  = request.getParameter("page");//当前定位的页码
			if(curPage == null) pageCur = 1; 
			else pageCur = Integer.valueOf(curPage);
			pageBegin = pageCur-5;
			if(pageBegin < 1) pageBegin = 1;
			int i = (pageCur-1)*pageSize;
			//////////////////////////////////
			if(num>0)
				for(int cnt=0; cnt<pageSize && i<taskList.size(); ++i, ++cnt){
					Task task = taskList.get(i);
			%>
						<div id="list">
							<ul class="services">
								<li>任务<%=i+1%>&nbsp;&nbsp;<a href="userRequest?userRequest=showNoParticipateTask&taskid=<%=task.getTaskid()%>"><%=task.getTaskName() %></a></li>
							</ul>
						</div>
			<%
				}
			%>
			
			<!-- 加入分页的按钮  -->
			<div style="margin-top: 20px">
				<%if(pageCur!=1){%>
					  <a href="javascript:void(0)" class="button_page" onclick="myGoTo('userRequest?userRequest=userTaskNoParticipate&page=<%=pageCur-1%>')"><span>上一页</span></a>	
		         <%}%>
		         <% 
		         	int j;
		         	for(i=pageBegin, j=1; j<=10 && i<=pageTot; ++i, ++j) {%>
		             <%if(i == pageCur){%>
		                  <b class="pageword" style="color:red;">
		                      <%=i%>
		                  </b>
		             <%} else {%>
		              	  <a href="javascript:void(0)" class="button_page" onclick="myGoTo('userRequest?userRequest=userTaskNoParticipate&page=<%=i%>')"><span><%=i%></span></a>	
		             <%}%>
		         <% } %>                
		
		         <%if(pageCur!=pageTot){%>
		                 <a href="javascript:void(0)" class="button_page" onclick="myGoTo('userRequest?userRequest=userTaskNoParticipate&page=<%=pageCur+1%>')"><span>下一页</span></a>
		         <%}%>
		          <b class="pageword">
		                  &nbsp;&nbsp;共<%=pageTot%>页&nbsp;&nbsp;
		          </b>
		          
		          <b class="pageword">
		             	 向第<input type="text" id="pageTo" size="1">页
		          </b>
		          
		          <a href="javascript:void(0)" class="button_page" onclick="myDumpTo('<%=pageTot%>', 'userRequest?userRequest=userTaskNoParticipate&page=')"><span>跳转</span></a>
	          </div>
		  <!-- 加入分页的按钮  -->
		</div><!-- /#two_col -->
		<div class="grid_5 news" id="one_col">
			<h2>如何进行一个任务的分派？</h2>
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