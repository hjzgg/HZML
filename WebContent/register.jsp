<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register Page</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style type="text/css">
<!--
body{
	background-image: url("images/loginbg.jpg");
}
body,td,th {
	font-size: 18px;
}
#mydiv{
	margin-left:350px;
	margin-top:80px;
	width: 600px;
	height: 400px;
}

-->
</style>

<script language="javascript"> 
	function verflag(){
		if(document.getElementById("username").value==""
				|| document.getElementById("password").value==""){
			window.alert("用户或者密码不能省略!");
			return;
		}
		document.getElementById("contactForm").submit();
	}
</script>

</head>
<body>
	<% 
		String msg;
		if(request.getParameter("msg") != null){
	%>
			<center><h1>用户已经存在!</h1></center>
			<script type="text/javascript">
				window.alert("注册失败！");
			</script>
	
	<% } %>
<div id="mydiv">
	 <center><a href="index.jsp"><img src="images/login.gif" title="在线软件工程" /></a></center>
	 <br>
	 <br>
	 <form name="form1" action="register" method="get" id="contactForm">
	 	<center>
			 <input type="radio" style="width: 50px; margin: 0" name="people" value="user" checked="checked" />普通用户
			 <input type="radio" style="width: 50px; margin: 0" name="people" value="company" />公司人员 
		</center>
		<br>
		<br>
		<div>
			<label>姓名:</label>
			<input name="username" type="text" class="textbox" id="username">
		</div>
		<div>
			<label>密码:</label>
			<input name="password" type="password" class="textbox" id="password">
		</div>
		<div>
			<label>电话:</label>
			<input name="phone" type="text" class="textbox" id="phone">
		</div>
		<div>
			<label>邮箱:</label>
			<input name="email" type="text" class="textbox" id="email">
		</div>
		<div>
			<label>地址:</label>
			<input name="address" type="text" class="textbox" id="address">
		</div>
	 </form>
	 <br>
	 <a class="button" style="float:right;" href="javascript:void(0)" onclick="verflag();"><span>注册</span></a>
</div>
</body>
</html>

