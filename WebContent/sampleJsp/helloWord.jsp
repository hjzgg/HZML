<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>errors</title>
<style type="text/css">
#div_digg {
  position: fixed;
  bottom: 10px;
  right: 50px;
  border: 2px solid #ECD7B1;
  padding: 10px;
  width: 130px;
  height: 120px;
  background-image:url("../images/胡峻峥.jpg");
  background-color: #fff;
  border-radius: 5px 5px 5px 5px !important;
  box-shadow: 0 0 0 1px #5F5A4B, 1px 1px 6px 1px rgba(10, 10, 0, 0.5);
}
#main {padding-top:150px ;position: absolute;width:400px;height:200px;left:50%;top:50%; text-align:center; vertical-align:bottom; margin:auto;
		margin-left:-200px;margin-top:-100px;border:1px solid #00F;
		font-size: 40px; font-family: "楷体"} 
</style>
<script type="text/javascript" src="../js/my.js"></script>
</head>
<body style="background: url('../images/loginbg.jpg');">
	<div id="main">错误, 你好！</div>
</body>
<script language="javascript" type="text/javascript">
	alert("访问出错或登录超时！");
</script>
</html>