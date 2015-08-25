<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login Page</title>
<script language="javascript"> 
	function veri(){
		var sourcenum="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		var siglenum="";
		var checknum="";
		var index=0; 
		for(i=0;i<8;i++){
		   index=(Math.random()*100)%35;
		   siglenum=sourcenum.substring(index,index+1);
		   checknum+=siglenum;
		   i++;
		}
		document.form1.txt_ver.value=checknum;
	}

	function verflag(){
		var str1=document.getElementById("verifycode");
		var str2=document.getElementById("txt_ver");
		if(str1.value==str2.value){
			document.getElementById("contactForm").submit();
		}
		else{
			window.alert("验证码错误！");
		}
	}
</script>
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
	margin-top:100px;
	width: 600px;
	height: 400px;
}

-->
</style>
</head>
<body onLoad="veri();">
<% 
	String msg;
	if(request.getParameter("msg") != null){
		request.removeAttribute("msg");
%>
		<center><h1>姓名或者密码错误!</h1></center>
		<script type="text/javascript">
			window.alert("登录失败！");
		</script>

<% } %>
<div id="mydiv">
	 <center><a href="indexRequest!theLastTaskRequestForIndex"><img src="images/login.gif" title="在线软件工程" /></a></center>
	 <br>
	 <br>
	 <form name="form1" action="login" method="get" id="contactForm">
	 	<center>
			 <input type="radio" style="width: 50px; margin: 0" name="people" value="user" checked="checked" />普通用户
			 <input type="radio" style="width: 50px; margin: 0" name="people" value="company" />公司人员 
			 <input type="radio" style="width: 50px; margin: 0" name="people" value="manager" />管理员
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
			<label>验证码: </label>
			<input style="width:280px" name="verifycode" id="verifycode" class="textbox" onFocus="this.select(); " onMouseOver="this.style.background='#E1F4EE';" onMouseOut="this.style.background='#FFFFFF'" size="6" maxlength="4">
			&nbsp;&nbsp;&nbsp;<input style="width:42px; font-size: 15px ;" name="txt_ver" type="text" id="txt_ver" size="4" readonly="ture">   
		</div>
	 </form>
	 <br>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.jsp">还没有账号，注册!</a>
	 <a class="button" style="float:right;" href="javascript:void(0)" onclick="verflag();"><span>登陆</span></a>
</div>
 <c:if test="${msg!=null}">
   <script>
      $.messager.alert('提示','${msg}','warning');
   </script>
 </c:if>
</body>
</html>

