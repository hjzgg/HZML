<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jsFile/Ajax.js"></script>

<script type="text/javascript">
window.onload= function(){
	window.setInterval(function(){
		loadUsers();
	},1000);
}
function loadUsers(){
		ajax({
			data: "chatRoomId="+window.parent.chatRoomId,
			url: "loadUser.do",
			Success: function(msg){
				eval("res="+msg);
				//当前用户总数
				var num=parseInt(res.num);
				//当前用户列表
				var head="<font color='#D2691E'>当前用户 ("+num+")</font><br>";
				var users=res.userMass;
				document.body.innerHTML=head+users;
			}
		});
}
</script>
<style type="text/css">
body {
	font-size: 12px;
	margin: 0px;
	line-height: 18px;
	padding-left: 5px;
}
</style>
</head>
<body>
	
</body>
</html>