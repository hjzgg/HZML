	var preD=null, preDD=null;
	function $D(element){
		var d=document.getElementById(element);
		var h=d.offsetHeight;
		var maxh=450;
		function dmove(){
			if(h>=maxh){
				d.style.height='450px';
				clearInterval(iIntervalId);
			}else{
				h+=50; //设置层展开的速度
				d.style.display='block';
				d.style.height=h+'px';
			}
		}
		iIntervalId=setInterval(dmove,2);
	}
	function $D2(element){
		var d=document.getElementById(element);
		var h=d.offsetHeight;
		var maxh=300;
		function dmove(){
			if(h<=0){
			d.style.display='none';
			clearInterval(iIntervalId);
			}else{
				h-=50;//设置层收缩的速度
				d.style.height=h+'px';
			}
		}
		iIntervalId=setInterval(dmove,2);
	}
	function $use(targetid,objN){
		var d=document.getElementById(targetid);
		var sb=document.getElementById(objN);
		if (d.style.display=="block"){
		    $D2(targetid);
		    d.style.display="none";
		    sb.innerHTML="展开";
		  } else {
		    $D(targetid);
		    d.style.display="block";
		    sb.innerHTML='收缩';
		    if(preD!=null && preD != d){
		    	preD.style.display="none";
		    	preDD.innerHTML="展开";
		    }
		    preD = d;
		    preDD = sb;
		  }
	}
	//展开之后加入聊天室
	function chatRoomEnter(targetid,objN, user, chatRoomId){
		var d=document.getElementById(targetid);
		var sb=document.getElementById(objN);
		if (d.style.display=="block"){
		    $D2(targetid);
		    d.style.display="none";
		    sb.innerHTML="展开";
		    
		    document.getElementById("contentxxx").src="";
		  } else {//展开
			showTaskCheckChatRoomDiv(false);
			if(user=="null"){
				alert("用户未登录！");
				return;
			}
		    $D(targetid);
		    d.style.display="block";
		    sb.innerHTML='收缩';
		    if(preD!=null && preD != d){
		    	preD.style.display="none";
		    	preDD.innerHTML="展开";
		    }
		    preD = d;
		    preDD = sb;
		    $.ajax({
	    		type:"post",
	    		url: "login.do",
	    		data: "name="+user + "&chatRoomId="+chatRoomId,
	    		success:
	    			function(){
		    			 document.getElementById("chatRoomId").src = "main.jsp?chatRoomId="+chatRoomId;
	    			},
	        	error:
	        		function(){
	        			alert("加载失败!");
	        		}
	    	});
		  }
	}
	
//showParticipateTask.jsp	
	var isanswer = false;
	var receiveCardName = null;
	var staticContentLength;
	var preid=null;
	function userSubmitCommend(taskid){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			      document.getElementById("div_absolute").innerHTML=xmlhttp.responseText;
				  document.getElementById("div_absolute").style.display="block";
			  }
		 }
		var cardContent = document.getElementById("myEvaluation").value;
		if(cardContent==""){
			window.alert("评论内容不能为空!");
			return ;
		}
		if(isanswer==true)
			cardContent = cardContent.substr(staticContentLength, cardContent.length);
		var myrequest = "userRequestToSubmitComment?taskid="+taskid + "&cardContent="+cardContent;
		if(isanswer==true)
			myrequest += "&receiveCardName=" + receiveCardName;
		xmlhttp.open("post", myrequest, true);
		xmlhttp.send();
	}
	
	function keyDown(){
		  var contentLength = document.getElementById("myEvaluation").value.length;
		  if (isanswer && contentLength==staticContentLength && window.event.keyCode==8){        //屏蔽退格删除 
			  window.event.keyCode=0; 
			  window.event.returnValue=false;
		  }
	} 
	
	function CancelAnswerTo(id){
		isanswer = false;
		preid = null;
		receiveCardName = null;
		document.getElementById('myEvaluation').innerText="";
		document.getElementById(id).innerText="回复";
	}
	
	function answerTo(peopleName, id){
		var aContent = document.getElementById(id).innerText;
		if(aContent=="回复"){
			isanswer = true;
			receiveCardName = peopleName;
			var staticContent = "回复与  " + peopleName + ": ";
			staticContentLength = staticContent.length;
			document.getElementById(id).innerText="取消回复";
			document.getElementById('myEvaluation').innerText = staticContent;
			if(preid != null)
				document.getElementById(preid).innerText="回复";
			preid = id;
		} else {
			CancelAnswerTo(id);
		}
	}
	
	function divDisplayNone(){
		document.getElementById("div_absolute").style.display="none";
		window.location.reload();
	}
	
	function myRefresh(){
		document.getElementById("div_absolute").style.display="none";
		window.location.reload(); 
	}
	
	//同意项目准备开发选项
	var myFlag = null;
	function changeStateProject(flag, peopleName, taskid){
		if(myFlag==null)
			myFlag = flag;
		if(myFlag==false){
			myFlag = true;
			document.getElementById("tmpbnt").innerHTML="同意项目开始开发";
		}
		else{
			myFlag = false;
			document.getElementById("tmpbnt").innerHTML="不同意项目开始开发";
		}
		
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			      document.getElementById("div_absolute").innerHTML=xmlhttp.responseText;
				  document.getElementById("div_absolute").style.display="block";
			  }
		 }
		var myrequest = "userRequestToChangeProjectState?taskid="+taskid + "&peopleName="+peopleName;
		xmlhttp.open("get", myrequest, true);
		xmlhttp.send();
	}
	
	function beginToProject(taskid, peopleName){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			      document.getElementById("div_absolute").innerHTML=xmlhttp.responseText;
				  document.getElementById("div_absolute").style.display="block";
			  }
		 }
		var myrequest = "userRequestToBeginProject?taskid="+taskid + "&peopleName="+peopleName;
		xmlhttp.open("get", myrequest, true);
		xmlhttp.send();
	}
	
	function beginToNextStep(taskid){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
				  window.location.reload(); 
			  }
		 }
		var myrequest = "userRequestToBeginNextStep?taskid="+taskid;
		xmlhttp.open("get", myrequest, true);
		xmlhttp.send();
	}
	
	function saveTaskAddress(taskid, tmpid){//保存项目地址
		var taskAddress = document.getElementById(tmpid).value;
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
				  alert("项目地址更改成功!");
			  }
		 }
		var myrequest = "uR!userRequestToSaveTaskAddress?taskid="+taskid + "&taskAddress=" + taskAddress;
		xmlhttp.open("get", myrequest, true);
		xmlhttp.send();
	}
	
	function finishTaskAndSubmit(fileUploadId, taskid){//提交保存的项目
		var xmlhttp;
		if(document.getElementById(fileUploadId).value==""){
			alert("项目源码不能为空!");
			return;
		}
		var fileObj = document.getElementById(fileUploadId).files[0]; // 获取文件对象
        var form = new FormData();
        form.append("taskid", taskid);
        form.append("file", fileObj);                
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
				  alert("项目提交成功!");
			  }
		 }
		var myrequest = "uR!userRequestToFinishTaskAndSubmit";
		xmlhttp.open("post", myrequest, true);
		xmlhttp.send(form);
	}
	
	function userUpdateWork(id){
		var formx = document.getElementsByName("xxxxcontactForm"+id);
		var work = document.getElementsByName("workSummaryAddress"+id);
		if(work[0].value=='null' && document.getElementById("uploadWorkSummaryAddress").value==""){
			window.alert("本次工作总结必须上传!");
			return;
		}
		formx[0].submit();
	}
	
	function scrollbottom(id){
		document.getElementById(id).scrollTop = document.getElementById(id).scrollHeight;
	}
	
	function UpladFile(fileUploadId, taskid) {
		 if(document.getElementById(fileUploadId).value == ""){
			 alert("请选择上传的文件!");
			 return ;
		 }
		
         var fileObj = document.getElementById(fileUploadId).files[0]; // 获取文件对象

         var FileController = "updateWorkAction!fileUpload";                    // 接收上传文件的后台地址 

         // FormData 对象

         var form = new FormData();

         //form.append("author", "hooyes");                        // 可以增加表单数据
         form.append("taskid", taskid);
         form.append("file", fileObj);                           // 文件对象

         // XMLHttpRequest 对象

         var xhr = new XMLHttpRequest();

         xhr.open("post", FileController, true);
         
         xhr.onreadystatechange=function(){
			  if (xhr.readyState==4 && xhr.status==200){
				  alert('上传完成!');
			  }
		 }

         xhr.send(form);
    }
	
	function showUploadTaskOrgCodeDiv(){
		document.getElementById('uploadTaskOrgCode').style.display='block';
	}
	
	//用于分页
    function myDumpTo(tot, request) { //函数参数定义时不加var，否则出错
         var pageMsg = document.getElementById("pageTo").value;
         var patrn=/^\d+$/;
         if (patrn.test(pageMsg)) {   
             if(parseInt(pageMsg)<1 || parseInt(pageMsg)>parseInt(tot)) return;
             location.href=request+pageMsg;
         }
    }
    
    function myGoTo(request) {  
    	location.href=request;   
	}
    
    function submitTaskScore(formid) {
        $.ajax({
    		type:"post",
    		url:"companyAndDistributeAction!scoreTask",
    		data:$(formid).serialize(),
    		success:
    			function(){
    				document.getElementById("hjzggContent").innerHTML="<center><h1>评论成功!</h1></center>&nbsp;&nbsp;&nbsp;&nbsp;<a href='allFinishedTask'>返回</a>";
    			},
        	error:
        		function(){
        			alert("评论失败!");
        		}
    	});
   }
    
    window.alert = function(txt){
    	 window.scrollTo(0,0);
	     var shield = document.createElement("DIV");
	     shield.id = "shield";
	     shield.style.position = "absolute";
	     shield.style.left = "0px";
	     shield.style.top = "0px";
	     shield.style.width = "100%";
	     shield.style.height = document.body.scrollHeight+"px";
	     shield.style.background = "#333";
	     shield.style.textAlign = "center";
	     shield.style.zIndex = "10000";
	     shield.style.filter = "alpha(opacity=0)";
	     var alertFram = document.createElement("DIV");
	     alertFram.id="alertFram";
	     alertFram.style.position = "absolute";
	     alertFram.style.left = "50%";
	     alertFram.style.top = "50%";
	     alertFram.style.marginLeft = "-225px";
	     alertFram.style.marginTop = "-75px";
	     alertFram.style.width = "450px";
	     alertFram.style.height = "150px";
	     alertFram.style.textAlign = "center";
	     alertFram.style.lineHeight = "150px";
	     alertFram.style.zIndex = "10001";
	     strHtml = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">";
	     strHtml += " <li style=\"background:#1FCFF9;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #F9CADE;\">[消息提示]</li> ";
	     strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\">"+ txt +"</li>";
	     strHtml += " <li style=\"background:#A4D1F2;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #F9CADE;\"><input type=\"button\" value=\"确 定\" onclick=\"doOk()\" /></li> ";
	     strHtml += "</ul> ";
	     alertFram.innerHTML = strHtml;
	     document.body.appendChild(alertFram);
	     document.body.appendChild(shield);
	     var c = 0;
	     this.doAlpha = function(){
	         if (c++ > 20){clearInterval(ad);return 0;}
	         shield.style.filter = "alpha(opacity="+c+");";
	     };
	     var ad = setInterval("doAlpha()",5);
	     this.doOk = function(){
	         alertFram.style.display = "none";
	         shield.style.display = "none";
	     };
	     alertFram.focus();
	     document.body.onselectstart = function(){return false;};
    }
	
    function mailResponse(index){
    	var formIndex = parseInt(index, 10);//得到是第几个同名表单
    	document.getElementsByName("mailMsg")[formIndex].submit();
    }
    
    //进入聊天室
    var xmlHttp;

    function createXmlHttpRequest(){
        if (window.XMLHttpRequest) { //Mozilla 浏览器
            return new XMLHttpRequest();
        }
        else 
            if (window.ActiveXObject) { // IE浏览器
                try {
                    return new ActiveXObject("Msxml2.XMLHTTP");
                } 
                catch (e) {
                    try {
                        return new ActiveXObject("Microsoft.XMLHTTP");
                    } 
                    catch (e) {
                    }
                }
            }
    }

    function ajax(options){
    	xmlHttp = createXmlHttpRequest();
    	var url = options.url+"?timeStemp="+new Date().getTime();
    	xmlHttp.onreadystatechange=function(){
    		if(xmlHttp.readyState==4){
    			if(xmlHttp.status==200){
    				options.Success(xmlHttp.responseText);
    			}
    		}
    	};
    	xmlHttp.open("POST",url,true);
    	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    	xmlHttp.send(options.data);
    }
    
    function chatRoomTest(user, chatRoomId){
    	ajax({
			data: "name="+user + "&chatRoomId="+chatRoomId,
			url: "login.do",
			Success: function(msg){
				eval("res="+msg);
				var result = res.massage;
				window.location.href="main.jsp?chatRoomId="+chatRoomId;
			}
		});
    }
    
    var curMsgId;
    function publisherEnterChatRoom(user, chatRoomId, msgId){
    	curMsgId = msgId;
    	contactToDeveloperFun();
    	ajax({
			data: "name="+user + "&chatRoomId="+chatRoomId + "&flag=true",//表示这个人是发布方
			url: "login.do",
			Success: function(msg){
				eval("res="+msg);
				var result = res.massage;
				ajax({
					data: "taskId="+chatRoomId,
					url: "developToPublishMsgAction!getTaskAllocationDoc",
					Success: function(responseText){
						document.getElementById("publisherChatRoom").innerHTML = responseText;
					}
				});
			}
		});
    }
    
    
    var contactToPublisherFlag = false;
    function contactToPublisherFun(){
    	contactToPublisherFlag = !contactToPublisherFlag;
    	if(contactToPublisherFlag)
    		document.getElementById("contactToPublisher").style.display = "";
    	else 
    		document.getElementById("contactToPublisher").style.display = "none";
    }
    
    var contactToDeveloperFlag = false;
    function contactToDeveloperFun(){
    	contactToDeveloperFlag = !contactToDeveloperFlag;
    	if(contactToDeveloperFlag)
    		document.getElementById("mainDeveloperChatRoom").style.display = "";
    	else {
    		document.getElementById("mainDeveloperChatRoom").style.display = "none";
    		document.getElementById("publisherChatRoom").innerHTML="";
    	}
    }
    
    function contactToPublishSubmit(){
    	$.ajax({
    		type:"post",
    		url:"developToPublishMsgAction!saveDevelopToPublishMsg",
    		data:$("form[name='contactToPublisherForm']").serialize(),
    		//data:$(document.getElementsByName("contactToPublisherForm")[0]).serialize(),
    		success:
    			function(){
    				alert("发送成功")
    			},
        	error:
        		function(){
        			alert("发送失败!");
        		}
    	});
    }
    
    function showTaskCheckChatRoomDiv(show, user, chatRoomId){
    	if(show == true){
    		document.getElementById("taskCheckChatRoomDivId").style.display="";
    		$.ajax({
	    		type:"post",
	    		url: "login.do",
	    		data: "name="+user + "&chatRoomId="+chatRoomId,
	    		success:
	    			function(){
		    			 document.getElementById("taskCheckChatRoomId").src = "mainCopy.jsp?chatRoomId="+chatRoomId;
	    			},
	        	error:
	        		function(){
	        			alert("加载失败!");
	        		}
	    	});
    	} else {
    		document.getElementById("taskCheckChatRoomId").src = "";
    		document.getElementById("taskCheckChatRoomDivId").style.display="none";
    	}
    }
    
    function publisherTaskCheckFinish(){
    	$.ajax({
    		type:"post",
    		url: "developToPublishMsgAction!updateDevelopToPublishMsg",
    		data: "msgId="+curMsgId,
    		success:
    			function(){
    				alert("操作成功!");
    			},
        	error:
        		function(){
        			alert("操作失败!");
        		}
    	});
    }
    
    function bankCardSubmit(taskid){
    	var accountID = document.getElementById("accountID").value;
    	var keyValue = document.getElementById("keyValue").value;
    	if(accountID == "" || isNaN(accountID)){
    		alert("汇款商户不能为空且为数字!");
    		return ;
    	}
    	var Regx = /^[A-Za-z0-9]*$/;
    	if(keyValue == "" || !Regx.test(keyValue)){
    		alert("汇款秘钥不能为空且为字母或数字!");
    		return ;
    	}
    	$.ajax({
    		type:"post",
    		url: "userRequest!bankCardSubmit",
    		data: "taskid="+taskid+"&accountID="+accountID+"&keyValue="+keyValue,
    		success:
    			function(){
    				alert("操作成功!");
    			},
        	error:
        		function(){
        			alert("操作失败!");
        		}
    	});
    }