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
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
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
		
		<div class="grid_16" id="logo">
			<a href="index.jsp"><img src="images/logo.gif" alt="ChillyBlues" /></a>
		</div>
		<div class="clear"></div>
		
		<div class="grid_16" id="navigation">
			<ul>
				<li><a href="index.jsp"><span>主页</span></a></li>
				
				<li><a href="#"><span>用户任务</span></a></li>
				<li><a href="#"><span>公司管理</span></a></li>
				<li><a href="#"><span>管理员</span></a></li>
				<li><a href="#"><span>新手学习</span></a></li>
				
				<li><a href="about.jsp"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp" class="current"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="contact.jsp" class="current">get in touch with us</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		
		<div class="grid_11 content contact" id="two_col">
			<h2>联系我们</h2>
			<p>
				带有<span>*</span>的选项必填
			</p>
				<form action="#" method="post" id="contactForm">
					<br/>
					<div>
						<label>姓名:<span>*</span></label>
						<input type="text" name="name" id="name"/>
					</div>
					<div>
						<label>邮箱:<span>*</span></label>
						<input type="text" name="email" id="email"/>
					</div>
					<div>
						<label>组织:<span>*</span></label>
						<input type="text" name="org" id="org"/>
					</div>
					<div>
						<label>消息:<span>*</span></label>
						<textarea name="message" rows="10" cols="20" id="message"></textarea>
					</div>
					<a class="button" href="#" onclick="$('#contactForm')[0].submit(); return false;" id="send"><span>send message</span></a>
			</form>
						
		</div><!-- /#left -->
		<div class="grid_5 news" id="one_col">
			<h2>联系 information</h2>
			<p>
			<b>ChillyBlues Web Builders</b><br/>
			Somewherestreet 22<br/>
			12345 Somewhere Town<br/><br/>
			phone: 000 123 456 789<br/>
			@: <a href="#">info@chillyblues.com</a>
			</p>
		</div><!-- /#right -->
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
