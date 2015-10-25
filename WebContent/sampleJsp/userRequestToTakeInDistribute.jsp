<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<div style="width:450px; height: 350px;">
<%
	String flag = request.getParameter("param");
	if(flag.equals("success")){
%>
		<div style="width:450px; height: 300px; background-image: url('images/successToTakeInDistribute.jpg');"></div>
<%
	} else if(flag.equals("fail")){
%>
		<div style="width:450px; height: 300px; background-image: url('images/failToTakeInDistribute.jpg');"></div>
<%
	}
%>
	<a class="button" style="float:right; margin-right: 0px"; href="javascript:void(0)" onclick="mySkip()"><span>知道了</span></a>
</div>
</body>
</html>