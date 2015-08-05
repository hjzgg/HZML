<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>News section | ChillyBlues Web Builders</title>
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
				
				<li><a href="#" class="current"><span>用户任务</span></a></li>
				<li><a href="#" class="current"><span>公司管理</span></a></li>
				<li><a href="#" class="current"><span>管理员</span></a></li>
				<li><a href="#" class="current"><span>新手学习</span></a></li>
				
				<li><a href="about.jsp"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="blog.jsp" class="current">chillyblues news &amp; events</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		
		<div class="grid_11 content" id="two_col">
			<div class="blogexcerpt">
				<div class="blogTop">
					<h2><a href="post.jsp">This is a news article</a></h2>
					<div class="cal">
						<div class="month">aug</div>
						<div class="date">26</div>
					</div>
				</div>
				<p>
				<img src="images/关于us.jpg" alt="关于us" />
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus mattis convallis turpis. In hac habitasse platea	dictumst. Aliquam dignissim tincidunt nunc nec venenatis. Aenean non tellus nibh. Sed non feugiat justo. Donec auctor auctor massa sit amet aliquet. Vivamus lacus augue, sagittis eget pretium sed, dapibus varius turpis. Donec tincidunt blandit iaculis.
				</p>
				<p>
				Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Suspendisse at neque lectus. Nunc eleifend elit eros. Suspendisse elit neque, blandit quis congue eu, sagittis et ipsum. Curabitur auctor dignissim porttitor. Sed laoreet est nec est placerat sodales sit amet id augue. Sed non lorem nisi. Etiam vitae pretium purus. Pellentesque interdum leo a nulla volutpat vel aliquet leo vehicula. 
				</p>
				<p>
				<a href="post.jsp">read more</a> | <a href="#">3 comments</a>
				</p>
			</div>
			<div class="blogexcerpt">
				<div class="blogTop">
					<h2><a href="post.jsp">This is a news article</a></h2>
					<div class="cal">
						<div class="month">aug</div>
						<div class="date">26</div>
					</div>
				</div>
				<p>
				<img src="images/关于us.jpg" alt="关于us" />
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus mattis convallis turpis. In hac habitasse platea	dictumst. Aliquam dignissim tincidunt nunc nec venenatis. Aenean non tellus nibh. Sed non feugiat justo. Donec auctor auctor massa sit amet aliquet. Vivamus lacus augue, sagittis eget pretium sed, dapibus varius turpis. Donec tincidunt blandit iaculis.
				</p>
				<p>
				Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Suspendisse at neque lectus. Nunc eleifend elit eros. Suspendisse elit neque, blandit quis congue eu, sagittis et ipsum. Curabitur auctor dignissim porttitor. Sed laoreet est nec est placerat sodales sit amet id augue. Sed non lorem nisi. Etiam vitae pretium purus. Pellentesque interdum leo a nulla volutpat vel aliquet leo vehicula. 
				</p>
				<p>
				<a href="post.jsp">read more</a> | <a href="#">3 comments</a>
				</p>
			</div>
		</div><!-- /#left -->
		<div class="grid_5 connect" id="one_col">
			<h2>Connect with us</h2>
			<ul>
			<li>
				<div>
					<img src="images/newspaper.gif" alt="newspaper" />
				</div>
				<a href="#">Subscribe to our newsletter</a>
			</li>
			<li>
				<div>
					<img src="images/rss.gif" alt="RSS" />
				</div>
				<a href="#">Subscribe to our news</a>
			</li>
			<li>
				<div>
					<img src="images/twitter.gif" alt="twitter" />
				</div>
				<a href="#">Follow us on Twitter</a>
			</li>
			</ul>
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
