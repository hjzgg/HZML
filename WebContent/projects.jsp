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
</style>
<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
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
				<li><a href="projects.jsp" class="current">团队成员</a></li>
				<li><a href="projects2.jsp">成员简介</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		<div class="grid_16 content" id="three_col">
			<div id="port1">
				<div><img width="280px" height="180px" src="images/胡峻峥.jpg" title="胡峻峥" /><p><b>永不言弃</b> 越努力，越幸运! <a href="http://www.cnblogs.com/hujunzheng/">博客主页</a></p></div>
				<div><img width="280px" height="180px" src="images/冷茂顺.jpg" title="冷茂顺" /><p><b>做好自己</b>用爱心来做事，用感恩的心做人 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/黎国健.jpg" title="黎国健" /><p><b>奋斗不止</b>停止奋斗，生命也就停止了 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/林志宝.jpg" title="林志宝" /><p><b>勇攀高峰</b>成功者绝不给自己软弱的借口 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/刘晓康.jpg" title="刘晓康" /><p><b>海阔天空</b>有能力的人才能谈自由 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/马永花.jpg" title="马永花" /><p><b>慎思勤勉</b>失之毫厘谬以千里 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/张凯华.jpg" title="张凯华" /><p><b>懂得感恩</b>相互了解是朋友，相互理解是知己 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/张丹阳.jpg" title="张丹阳" /><p><b>追逐理想</b>理想的路总是为有信心的人预备着 <a href="#"></a></p></div>
				<div><img width="280px" height="180px" src="images/张康.jpeg" title="张康" /><p><b>志在四方</b>人各有志，自己的路自己走 <a href="#"></a></p></div>
			</div>
		</div><!-- /#left -->
		<div class="clear"></div>
		
	</div><!-- /#content -->
		
	<div id="footerwrapper">
		
		<div class="container_16">
		
			<div class="grid_16" id="footer">
			
			<span id="address"><b>ChillyBlues Web Solutions</b> - Somewherestreet 22 12345 Somewhere Town - phone: 000 123 456 789 - @: info@chillyblues.com</span>
			
				<div>
					<ul class="services">
						<li>web design</li>
						<li>design customization</li>
						<li>CMS systems</li>
					</ul>
					<ul class="services">
						<li>Wordpress themes/setups</li>
						<li>Slicing PSD's into HTML/WP</li>
						<li>code/html optimization</li>
					</ul>
					<ul class="links" id="first">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="about.jsp">关于</a></li>
						<li><a href="http://www.cssmoban.com/">Portfolio</a></li>
					</ul>
				</div>
			 
			</div>
			<div class="clear"></div>
			
		</div>
		
	</div><!-- /#footerwrapper -->
<script type="text/javascript"> Cufon.now(); </script>

</body>
</html>
