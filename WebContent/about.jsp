<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>关于我们</title>
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
p{ 
	text-indent: 2em; /*em是相对单位，2em即现在一个字大小的两倍*/ 
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
							<li><a href="messageAction!getAllContactMsg"><span>管理员</span></a></li>
				<%
						}
				%>
				<li><a href="about.jsp" class="current"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="about.jsp" class="current">关于我们</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
		
		<div class="grid_11 content" id="two_col">
			<h2>关于我们</h2>
			<p>
			<img src="images/aboutus.jpg" title="关于us" />
			</p>
			<p style="padding-left: 22px">
			一个优秀的团队，应该受到关注的应该是质量的高低问题、集成的效率问题、功能验证的效率问题……这些有人买单的问题，而不是开发与测试的分工、如何明确责任、如何对双方进行绩效考核等没人买单的问题。
			</p>
			<p>
			敏捷开发团队的外在行为是“结果导向”，而内在支撑则是“团队工作”(TeamWork)。所谓结果导向，就是直指结果，而不拘泥于形式。
			</p>
			<p>
			可以被拘泥的“形式”各式各样，比如方式、方法、流程、文档、部门、分工、职责……都是形式。这些形式本来是设立来帮助实现更好的结果的，但是如果拘泥于此，则可能起到反作用。
			</p>
			
			<b>&nbsp;&nbsp;&nbsp;&nbsp;敏捷开发遵循的原则:</b>
			<ul>
				<li>工作的软件是首要的进度度量标准。</li>
				<li>简单是最根本的。</li>
				<li>最好的构架、需求和设计出于自组织团队。</li>
				<li>每隔一定时间，团队会在如何才能更有效地工作方面进行反省，然后相应地对自己的行为进行调整。</li>
				<li>在团队内部，最具有效果并富有效率的传递信息的方法，就是面对面的交谈。</li>
			</ul> 
		</div><!-- /#two_col -->
		<div class="grid_5 news" id="one_col">
			<h2>敏捷开发思想</h2>
			<div id="testimonials">
				<div>
					<div>
					敏捷型方法是“面向人”的(people-oriented) 而非“面向过程”的 (process-oriented)。
					</div>
					<div class="by">First - <a href="#">敏捷开发</a></div>
				</div>
				<div>
					<div>
					在一个团队之间，交流是最重要的，实践证明面对面的实时的交流是最有效的。
					</div>
					<div class="by">Second - <a href="#">敏捷开发</a></div>
				</div>
				<div>
					<div>
					 应该侧重于提高团队的技能而不是扩充团队。
					</div>
					<div class="by">Third - <a href="#">敏捷开发</a></div>
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
