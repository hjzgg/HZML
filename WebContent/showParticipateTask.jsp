<%@page import="com.hzml.entriy.Task" %>
<%@page import="com.hzml.entriy.TaskAppend" %>
<%@page import="com.hzml.entriy.TaskTeam" %>
<%@page import="com.hzml.entriy.Card" %>
<%@page import="com.hzml.entriy.UpdateWrok" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.TreeMap" %>
<%@page import="com.hzml.entriy.DevelopingParty" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>任务开发</title>
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
	#div_absolute {
		  position: absolute;
		  z-index:10;
		  left: 400px;
		  top: 800px;
		  width:450px;
		  height:350px;
		  display: none;
	}
	#uploadTaskOrgCode {
		  background-image: url("./images/loginbg.jpg");
		  position: absolute;
		  z-index:10;
		  left: 400px;
		  top: 800px;
		  width:450px;
		  height:160px;
		  display: none;
	}
</style>

</head>
<body>
	<% 
		Task task = (Task)session.getAttribute("showParticipateTask");
		String images[]={
			"",
			"./images/step/1.gif",
			"./images/step/2.gif",
			"./images/step/3.gif",
			"./images/step/4.gif",
			"./images/step/5.gif",
			"./images/step/6.gif",
			"./images/step/7.gif",
			"./images/step/8.gif",
			"./images/step/9.gif",
			"./images/step/10.gif",
			"./images/step/11.gif"
		};
		TaskAppend taskAppend = (TaskAppend)session.getAttribute("showParticipateTask_leader");
		List<DevelopingParty> developingPartyList = (List<DevelopingParty>)session.getAttribute("showParticipateTask_AllUser");
		List<TaskTeam> taskTeamList = (List<TaskTeam>) session.getAttribute("showParticipateTask_taskTeam");
		String state = null;
		switch(task.getState()){
			case 0: state="任务没有开始执行"; break;
			case 1: state="任务已经开始执行"; break;
			case 2: state="任务已经完成"; break;
			default: state="任务已经完成"; break;
		}
	%>		
	<div id="div_absolute">
	</div>
	<div id="uploadTaskOrgCode" > 
		<form action="#" method="get" id="contactForm">
			<center><p style="font-size: 20px; color: red">请选择项目的源代码(压缩包形式)进行上传:</p></center>
			<br>
			<div>
				<input style="width: 280px" type="file" name="TaskOrgCodFile" id="TaskOrgCodFile"/>
				<a style="float: right;  margin-right: 20px" class="button" href="javascript:void(0)" onclick="finishTaskAndSubmit('TaskOrgCodFile', '<%=task.getTaskid()%>')"><span>上传</span></a>
			</div>
		</form>
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
		</div>
		<div class="clear"></div>
		
	</div><!-- /#main -->
	
	<div class="container_16" id="content">
		<div class="grid_11 content" id="two_col">
			<h2>当前参与的任务:</h2>
			<div class="class1">
				<div style="background-image:url('./images/color.gif'); height: 25px;">
					<h1 style="font-size:19px; color:#434c55; float: left;">任务详细信息</h1>
					<span style="float:right; cursor:pointer;" id="stateBut" onClick="$use('contentx','stateBut')">展开</span>
				</div>
      			<div class="class1content" id="contentx">
					<form action="#" method="get" id="contactForm">
						<div>
							<label>发布者: </label>
							<input type="text" name="name" id="name" value="<%=task.getPublishName() %>" readOnly/>
						</div>
						<div>
							<label>任务发布时间: </label>
							<input type="text" name="publishTime" id="publishTime" value="<%=task.getPublishTime() %>" readOnly />
						</div>
						<div>
							<label>任务完成时间: </label>
							<input type="text" name="finishTime" id="finishTime" value="<%=task.getDevelopmentTime() %>"readOnly />
						</div>
						<div>
							<label>任务费用: </label>
							<input type="text" name="money" id="money" value="<%=task.getMoney() %>" readOnly/>
						</div>
						<div>
							<label>任务描述:</label>
							<textarea name="message" rows="10" cols="20" id="message" readOnly><%=task.getTaskDescription() %></textarea>
						</div>
						<div>
							<label>任务状态: </label> <!--完成 或者 正在进行中--> 
							<input type="text" style="color:red" name="state" id="state" value="<%=state %>" readOnly/>
						</div>
						<% 
							if(task.getState()==1 || task.getState()==2){
						%>
								<div>
									<label>任务开始时间: </label>
									<input type="text" name="beginTime" id="beginTime" value="<%=task.getBeginTime() %>" readOnly />
								</div>
								<div>
									<label>任务更新时间: </label>
									<input type="text" name="updateTime" id="updateTime" value="<%=task.getUpdateTime() %>" readOnly />
								</div>
								<div>
									<label>任务项目地址: </label>
									<input type="text" name="taskAddress" id="taskAddress" value="<%=task.getTaskAddress() %>" readOnly/>
								</div>
						<% 
							}
						%>
						<% 
							if(task.getState() == 2){
						%>
								<a class="button" style="float:right;" href="uR!fileDownLoad?fileName=<%=task.getTaskAddress() %>"><span>下载项目</span></a>
						<%
						    }
						%>
						<div style="padding-top: 20px;">
							<label>任务说明文档: </label>
							<input type="text" name="document" id="document" value="<%=task.getDocumentationAddress() %>" readOnly/>
						</div>
						<a class="button" style="float:right;" href="uR!fileDownLoad?fileName=<%=task.getDocumentationAddress() %>"><span>下载文档</span></a>
					</form>
				</div>
			</div>
			
			<% 
				if(task.getState()!=0){
			%>	
					<div class="class1"> <!-- 工作区  -->
						<div style="background-image:url('./images/color.gif'); height: 25px; ">
							<h1 style="font-size:19px; color:#434c55; float: left;">项目工作区</h1>
							<span style="float:right; cursor:pointer;" id="stateButx" onClick="$use('contentxx','stateButx')">展开</span>
						</div>
		      			<div class="class1content" id="contentxx">
		      				<form style="margin-top: 10px" action="#" method="post" enctype="multipart/form-data" name="contactForm" id="contactForm">
			      				<% 
									if(taskAppend.getTaskLeader().equals((String)session.getAttribute("peopleName"))){//当前是组长
								%>
				      					<div>
											<label>项目地址: </label>
											<input style="width: 280px" type="text" name="submitTaskAddress" id="submitTaskAddress" value="<%=task.getTaskAddress()%>"/>
											<a style="float:right;  margin-right: 40px" class="button" href="javascript:void(0)" onclick="saveTaskAddress('<%=task.getTaskid()%>', 'submitTaskAddress')"><span>保存</span></a>
										</div>
										<div style="padding-top: 20px;">
											<label>功能划分说明书: </label>
											<input style="width: 280px" type="text" name="projectPlan" id="projectPlan" value="<%=taskAppend.getTaskAllocationDoc()%>"/>
											<a style="float: right;  margin-right: 40px" class="button" href="uR!fileDownLoad?fileName=<%=taskAppend.getTaskAllocationDoc()%>"><span>下载</span></a>
											<br><br>
											<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
											<input style="width: 280px" type="file" name="upLoadProjectPlan" id="upLoadProjectPlan"/>
											<a style="float: right;  margin-right: 40px" class="button" href="javascript:void(0)" onclick="UpladFile('upLoadProjectPlan', '<%=task.getTaskid() %>')"><span>上传</span></a>
										</div>
								<%
									} else {
								%>
										<div>
											<label>项目地址: </label>
											<input type="text" name="taskAddress" id="taskAddress" value="<%=task.getTaskAddress()%>" readonly="readonly"/>
										</div>
										<div style="padding-top: 20px;">
											<label>功能划分说明书: </label>
											<input style="width: 280px" type="text" name="projectPlan" id="projectPlan" value="<%=taskAppend.getTaskAllocationDoc()%>" readonly="readonly"/>
											<a style="float: right; margin-right: 40px" class="button" href="uR!fileDownLoad?fileName=<%=taskAppend.getTaskAllocationDoc()%>"><span>下载</span></a>
										</div>
								<%
									}
								%>
							</form>
							<center>
								<hr style="border:5px dotted #33FFFF;border-bottom:0;border-right:0; border-left:0;width:550px;">
								<br>
								<h2>工作记录如下</h2>
							</center>
							
							<div id="updateworkcontent">
								<%
									Map<Integer, List<UpdateWrok>> mp = new TreeMap<Integer, List<UpdateWrok>>();
			      					List<UpdateWrok> updateWordList = (List<UpdateWrok>)session.getAttribute("showParticipateTask_AllUpdateWork");
			      					for(UpdateWrok updateWrok : updateWordList){
			      						int step = updateWrok.getTaskStep();
			      						if(mp.get(step) == null)
			      							mp.put(step, new ArrayList<UpdateWrok>());
			      						mp.get(step).add(updateWrok);
			      					}
			    					for(Integer i : mp.keySet()){
			    						if(i==taskAppend.getNextTaskStep() && task.getState()!=2) break;
			    						ArrayList<UpdateWrok> list = (ArrayList<UpdateWrok>)mp.get(i);
	      						%>
											<center><img src="<%=images[i] %>"/></center>
											<div id="updateworkcontent_content">
											<%
												for(int j=0; j<list.size(); ++j){
													UpdateWrok updateWrok = list.get(j);
											%>
													<form style="margin-top: 10px" action="#" method="get" name="contactFormx" id="contactForm">
														<div style="background-image:url('./images/color.gif');">
																	<center><b style="font-size: 20px"><%=updateWrok.getDevelopName() %>工作情况</b></center>
														</div>
														<div>
															<label>本次工作总结: </label>
															<input style="width: 200px" type="text"  value="<%=updateWrok.getWorkSummaryAddress()%>" readonly="readonly"/>
															<a style="float: right; margin-right: 40px" class="button" href="uR!fileDownLoad?fileName=<%=updateWrok.getWorkSummaryAddress()%>"><span>下载</span></a>
														</div>
														<div style="padding-top: 20px;">
															<label>下次工作计划: </label>
															<input style="width: 200px" type="text" value="<%=updateWrok.getPlanDocumentAddress()%>" readonly="readonly"/>
															<a style="float: right; margin-right: 40px" class="button" href="uR!fileDownLoad?fileName=<%=updateWrok.getPlanDocumentAddress() %>"><span>下载</span></a>
														</div>
													</form>
											<%
												}
											%>
											</div>
											
											<center>
												<hr style="border:5px dotted #33FFFF;border-bottom:0;border-right:0; border-left:0;width:550px;">
											</center>
								<%
		    						}
								%>
								
								<!-- 添加新的任务区   -->								
								<%
									if(taskAppend.getTaskStep() != taskAppend.getNextTaskStep() && task.getState()==1){//任务处于正在执行的状态
								%>
											<center><img src="<%=images[images.length-1] %>"/></center>
											<div id="updateworkcontent_content">
												<% 
													for(int i=0, cc=0; i<taskTeamList.size(); ++i){
														TaskTeam taskTeam = taskTeamList.get(i);
														if(taskTeam.getFinishMyTask()==0){//个人工作还没有完成
															ArrayList<UpdateWrok> list = (ArrayList<UpdateWrok>)mp.get(taskAppend.getNextTaskStep());
															String planDocumentAddress = null;
															String workSummaryAddress = null;
								    						for(int j=0; list!=null && j<list.size(); ++j){
								    							UpdateWrok updateWrok = list.get(j);
								    							if(updateWrok.getDevelopName().equals(taskTeam.getDevelopName())){
								    								planDocumentAddress = updateWrok.getPlanDocumentAddress();
								    								workSummaryAddress = updateWrok.getWorkSummaryAddress();
								    								break;
								    							}
								    						}
												%>
															<form style="margin-top: 10px" action="updateWorkAction!saveUpdateWork" method="post" enctype="multipart/form-data" name="xxxxcontactForm<%=cc %>" id="contactForm">
																<input type="hidden" name="peopleName" value="<%=taskTeam.getDevelopName()%>">
																<input type="hidden" name="taskid" value="<%=taskTeam.getTaskid()%>">
																<input type="hidden" name="taskStep" value="<%= taskAppend.getNextTaskStep()%>">
																<div style="background-image:url('./images/color.gif');">
																	<center><b style="font-size: 20px"><%=taskTeam.getDevelopName() %>工作情况</b></center>
																</div>
																<div>
																	<label>本次工作总结: </label>
																	<input style="width: 200px" type="text" name="workSummaryAddress<%=cc %>" id="workSummaryAddress" value="<%=workSummaryAddress%>" readonly="readonly"/>
																	<a style="float: right;" class="button" href="uR!fileDownLoad?fileName=<%=workSummaryAddress%>"><span>下载</span></a>
																	<% 
																		if(taskTeam.getDevelopName().equals((String)session.getAttribute("peopleName"))){//是用户当前自己
																	%>
																			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
																			<input style="width: 200px" type="file" name="file" id="uploadWorkSummaryAddress" />
																	<%
																		}
																	%>
																</div>
																<div style="padding-top: 20px;">
																	<label>下次工作计划: </label>
																	<input style="width: 200px" type="text" name="planDocumentAddress" id="planDocumentAddress" value="<%=planDocumentAddress%>" readonly="readonly"/>
																	<a style="float: right;" class="button" href="uR!fileDownLoad?fileName=<%=planDocumentAddress%>"><span>下载</span></a>
																	<% 
																		if(taskTeam.getDevelopName().equals((String)session.getAttribute("peopleName"))){//是用户当前自己
																	%>
																			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
																			<input style="width: 200px" type="file" name="file" id="uploadPlanDocumentAddress"/>
																	<%
																		}
																	%>
																</div>
																<% 
																	if(taskTeam.getDevelopName().equals((String)session.getAttribute("peopleName"))){//是用户当前自己
																%>
																		<div>
																			<a style="margin: auto;" class="button_aa" href="javascript:void(0)" onclick="userUpdateWork('<%=cc %>')"><span>提交任务报告</span></a>
																			<br>
																			<a style="margin: auto;" class="button_aa" href="updateWorkAction!finishMyTaskWrok?taskid=<%=taskTeam.getTaskid()%>&peopleName=<%=taskTeam.getDevelopName()%>"><span>个人的所有工作完成</span></a></center>
																		</div>
																<%
																	}
																%>
															</form>
												<%
															++cc;
														}
													}
												%>
											</div>
								<%
									}
								%>
								<%
									if(taskAppend.getTaskLeader().equals((String)session.getAttribute("peopleName")) && task.getState()==1){
								%>
										<center><a class="button_aa" href="javascript:void(0)" onclick="beginToNextStep('<%=task.getTaskid()%>')"><span>项目进行下一步</span></a></center>
										<center><a class="button_aa" href="javascript:void(0)" onclick="showUploadTaskOrgCodeDiv()"><span>完成并提交项目</span></a></center>
								<%
									}
								%>
							</div>
						</div>
					</div>
			<%
				}
			%>
			<h1 style="font-size:19px; color:#434c55;"><span style="background-image:url('./images/color.gif'); height: 25px; margin-left: 5px;">交流区></span></h1>
			<br>
			<div class="mytablecontent" id="mytablecontent"><!-- 交流框  -->
				<%
					List<Card> cardList = (List<Card>) session.getAttribute("showParticipateTask_Allcard");
					List<DevelopingParty> cardToDevelopingPartyList = (List<DevelopingParty>)session.getAttribute("showParticipateTask_AllcardToPeople");//每一条回复对应的回复人的信息
					for(int i=0; i<cardList.size(); ++i){
						Card card = cardList.get(i);
						DevelopingParty developingParty = cardToDevelopingPartyList.get(i);
				%>
							<table id="mytable">
								<tr>
									<td rowspan="2" height="175" width="150">
										<br>
										<br>
										姓名:<%=card.getPostCardName() %>
										<br>
										<br>
										联系方式:<br><%=developingParty.getPhone() %>
										<br>
										<br>
										邮件:<br><%=developingParty.getEmail() %>
										<br>
										<br>
										人气指数:<%=developingParty.getEvaluate() %>
									</td>
									<td height="25" width="450">
										<% 
											String receiveCardName = card.getReceiveCardName();
											if(receiveCardName == null)
												receiveCardName = "";
										%>
										<b style="font-size: 15px;">回复于: &nbsp;&nbsp;<%=receiveCardName%></b>
										<a style="float:right" href="javascript:void(0)" onclick="answerTo('<%=card.getPostCardName() %>', 'content<%=i%>')" id="content<%=i%>">回复</a>
									</td>
								</tr>
								<tr>
									<td height="150">
										<textarea name="reply" rows="10" cols="20" id="reply" readOnly><%=card.getCardContent() %></textarea>
									</td>
								</tr>
							</table>	
							<br><br>
				<% 
					}
					if(cardList==null || cardList.size()==0){
				%>
						<img style="margin-left: 20px" src="images/nocontent.jpg" height="400px" width="600px">
				<% 
					}
				%>
			</div>
			<br><br>
			<div><!-- 回复框  -->
				<form action="#" method="get" id="contactForm">
					<div>
						<label>发表评论: </label>
						<textarea name="myEvaluation" rows="10" cols="20" id="myEvaluation" onkeydown="keyDown()"></textarea>
					</div>
					<%
							boolean isCurPeopleAgreeToStart = false;
							for(int j=0; j<taskTeamList.size(); ++j)
								if(taskTeamList.get(j).getDevelopName().equals((String)session.getAttribute("peopleName"))){
									if(taskTeamList.get(j).getAgreeToStart() != 0)
										isCurPeopleAgreeToStart = true;
									break;
								}
							if(task.getState()==0){//项目还没有开始执行
								if(!taskAppend.getTaskLeader().equals((String)session.getAttribute("peopleName"))){
									if(isCurPeopleAgreeToStart){
					%>
										<a class="button" style="float:left;" href="javascript:void(0)" onclick="changeStateProject(false, '<%=(String)session.getAttribute("peopleName")%>', '<%=task.getTaskid()%>')"><span id="tmpbnt">不同意项目开始开发</span></a>
					<% 
									} else {
					%>
										<a class="button" style="float:left;" href="javascript:void(0)" onclick="changeStateProject(true, '<%=(String)session.getAttribute("peopleName")%>', '<%=task.getTaskid()%>')"><span id="tmpbnt">同意项目开始开发</span></a>
					<%
									}
								} else {//当前的开发者是组长
					%>
										<a class="button" style="float:left;" href="javascript:void(0)" onclick="beginToProject('<%=task.getTaskid()%>', '<%=(String)session.getAttribute("peopleName")%>')"><span>组长->开始开发</span></a>
					<% 
								}
							} else if(task.getState()==1) {//项目已经开始执行
					%>
								<a class="button" style="float:left;" href="javascript:void(0)"><span>项目进行中...</span></a>
					<%
							} else if(task.getState()==2){
					%>
								<a class="button" style="float:left;" href="javascript:void(0)"><span>项目已完成...</span></a>
					<%
							}
					%>
					<a class="button" style="float:right;" href="javascript:void(0)" onclick="userSubmitCommend('<%=task.getTaskid()%>')"><span>提交评论</span></a>
				</form>
			</div>
		</div> 
		<div class="grid_5 news" id="one_col">
			<h2>参与该项目的人员如下:</h2>
			<% 
				for(int i=0; i<developingPartyList.size(); ++i){
					DevelopingParty developingParty = developingPartyList.get(i);
					TaskTeam curTaskTeamPeople = null;
					for(int j=0; j<taskTeamList.size(); ++j){
						if(taskTeamList.get(j).getDevelopName().equals(developingParty.getDevelopName())){
							curTaskTeamPeople = taskTeamList.get(j);
							break;
						}
					}
					boolean agreeToStart = false;
					if(curTaskTeamPeople.getAgreeToStart()!=0) agreeToStart = true;
			%>
					<table>
						<tr>
							<td width="80px">&nbsp;&nbsp;<%=i+1 %>.<label><a href="#"><%=developingParty.getDevelopName() %></a></label></td>
							<td width="80px"><label>人气:</label>&nbsp;<%=developingParty.getEvaluate() %></td>
							<% 
								if(taskAppend.getTaskLeader().equals(curTaskTeamPeople.getDevelopName())){
							%>
									<td width="80px"><img src="images/leader.jpg" height="20px" width="40px"></td>
							<%
								} else { 
							%>
									<td width="80px">开发者意见:<a style="color:red" href="javascript:void(0)"><%=agreeToStart==true ? "随时开始" : "暂不开始"%></a></td>
							<% 
								}
							%>
					 	</tr>
					</table>
					<center><hr style="border:3px dotted #33FFFF;border-bottom:0;border-right:0; border-left:0;width:250px;"></center>
			<% 
				}
			%>
		</div><!-- /#one_col -->
		
		<%
			if(task.getState()==1){
		%>
				<div class="myNBdiv" id="one_col">
					<h2>项目任务已完成人员:</h2>
					<% 
						for(int i=0; i<taskTeamList.size(); ++i){
							if(taskTeamList.get(i).getFinishMyTask()==1){
					%>
								<table>
									<tr>
										<td width="270px"><center><label><a href="#"><%=taskTeamList.get(i).getDevelopName()%></a></label></center></td>
								 	</tr>
								</table>
								<center><hr style="border:3px dotted #33FFFF;border-bottom:0;border-right:0; border-left:0;width:250px;"></center>
					<% 
							}
						}
					%>
				</div><!-- /#one_col -->
		<%
			}
		%>
		<div class="clear"></div>
	</div><!-- /#content -->
		
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
	<script type="text/javascript"> Cufon.now(); scrollbottom('mytablecontent');</script>
</body>
</html>