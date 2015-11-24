<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>团队成员</title>
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<style type="text/css">

body {
	background: #f9fafb url(images/pages/bg.gif) top repeat-x;
}

.hjzggul {
	list-style: none;
    float: left;
    margin: 0px 40px 0px 0px;
    padding: 0px;
    display: block;
}

.hjzggul li{
	display: block;
    height: 25px;
    color: #27415a;
    background: url(images/ball_orange.gif) left top no-repeat;
    background-position-y: 6px;
    padding-left: 20px;
}
</style>
<script type="text/javascript">
Cufon.replace('http://chillyblues.chillyorange.com/h1');
Cufon.replace('http://chillyblues.chillyorange.com/h2');
$(document).ready(function(){

	$('#port1 div p').animate({
		"opacity" : "0.9"
	});

	$('#port1 div').hover(function(){$(this).children('p').slideDown();}, function(){$(this).children('p').slideUp();})
	
});
$(window).load(function () {
  	setInterval("corperationImage()", 300);
});
</script>
<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
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
							<li><a href="noviceTask.jsp"><span>新手学习</span></a></li>
				<%
						} else if(peopleType.equals("company")){
				%>
							<li><a href="distributionOfCompany.jsp"><span>公司管理</span></a></li>
				<%
						} else if(peopleType.equals("manager")){
				%>
							<li><a href="messageAction!getAllContactMsg"><span>管理员</span></a></li>
				<%
						}
				%>
				<li><a href="about.jsp"><span>关于</span></a></li>
				<li><a href="projects.jsp" class="current"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="projects.jsp">团队成员</a></li>
				<li><a href="projects2.jsp" class="current">成员简介</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		<div class="grid_16 content" id="three_col">
			<div id="port2">
				<div>
					<a href="http://www.cnblogs.com/hujunzheng/"><img width="280px" height="180px" src="images/胡峻峥.jpg" title="胡峻峥" /></a>
					<p>
						<b>HJZGG---越努力，越幸运!</b>
						我是胡峻峥，我是本项目的经理！
					</p>
					<p><b>主要负责:</b></p>
					<ul class="hjzggul">
						<li>网站框架</li>
						<li>技术支持</li>
						<li>后台处理</li>
					</ul>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/冷茂顺.jpg" title="冷茂顺" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/黎国健.jpg" title="黎国健" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/林志宝.jpg" title="林志宝" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/刘晓康.jpg" title="刘晓康" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/马永花.jpg" title="马永花" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/张丹阳.jpg" title="张丹阳" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/张凯华.jpg" title="张凯华" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
			<div id="port2">
				<div>
					<a href="http://www.flashden.net/"><img width="280px" height="180px" src="images/张康.jpeg" title="张康" /></a>
					<p>
					<b>HJZGG---越努力，越幸运!</b>
					大家好，我是hjzgg! Thank you!
					</p>
				</div>
			</div>
		</div><!-- /#left -->
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
