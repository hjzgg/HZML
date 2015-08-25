<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.Task"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>在线软件工程</title>
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!--[if IE]>
<link rel="stylesheet" href="css/ie_slidefix.css" type="text/css" />
<![endif]-->
<style type="text/css">

body {
	background: #f9fafb url(images/bg.gif) top repeat-x;
}

</style>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.all.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.easing.names.js"></script>
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript">

countdownFrom = 15;

slideSpeed = 2000;
slideTimeout = 10000;



/* dont' edit anyting below here unless you're sure 关于 what you're doinf  */


$(window).load(function () {
  	getStarted()
});

Cufon.replace('http://chillyblues.chillyorange.com/h1');
Cufon.replace('http://chillyblues.chillyorange.com/h2');

slidesPause = 0;

function getStarted(){
   	
   	if(countdownFrom > 0) {
   	
		cdown = setInterval(function(){
	
			if(countdownFrom == 0) {
			
				clearInterval(cdown);
			
				$('#rightCorner').click(function(){
					
					if(slidesPause == 0) {
						
						$('#slides').cycle('pause');
						$('#rightCorner').css("background", "url(../images/slideNavRight.gif) bottom no-repeat");
						slidesPause = 1;
						
					} else {
							
						$('#slides').cycle('resume');
						$('#rightCorner').css("background", "url(../images/slideNavRight.gif) top no-repeat");
						slidesPause = 0;
						
					}	
				});
			
				//hide beforeSlideshow
			
				$('#displayIn').animate({opacity:0}, 2000, function(){
				
					$('#displayIn').css("background", "url(images/mainDisplayBG.jpg) no-repeat bottom");
				
					$('#beforeSlideshow').css("display", "none");
					$('#slideshow').css("display", "block");
				
					$('#displayIn').animate({opacity:1}, 3000);
				
					//configfure spacer element in slnavBG
				
					//activate slideshow
					$('#slides').cycle({ 
    					fx:     'scrollHorz',
    					speed:	slideSpeed,
    					timeout: slideTimeout, 
    					delay:  -2000,
    					next:   '#next', 
    					prev:   '#previous',
    					pager:  '#slnav',
    					easing: 'backinout'
   					});
   				
   					$('#slnavSpacer').css("width", 880 - (24*$('div#slides>div.slide').length));
				
					$('.slide').css("background", "none");
				})
			
			} else {
				countdownFrom = countdownFrom - 1;
				$('#count')[0].innerHTML = countdownFrom;
			}
	
		}, 1000);
	
	} else if(countdownFrom == -1) {
	
		$('#rightCorner').click(function(){
			if(slidesPause == 0) {
				$('#slides').cycle('pause');
				$('#rightCorner').css("background", "url(../images/slideNavRight.gif) bottom no-repeat");
				slidesPause = 1;
			} else {
				$('#slides').cycle('resume');
				$('#rightCorner').css("background", "url(../images/slideNavRight.gif) top no-repeat");
				slidesPause = 0;
			}	
		});
		
		
		$('#displayIn').css("background", "url(images/mainDisplayBG.jpg) no-repeat bottom");
				
		$('#beforeSlideshow').css("display", "none");
		$('#slideshow').css("display", "block");
		
		//activate slideshow
		$('#slides').cycle({ 
    		fx:     'scrollHorz',
    		speed:	slideSpeed,
    		timeout: slideTimeout, 
    		delay:  -2000,
    		next:   '#next', 
    		prev:   '#previous',
    		pager:  '#slnav',
    		easing: 'backinout'
   		});
   				
   		$('#slnavSpacer').css("width", 880 - (24*$('div#slides>div.slide').length));
				
		$('.slide').css("background", "none");
	
	} else {
		
		$('#countdown').css("visibility", "hidden");
		
	}
}

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
		<div class="clear"></div>
		
		<div class="grid_16" id="logo">
			<a href="index.jsp"><img src="images/logo.gif" title="HZML在线软件开发工程" /></a>
		</div>
		<div class="clear"></div>
		
		<div class="grid_16" id="navigation">
			<ul>
				<li><a href="index.jsp" class="current"><span>主页</span></a></li>
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
		<div class="clear"></div>
		
		<div class="grid_16" id="mainDisplay">
			<div id="displayIn">
				<div id="beforeSlideshow">
					<div id="countdown">即将进入开发图解 &nbsp;&nbsp;<span id="count"><script type="text/javascript">document.write(countdownFrom)</script></span></div>
					<h1>在线软件工程,等待你的加入!</h1>
					<div class="clear"></div>
					<marquee hspace="50px" width="800px"><h2>在这里，你可找到志同道合的人共同完成软件项目的开发。这里是开发者的天堂。追求卓越是我们的共同目标!</h2></marquee>
					<h2 style="color: red">温馨提示:</h2>
					<h2 style="margin-left: 0px;">请熟练掌握敏捷开发的方法,这样才能跟紧大牛们的进度。对于新手请认真做完新手任务!</h2>
					<div class="clear"></div>
					<div id="buttons">
						<a href="about.jsp" class="button" id="leftButton"><span>关于我们</span></a>
						<a href="#" class="button" id="rightButton"><span>自由询问</span></a>
					</div>
				</div>
			
				<div id="slideshow">
					<div id="slideNav">
						<div id="leftCorner"></div>
						<div id="rightCorner"></div>
						<div id="slnav"><div id="slnavSpacer"></div></div>
					</div>
					<div>
						<div id="previous"></div>
						<div id="next"></div>
						<div id="slides"><!-- this is the main container for your slides -->
						
							<div class="slide">
								<div class="caption">
									<h2>Themeforest1</h2>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipisc ing elit. Vivamus mattis convallis turpis. In hac habitasse platea dictumst. Aliquam dignis sim tinci dunt nunc nec venenatis.
									</p>
								</div>
								<div class="sImCon">
									<img src="slideshow/slide1.jpg" alt="slide1" />
								</div>
							</div>
							<div class="slide">
								<div class="caption">
									<h2>Themeforest2</h2>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipisc ing elit. Vivamus mattis convallis turpis. In hac habitasse platea dictumst. Aliquam dignis sim tinci dunt nunc nec venenatis.
									</p>
								</div>
								<div class="sImCon">
									<img src="slideshow/slide1.jpg" alt="slide1" />
								</div>
							</div>
							<div class="slide">
								<div class="caption">
									<h2>Themeforest3</h2>
									<p>
									Lorem ipsum dolor sit amet, consectetur adipisc ing elit. Vivamus mattis convallis turpis. In hac habitasse platea dictumst. Aliquam dignis sim tinci dunt nunc nec venenatis.
									</p>
								</div>
								<div class="sImCon">
									<img src="slideshow/slide1.jpg" alt="slide1" />
								</div>
							</div>
							<div class="slide">
								<div class="caption">
									<h2>Themeforest1</h2>
									<p>
									Lorem ipsum dolor sit amet, consectetur adipisc ing elit. Vivamus mattis convallis turpis. In hac habitasse platea dictumst. Aliquam dignis sim tinci dunt nunc nec venenatis.
									</p>
								</div>
								<div class="sImCon">
									<img src="slideshow/slide1.jpg" alt="slide1" />
								</div>
							</div>
							<div class="slide">
								<div class="caption">
									<h2>Themeforest2</h2>
									<p>
									Lorem ipsum dolor sit amet, consectetur adipisc ing elit. Vivamus mattis convallis turpis. In hac habitasse platea dictumst. Aliquam dignis sim tinci dunt nunc nec venenatis.
									</p>
								</div>
								<div class="sImCon">
									<img src="slideshow/slide1.jpg" alt="slide1" />
								</div>
							</div>
					
						</div><!-- /#slides -->
					
					</div><!-- /#slideshow -->
					
				</div><!-- /#displayIn -->
			
			</div>
		</div><!-- /#mainDisplay -->
		<div class="clear"></div>
		
	</div><!-- /#main -->
		<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >ç½é¡µæ¨¡æ¿</a></div>	
	<div class="container_16" id="content">
		
		<div class="grid_11 content" id="two_col">
			<h2>在线软件工程: </h2>
			<p>
				<img src="images/aboutus.jpg" alt="关于us" />
				&nbsp;&nbsp;&nbsp;&nbsp;在线学软件工程，是为了提高软件开发的灵活性，方便性，秉持着敏捷开发的思路为开发者提供良好的开发环境。
				本网站为解决由于人力不足导致项目开发无法进行的问题。
      			  对于商业用户，通过这个平台可以发布自己的项目任务。对于开发人员，可以通过这个平台接受任务并找到志同道合的合作伙伴儿。
			</p>
			<p>
				本网站致力于：
				<div id="aboutthis">
					<ul>
						<li>提高效率，解决任务发布与获得的时效 </li>
						<li>实现多用户操作，权限管理，安全可靠</li>
						<li>实现在线系统管理信息化</li>
						<li>界面友好，操作简单实用，功能完善</li>
					</ul>
				</div>
			</p>
		</div><!-- /#left -->
		<div class="grid_5 news" id="one_col">
			<%
				List<Task> taskList = (List<Task>)session.getAttribute("theLastTaskRequestForIndex");
			%>
			<h2>最近发布的任务:</h2>
			<ul>
				<%
					for(int i=0; i<6 && i<taskList.size(); ++i){
				%>
						<li>
							<div class="cal">
								<div class="month">TASK</div>
								<div class="date"><%=i+1 %></div>
							</div>
							<a href="userRequest?userRequest=showNoParticipateTask&taskid=<%=taskList.get(i).getTaskid()%>" title="<%=taskList.get(i).getTaskName()%>"><%=taskList.get(i).getTaskName()%></a>
						</li>
				<%
					}
				%>
			</ul>
			<a href="showAllTask.jsp" id="moreNews">更多任务</a>
			
			<!--<h2>Testimonials</h2>
			<div id="testimonials">
				<div>
					<div>
					"Praesent vulputate euismod fringilla. Sed nec luctus lacus. Aliquam molestie massa at dolor ultrices dapibus. Donec non lorem nisi, ac lacinia nisl."
					</div>
					<div class="by">Someone - <a href="">Some organization</a></div>
				</div>
				<div>
					<div>
					"Fusce mollis justo id nisi volutpat laoreet. Vivamus sed sem vel ligula bibendum semper euismod et lacus. Suspendisse potenti. Proin magna risus."
					</div>
					<div class="by">Someone else - <a href="">Some organization</a></div>
				</div>
				<div>
					<div>
					"Praesent vulputate euismod fringilla. Sed nec luctus lacus. Aliquam molestie massa at dolor ultrices dapibus. Donec non lorem nisi, ac lacinia nisl."
					</div>
					<div class="by">Someone - <a href="">Some organization</a></div>
				</div>
			</div>-->
			
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
