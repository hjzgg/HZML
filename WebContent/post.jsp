<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>This is a news article - News section | ChillyBlues Web Builders</title>
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
	
	$('#commentForm input, #commentForm textarea').focus(function(){ $(this).stop().animate({backgroundColor: "#fff3c5"}, 500), $(this).css("borderColor", "#f89d1c") })
	
	$('#commentForm input, #commentForm textarea').blur(function(){ $(this).stop().animate({backgroundColor: "#fffff"}, 500), $(this).css("borderColor", "#97b2cd") });
	
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
				<li><a href="blog.jsp">chillyblues news &amp; events</a> ></li>
				<li><a href="post.jsp" class="current">This is a news article</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		
		<div class="grid_11 content" id="two_col">
			<div class="blogexcerpt">
				<div class="blogTop">
					<h2>This is a news article</h2>
					<div class="cal">
						<div class="month">aug</div>
						<div class="date">26</div>
					</div>
				</div>
				<div class="clear"></div>
				<p>
				<img src="images/关于us.jpg" alt="关于us" />
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus mattis convallis turpis. In hac habitasse platea	dictumst. Aliquam dignissim tincidunt nunc nec venenatis. Aenean non tellus nibh. Sed non feugiat justo. Donec auctor auctor massa sit amet aliquet. Vivamus lacus augue, sagittis eget pretium sed, dapibus varius turpis. Donec tincidunt blandit iaculis.
				</p>
				<p>
				Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Suspendisse at neque lectus. Nunc eleifend elit eros. Suspendisse elit neque, blandit quis congue eu, sagittis et ipsum. Curabitur auctor dignissim porttitor. Sed laoreet est nec est placerat sodales sit amet id augue. Sed non lorem nisi. Etiam vitae pretium purus. Pellentesque interdum leo a nulla volutpat vel aliquet leo vehicula. 
				</p>
			</div>
			
			<div><h3>3 comments</h3></div>
			
			<div class="comment">
				<img src="images/buddy.gif" alt="avatar" />
				<div class="meta">On Saturday 5 September by <a href="#">John Doe</a></div>
				<div class="cm">
				Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Suspendisse at neque lectus. Nunc eleifend elit eros. Suspendisse elit neque, blandit quis congue eu, sagittis et ipsum. Curabitur auctor dignissim porttitor. Sed laoreet est nec est placerat sodales sit amet id augue. Sed non lorem nisi.
				</div>
				<div class="clear"></div>
			</div>
			<div class="comment1">
				<img src="images/buddy.gif" alt="avatar" />
				<div class="meta">On Saturday 5 September by <a href="#">John Doe</a></div>
				<div class="cm">
				Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Suspendisse at neque lectus. Nunc eleifend elit eros. Suspendisse elit neque, blandit quis congue eu, sagittis et ipsum. Curabitur auctor dignissim porttitor. Sed laoreet est nec est placerat sodales sit amet id augue. Sed non lorem nisi.
				</div>
				<div class="clear"></div>
			</div>
			<div class="comment">
				<img src="images/buddy.gif" alt="avatar" />
				<div class="meta">On Saturday 5 September by <a href="#">John Doe</a></div>
				<div class="cm">
				Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Suspendisse at neque lectus. Nunc eleifend elit eros. Suspendisse elit neque, blandit quis congue eu, sagittis et ipsum. Curabitur auctor dignissim porttitor. Sed laoreet est nec est placerat sodales sit amet id augue. Sed non lorem nisi.
				</div>
				<div class="clear"></div>
			</div>
			
			<div id="commentForm">
				<div id="leave"><b>Leave a comment</b></div>
				<form action="#">
					<br/>
					<div>
						<label>name:</label>
						<input type="text" />
					</div>
					<div>
						<label>email:</label>
						<input type="text" />
					</div>
					<div>
						<label>comment:</label>
						<textarea cols="20" rows="8"></textarea>
					</div>
					<a class="button" id="saveComment"><span>Save comment</span></a>
				</form>
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
