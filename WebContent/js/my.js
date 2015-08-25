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
				  window.location.reload(); 
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
				  window.location.reload(); 
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

         xhr.onload = function () {
        	 location.reload(true);   
             alert("上传完成!");

         };

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
	