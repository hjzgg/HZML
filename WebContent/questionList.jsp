<%@page import="java.util.List"%>
<%@page import="com.hzml.entriy.QuestionList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>在线软件工程</title>
 
</head>

<body>
 	<div style="margin-left: 90px; margin-top: 65px; width:340px; height:450px; overflow:auto;">
	<h2>随机题目如下:</h2>
	<br/>
		<% 
			List<QuestionList> questionList = (List<QuestionList>)session.getAttribute("questionList");
			if(questionList != null)
				for(int i=0; i<questionList.size(); ++i){
					QuestionList question = questionList.get(i);
		%>
				<div>
					<label><%=i+1 %>.&nbsp;<%=question.getQuestionMsg() %></label>
					<br>
					&nbsp;&nbsp;<label>A.<%=question.getOptionA() %></label>
					<br>
					&nbsp;&nbsp;<label>B.<%=question.getOptionB() %></label>
					<br>
					&nbsp;&nbsp;<label>C.<%=question.getOptionC() %></label>
					<br>
					&nbsp;&nbsp;<label>D.<%=question.getOptionD() %></label>
					<br>
					<br>
				</div>
		<%
			}
		%>
	</div> 
</body>
</html>
