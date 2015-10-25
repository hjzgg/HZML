<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.DevelopToPublishMsg"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Get in touch with us | ChillyBlues Web Builders</title>
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

Cufon.replace('http://chillyblues.chillyorange.com/h1');
Cufon.replace('http://chillyblues.chillyorange.com/h2');

$(document).ready(function(){
	
	$('#contactForm input, #contactForm textarea').focus(function(){ $(this).stop().animate({backgroundColor: "#fff3c5"}, 500), $(this).css("borderColor", "#f89d1c") })
	
	$('#contactForm input, #contactForm textarea').blur(function(){ $(this).stop().animate({backgroundColor: "#fffff"}, 500), $(this).css("borderColor", "#97b2cd") });
	
})

$('#main').ready(function(){
	
	//process possible form errors
})

</script>
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
						<li><a href="showAllTask.jsp">任务展示</a></li>
						<li><a href="about.jsp">关于</a></li>
						<li><a href="contact.jsp">联系</a></li>
					</ul>
				</div><!-- /#qsmMiddle -->
				<div id="qsmBottom"></div>
			</div>
		</div>
		
		<div class="grid_16" id="logo">
			<a href="index.jsp"><img src="images/logo.gif" alt="ChillyBlues" /></a>
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
							<li><a href="#"><span>新手学习</span></a></li>
				<%
						} else if(peopleType.equals("company")){
				%>
							<li><a href="distributionOfCompany.jsp"><span>公司管理</span></a></li>
				<%
						} else if(peopleType.equals("manager")){
				%>
							<li><a href="messageAction!getAllContactMsg" class="current"><span>管理员</span></a></li>
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
				<li><a href="distributionOfCompany.jsp">分配任务</a></li>
				<li><a href="allTask">查看任务</a></li>
				<li><a href="allFinishedTask">已完成任务</a></li>
				<li><a href="developToPublishMsgAction!getAllDevelopToPublishMsg" class="current">消息管理</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		
		<div class="grid_11 content contact" id="two_col">
			<h2>最近消息如下:</h2>
			<%	
			    //////////////////////////////分页代码
				int pageCur=0, pageBegin=0, pageTot=0, num= 0;
			    final int pageSize = 6;//每一面显示的任务的数目
				List<DevelopToPublishMsg> contactList = (List<DevelopToPublishMsg>)session.getAttribute("getAllDevelopToPublishMsg");
			    num = contactList.size();//总个数 
			    pageTot = num%pageSize == 0 ? num/pageSize : num/pageSize+1;//总页数
			    String curPage  = request.getParameter("page");//当前定位的页码
			    if(curPage == null) pageCur = 1; 
			    else pageCur = Integer.valueOf(curPage);
			    pageBegin = pageCur-5;
			    if(pageBegin < 1) pageBegin = 1;
			    int i = (pageCur-1)*pageSize;
				//////////////////////////////////
			    if(num>0)
					for(int cnt=0; cnt<pageSize && i<contactList.size(); ++i, ++cnt){
						DevelopToPublishMsg contact = contactList.get(i);
			%>
						<div class="class1">
							<div style="background-image:url('./images/color.gif'); height: 25px">
								消息<%=i+1%>&nbsp;&nbsp;
								<b>时间:&nbsp;<%=contact.getMsgTime() %></b>
								&nbsp;&nbsp;&nbsp;&nbsp;
 								<%
									if(contact.getState()!=0){
								%>
									<b>处理状态:&nbsp;已经处理</b>
								<% } else { %>
									<b>处理状态:&nbsp;<b style="color:red">未处理</b></b>
								<%
								   }
								%>
								<span style="float:right; cursor:pointer;" id="<%=i+"stateBut"%>" onClick="$use('<%=i+"contentx"%>','<%=i+"stateBut"%>')">展开</span>
							</div>
		       				<div class="class1content" id="<%=i+"contentx"%>">
								<form action="mailResponse.jsp" method="post" id="contactForm" name="mailMsg">
									<br/>
									<input type="hidden" name="msgId" value="<%=contact.getMsgId()%>">
									<div>
										<label>消息来自任务:</label>
										<input type="text" name="taskName" id="taskName" value="<%=contact.getTaskName() %>" readonly="readonly"/>
									</div>
									 
									<div>
										<label>联系人邮箱:<span>*</span></label>
										<input type="text" name="email" id="email" value="<%=contact.getEmail() %>" readonly="readonly"/>
									</div>
									
									<div>
										<label>消息:<span>*</span></label>
										<textarea name="message" rows="10" cols="20" id="message" readonly="readonly"><%=contact.getMsg() %></textarea>
									</div>
									 
									<a class="button" style="float:right;" href="javascript:void(0)" onclick="publisherEnterChatRoom('<%=(String)session.getAttribute("peopleName") %>', '<%=contact.getTaskId()%>', '<%=contact.getMsgId()%>');"><span>立刻交流</span></a>
									 
								</form>
							</div>
						</div>
		<% } %>
		
		<!-- 加入分页的按钮  -->
		<div style="margin-top: 20px">
			<%if(pageCur!=1){%>
				  <a href="javascript:void(0)" class="button_page" onclick="myGoTo('showAllTask.jsp?page=<%=pageCur-1%>')"><span>上一页</span></a>	
	         <%}%>
	         <% 
	         	int j;
	         	for(i=pageBegin, j=1; j<=10 && i<=pageTot; ++i, ++j) {%>
	             <%if(i == pageCur){%>
	                  <b class="pageword" style="color:red;">
	                      <%=i%>
	                  </b>
	             <%} else {%>
	              	  <a href="javascript:void(0)" class="button_page" onclick="myGoTo('showAllTask.jsp?page=<%=i%>')"><span><%=i%></span></a>	
	             <%}%>
	         <% } %>                
	
	         <%if(pageCur!=pageTot){%>
	                 <a href="javascript:void(0)" class="button_page" onclick="myGoTo('showAllTask.jsp?page=<%=pageCur+1%>')"><span>下一页</span></a>
	         <%}%>
	          <b class="pageword">
	                  &nbsp;&nbsp;共<%=pageTot%>页&nbsp;&nbsp;
	          </b>
	          
	          <b class="pageword">
	             	 向第<input type="text" id="pageTo" size="1">页
	          </b>
	          
	          <a href="javascript:void(0)" class="button_page" onclick="myDumpTo('<%=pageTot%>', 'showAllTask.jsp?page=')"><span>跳转</span></a>
          </div>
		  <!-- 加入分页的按钮  -->
							
		</div><!-- /#left -->
		
		<div id="mainDeveloperChatRoom" style="text-align:center; display:none; width:640px; height:700px; background-color:white;z-index:10; position: fixed; left:300px; top:10px">
			<div id="publisherChatRoom" style="text-align:center; width:640px; height:600px; ">
			
			</div> 
			<div style="text-align:center; width:640px; height:150px; ">
				<a class="button" style="float:right; margin-right: 10px; margin-top: 13px;" href="javascript:void(0)" onclick="contactToDeveloperFun();" id="send"><span>关闭</span></a>
				<a class="button" style="margin-left: 10px; margin-top: 13px;" href="javascript:void(0)" onclick="publisherTaskCheckFinish()" id="send"><span>审核完毕</span></a>
			</div>
		</div> 
		
		<div class="grid_5 news" id="one_col">
			<h2>联系</h2>
			<p>
			<b>在线软件工程团队</b><br/>
			河南省高新区科学大道100号<br/>
			郑州大学新校区<br/><br/>
			phone: 15670637914<br/>
			e-mail: <a href="#">271413190@qq.com</a>
			</p>
		</div><!-- /#right -->
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
