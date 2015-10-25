<%@page import="com.hzml.entriy.Task" %>
<%@page import="com.hzml.entriy.TaskAppend" %>
<%@page import="com.hzml.entriy.UpdateWrok" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.TreeMap" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>hhh</title>
</head>
<body>
 	<%
 		Task task = (Task)session.getAttribute("getTask");
 		TaskAppend taskAppend = (TaskAppend)session.getAttribute("getTaskAllocationDoc");
 		String chatRoomId = (String)request.getParameter("taskId");
		List<UpdateWrok> updateWordList = (List<UpdateWrok>)session.getAttribute("getParticipateTask_AllUpdateWork");
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
 	%>
 	<div style="width:630px; height:500px;">
 		 <div style="width:620px; height: 150px; overflow:auto;">
			<form action="#" method="post" id="contactForm" name="contactToPublisherForm">
				<br/>
				<div style="padding-top: 20px;">
					<label>功能划分说明书: </label>
					<input style="width: 280px" type="text" name="projectPlan" id="projectPlan" value="<%=taskAppend.getTaskAllocationDoc()%>" readonly="readonly"/>
					<a style="float: right; margin-right: 20px" class="button" href="uR!fileDownLoad?fileName=<%=taskAppend.getTaskAllocationDoc()%>"><span>下载</span></a>
					<br><br>
					<%
						if(updateWordList != null){
							Map<Integer, List<UpdateWrok>> mp = new TreeMap<Integer, List<UpdateWrok>>();
		   					for(UpdateWrok updateWrok : updateWordList){
		   						int step = updateWrok.getTaskStep();
		   						if(mp.get(step) == null)
		   							mp.put(step, new ArrayList<UpdateWrok>());
		   						mp.get(step).add(updateWrok);
		   					}
		 					for(Integer i : mp.keySet()){
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
					<%
		 					}
						}
					%>
				</div>
			</form>
		</div>
		<div style="width:630px; height:450px;" id="publisherChatRoom">
			<iframe src="main.jsp?chatRoomId=<%=chatRoomId %>" name="mainChat" width="630px" height="450px"></iframe>
		</div>
	</div> 
</body>
</html>