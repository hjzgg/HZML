<%@page import="java.util.Collection"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.UserQuestionsAndQuestions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户题单</title>
<link rel="stylesheet" href="css/960.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/userquestionsandquestions.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.all.js"></script>
<script type="text/javascript" src="js/TitilliumText15L_100-TitilliumText15L_400.font.js"></script>
<script src="js/photo-slide.js" type="text/javascript"></script>
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
			<a href="index.jsp"><img src="images/logo.gif" title="在线软件工程" /></a>
		</div>
		<div class="clear"></div>
		
		<div class="grid_16" id="navigation">
			<ul>
				<ul>
				<li><a href="index.jsp"><span>主页</span></a></li>
				<% 
					String peopleType = (String)session.getAttribute("peopleType");
					if(peopleType!=null)
						if(peopleType.equals("user")){
				%>
							<li><a href="userRequest?userRequest=userTaskNoParticipate"><span>用户任务</span></a></li>
							<li><a href="noviceTask.jsp" class="current"><span>新手学习</span></a></li>
				<%
						}  
				%>
				<li><a href="about.jsp"><span>关于</span></a></li>
				<li><a href="projects.jsp"><span>团队成员</span></a></li>
				<li><a href="contact.jsp"><span>联系</span></a></li>
			</ul>
			</ul>
			<div id="triSlideContainer"><img src="images/currentarrow.gif" alt="arrow" /></div>
		</div>
		<div class="grid_16" id="display">
			<ul id="subNavigation">
				<li><a href="noviceTask.jsp">新手学习</a></li>
				<li><a href="questionsAction!getUserQuestionsAndQuestions" class="current">查看已做题目</a></li>
				<li><a href="shaizi.jsp"><img src="images/骰子.png" height="12" width="12">&nbsp;随机做题</a></li>
			</ul>
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
			
	<div class="container_16" id="content">
	
		<div class="grid_11 content" id="two_col">
			 <div id="wrap">
				<div id="slide">
					<img id="loading" src="images/loading.gif"/>
					<% 
						List<UserQuestionsAndQuestions> list = (List<UserQuestionsAndQuestions>)session.getAttribute("getUserQuestionsAndQuestions");
						String[] simpleLevel = {"未知", "简单", "较难", "难"};//题目的简易程度
						String[] choose={"", "A", "B", "C", "D"};
						int cntPage = 0;//一共有多少的题单
						if(list != null){
							Collections.sort(list);
							for(int i=0; i<list.size(); ){
								++cntPage;
					%>
								<div id="p<%=cntPage%>">
									<div>
										<center><b>题单<%=cntPage %>&nbsp;&nbsp;本次得分:<b style="color:red"><%=list.get(i).getScore() %>分</b></b></center>
										<br>
									 	<%
									 		int k = 0;
									 		for(int j=i; j<list.size(); ++j){
									 			if(j!=i && list.get(j).getPageQuestionId() != list.get(j-1).getPageQuestionId()){
									 				i=j;
									 				break;
									 			}
									 			UserQuestionsAndQuestions userQuestionsAndQuestions = list.get(j);
									 			int optionSelect = userQuestionsAndQuestions.getOptionSelect();
									 			int optionCorrect = userQuestionsAndQuestions.getOptionCorrect();
									 			if(j==list.size()-1) i=j+1;
									 	%>
									 			<%=++k %>.<%=userQuestionsAndQuestions.getQuestionMsg() %><br>
									 			A.<%=userQuestionsAndQuestions.getOptionA() %><br>
									 			B.<%=userQuestionsAndQuestions.getOptionB() %><br>
									 			C.<%=userQuestionsAndQuestions.getOptionC() %><br>
									 			D.<%=userQuestionsAndQuestions.getOptionD() %><br>
									 			简易程度:<%=simpleLevel[userQuestionsAndQuestions.getDifficultDegree()] %><br>
									 			选择:<%=choose[optionSelect] %>
									 			<b style="color:red">正确:<%=choose[optionCorrect] %></b><br>
									 			<br>
									 	<%
									 		}
									 	%>  
									</div>
								</div>
					<%
							}
						}
					%>
					 
				</div> <!-- end wrap -->
			
				<div id="previous"><b>Previous</b></div>
				<div id="next"><b>Next</b></div>
			</div>
		</div><!-- /#two_col -->
		<div class="grid_5 news" id="one_col">
			<h2>如何进行一个任务的分派？</h2>
			<div id="testimonials">
				<div>
					<div>
					"首先将开发的任务进行描述，如需求分析，功能模块的划分， 开发时间限制，费用等等，然后将任务发布出去！"
					</div>
					<div class="by"><a href="javascript:">下一步</a></div>
				</div>
				<div>
					<div>
					"一定的时间之后可以查看自己的任务是否一定被人接手。"
					</div>
					<div class="by"><a href="javascript:">下一步</a></div>
				</div>
				<div>
					<div>
					"通过查看完成的任务，判断是否符合自己的需求并结束任务！"
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