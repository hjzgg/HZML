<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>随机做题</title>

<style>
* { margin:0; padding:0; }

body { background:#efefef; overflow:hidden; }

/* 3d按钮  */
@font-face {
  font-family: 'Yanone Kaffeesatz';
  font-style: normal;
  font-weight: 200;
  src: local('Yanone Kaffeesatz Bold'), local('YanoneKaffeesatz-Bold'), url(We_iSDqttE3etzfdfhuPRWwXwFHHZlCwprwJOQ-Se7k.woff) format('woff');
}

a.button3d {
	position: relative;
	color: rgba(255,255,255,1);
	text-decoration: none;
	background-color: rgba(219,87,5,1);
	font-family: 'Yanone Kaffeesatz';
	font-weight: 700;
	font-size: 1.5em;
	display: block;
	padding: 4px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
	-moz-box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
	box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
	margin: 100px auto;
	width: 160px;
	text-align: center;
	
	-webkit-transition: all .1s ease;
	-moz-transition: all .1s ease;
	-ms-transition: all .1s ease;
	-o-transition: all .1s ease;
	transition: all .1s ease;
}

a.button3d:active {
	-webkit-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
	-moz-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
	box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
	position: relative;
	top: 6px;
}
/* 3d按钮  */

#shadow {
	height:300px; width:600px; position:absolute; top:400px; left:0; z-index:0;
	background:-webkit-radial-gradient(center center , 150px 50px, #cfcfcf, #efefef );
	background:-moz-radial-gradient(center center , 150px 50px, #cfcfcf, #efefef );
	background:-ms-radial-gradient(center center , 150px 50px, #cfcfcf, #efefef );
	background:-o-radial-gradient(center center , 150px 50px, #cfcfcf, #efefef );
	background:radial-gradient(center center , 150px 50px, #cfcfcf, #efefef );
	-webkit-transform:perspective(100px) rotateX(60deg) rotateY(0deg);
	-moz-transform:perspective(100px) rotateX(60deg) rotateY(0deg);
	-ms-transform:perspective(100px) rotateX(60deg) rotateY(0deg);
	-o-transform:perspective(100px) rotateX(60deg) rotateY(0deg);
	transform:perspective(100px) rotateX(60deg) rotateY(0deg);
	opacity:0;
}

#container {
	/*background:black;*/
	height:240px; width:240px; position:absolute; top:180px; z-index:1;
	-webkit-transform-style:preserve-3d;
	-moz-transform-style:preserve-3d;
	-ms-transform-style:preserve-3d;
	-o-transform-style:preserve-3d;
	transform-style:preserve-3d;
	-webkit-transform:perspective(2000px) rotateX(-10deg) rotateY(45deg) ;
	-moz-transform:perspective(2000px) rotateX(-10deg) rotateY(45deg) ;
	-ms-transform:perspective(2000px) rotateX(-10deg) rotateY(45deg) ;
	-o-transform:perspective(2000px) rotateX(-10deg) rotateY(45deg) ;
	transform:perspective(2000px) rotateX(-10deg) rotateY(45deg) ;
}
#container p {
	position:absolute;
	top:40%;
	left:35%;
	padding:5px;
	word-spacing:0.2em;
	line-height:20px;
	background:black;
	color:#fff;
	text-align:center;
}
#container div { 
	 height:240px; width:240px; position:absolute; left:0; top:0; color:#fff; line-height:240px; text-align:center; font-weight:bold; font-size:80px; cursor:pointer; 
	 background:rgba( 239,239,239, 1 );
	 -webkit-transition:500ms all ease;
	 -moz-transition:500ms all ease;
	 -ms-transition:500ms all ease;
	 -o-transition:500ms all ease;
	 transition:500ms all ease;
}
#container div div {
	border:1px solid #fff; /* rgba( 255,255,255, 1 ) */
	box-shadow:1px 0 3px #fff,1px 0px 10px #efefef;
    border-radius:8px;
	background:-webkit-radial-gradient(center, #d81002, #b20c00 );
	background:-moz-radial-gradient(center, #d81002, #b20c00 );
	background:-ms-radial-gradient(center, #d81002, #b20c00 );
	background:-o-radial-gradient(center, #d81002, #b20c00 );
	background:radial-gradient(center, #d81002, #b20c00 );
}
#container div div:hover {
	background:-webkit-radial-gradient(center, #f00, #b20c00 );
	background:-moz-radial-gradient(center, #f00, #b20c00 );
	background:-ms-radial-gradient(center, #f00, #b20c00 );
	background:-o-radial-gradient(center, #f00, #b20c00 );
	background:radial-gradient(center, #f00, #b20c00 );
}
#container div ul {
	list-style:none;
	margin:30px;
}
#container div li {
	width: 60px;
	height:60px;
	float:left;
	overflow:hidden;
	-webkit-transition:500ms all ease;
	-moz-transition:500ms all ease;
	-ms-transition:500ms all ease;
	-o-transition:500ms all ease;
	transition:500ms all ease;
}

#container div li span  { 
	width:50px; height:50px; margin:5px auto;
	display:block;
	background:-webkit-linear-gradient(top, #eee, #fff );
	background:-moz-linear-gradient(top, #eee, #fff );
	background:-ms-linear-gradient(top, #eee, #fff );
	background:-o-linear-gradient(top, #eee, #fff );
	background:linear-gradient(top, #eee, #fff );
	border-radius:25px;
	box-shadow:-1px -1px 2px #000;
}
</style>
<script src="js/Aui-core-1.42-min.js" language="javascript" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
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
	    }
	    var ad = setInterval("doAlpha()",5);
	    this.doOk = function(){
	        alertFram.style.display = "none";
	        shield.style.display = "none";
	    }
	    alertFram.focus();
	    document.body.onselectstart = function(){return false;};
	 }


function randomQuestion(){
	var xmlhttp;
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	}
	else{// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function(){
		  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			   document.getElementById("questionList").innerHTML=xmlhttp.responseText;
		  }
	 }
	xmlhttp.open("get", "questionsAction!randomQuestion", true);
	xmlhttp.send();
}

var myfun=function()
{
	if( /ie/g.test( Aui.browser() ) )
	{
		Aui("body").html("Adam CSS 3.0 effect，支持非IE浏览器。你懂的！")
				   .setStyle(
				   {
				   	"color" : "#000",
				   	"text-align" : "center",
				    "font-size" : "50px",
				    "font-weight" : "bolder",
				    "line-height" : "500px"
				   });
	}
	else
	{
		var oDoc = Aui(document),
			docWidth = oDoc.width();
			
		Aui("body").html("<div id=\"questionList\" style=\"z-index:100; position:absolute; left:800px; top:20px; background:url(images/题目背景.png); width:490px; height:600px\"></div>"+
					"</h1><div id=\"container\" style=\"left:"+ ( ( docWidth - 480 )*0.5 ) +"px;\"></div><strong id=\"shadow\" style=\"left:"+ ( ( docWidth - 800 )*0.5 ) +"px;\"></strong>" + 
					"<a class=\"button3d\" style=\"width:120px; height:20px;margin-left:100px; margin-top:200px\" href=\"javascript:void(0)\" onclick=\"myfun()\">随机抽题</a>" +
					"<br><a class=\"button3d\" style=\"width:120px; height:20px;margin-left:100px; margin-top:20px\"  href=\"javascript:void(0)\" onclick=\"location.href='practice.jsp'\">开始测试</a>");
		
		var oContainer = Aui.byID("#container")[0],
			AuiCon = Aui( oContainer ),
			AuiShadow = Aui("#shadow"),
			
			transform = function( elem, value, key )
			{
				key = key || "transform";
				
				[ "-webkit-", "-moz-", "-ms-", "-o-", "" ].forEach( function( pre )
				{
					elem.style[ pre + key ] = value;
				});	
				
				return elem;
			},
			piece = function( value, key )
			{
				var str = "";
				
				key = key || "transform";
				
				[ "-webkit-", "-moz-", "-ms-", "-o-",  "" ].forEach( function( pre )
				{
					str += ( pre + key + ":" + value );
					return false;
				});	
				
				return str;
			},
			startMove = function startMove( obj )
			{
				obj.timer = obj.timer || null;
				
				clearInterval( obj.timer );
				
				obj.timer = setInterval (function ()
				{
					x -= speedY;
					y += speedX;
					
					speedY *= 0.95;
					speedX *= 0.95;
					
					if( Math.abs( speedX ) < 0.1 && Math.abs( speedY ) < 0.1 )
					{
						stopMove( obj.timer );
					};
					
					transform( obj, "perspective(" + pers + "px) rotateX("+ x +"deg) rotateY(" + y +"deg)" );
					
				}, 30);
			},
			
			stopMove = function( t )
			{
				clearInterval( t );
			},
			
			addEvent = function ( obj, sEvent, fn )
			{
				if( obj.attachEvent )
				{
					obj.attachEvent( "on" + sEvent, fn );
				}
				else
				{
					obj.addEventListener( sEvent, fn, false );
				};
			},
			
			onMouseWheel = function( e )
			{
				if( e.wheelDelta ? e.wheelDelta < 0 : e.detail > 0 )
				{
					if( pers < 2000 )
					{
						pers += 50;
						_top -= 0.5;
					};
				}
				else
				{
					if( pers > 50 )
					{
						pers -= 50;
						_top += 0.5;
					};
				};
				
				AuiShadow.setStyle( "top", _top );
				transform( oContainer, "perspective(" + pers + "px) rotateX("+ x +"deg) rotateY(" + y +"deg)" );
				
				if( e.preventDefault )
				{
					e.preventDefault();
				};
				
				return false;
			},
			
			setNum = function( obj, n )
			{
				var arr = [
					[ 4 ],
					[ 0, 8 ],
					[ 0, 4, 8 ],
					[ 0, 2, 6, 8 ],
					[ 0, 2, 4, 6, 8 ],
					[ 0, 2, 3, 5, 6, 8]
				];
				Aui.each( arr[n], function( i , v )
				{
					obj.find("li")
					   .eq( v )
					   .html("<span></span>");
				});
			}; 
			
			x = -10,
			y = 45,
			speedX = 0,
			speedY = 0,
			i = 1,
			d_x = 0,
			d_y = 0,
			d_z = 519,
			pers = 2000,
			_top = 400;
			
		while( i < 7 )
		{
			if( i < 5 )
			{
				d_x = 0;
				d_y = i * 90;
			}
			else if( i === 5 )
			{
				d_x = 90;
				d_y = 0;
			}
			else 
			{
				d_x = -90;
				d_y = 0;
			};
			AuiCon.append( "<div id=\"box-"+ i +"\" style=\""+ piece("rotateX(" + d_x + "deg) rotateY(" + d_y + "deg) translateZ(" + d_z + "px) scaleX( 0.4 ) scaleY( 0.4 );") +"opacity:0;\"><div><ul><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul></div></div>" );
			
			i += 1;
		};
		
		var oDiv = AuiCon.children("div");
		
		Aui.each( oDiv, function( i )
		{
			( function( d , obj )
			{
				setTimeout( function()
				{
					obj.style.opacity = 1;
					
					setTimeout( function()
					{
						setNum( Aui( obj ), d );
						
						if( d < 4 )
						{
							transform( obj, "rotateX(0deg) rotateY(" + ( i * 90 )+"deg) translateZ(180px) scaleX( 1 ) scaleY( 1 )" );
						}
						else if( d === 5 )
						{
							transform( obj, "rotateX(90deg) rotateY(0deg) translateZ(180px) scaleX( 1 ) scaleY( 1 )" );
							
							setTimeout( function()
							{
								AuiShadow.fx({ opacity : 1 }, 400 );
								
								Aui.each( oDiv, function( x )
								{
									if(  x < 4 )
									{
										transform( this, "rotateX(0deg) rotateY(" + ( x * 90 )+"deg) translateZ(72px) scaleX( 0.6 ) scaleY( 0.6 )" );
									}
									else if( x === 5 )
									{
										transform( this, "rotateX(90deg) rotateY(0deg) translateZ(72px) scaleX( 0.6 ) scaleY( 0.6 )" );
									}
									else if( x === 4)
									{
										transform( this, "rotateX(-90deg) rotateY(0deg) translateZ(72px) scaleX( 0.6 ) scaleY( 0.6 )" );
									};
								});
							}, 400 );
						}
						else if( d === 4)
						{
							transform( obj, "rotateX(-90deg) rotateY(0deg) translateZ(180px) scaleX( 1 ) scaleY( 1 )" );
						};
					} , 100 );
				
				} , d * 200 );
	
			})( i, this );
			
		});
		
		oDoc.mousedown( function( e )
		{
			
			var moveX = e.clientX,
				moveY = e.clientY;
				
			var startX = x;
			var startY = y;
			
			var lastX = moveX;
			var lastY = moveY;
			
			speedX = speedY = 0;
	
			oDoc.mousemove( function( e )
			{
	
				y = startY + ( e.clientX - moveX )/5;
				x = startX - ( e.clientY - moveY )/5;
					
				transform( oContainer, "perspective(" + pers + "px) rotateX("+ Math.ceil( x ) +"deg) rotateY(" + Math.ceil( y ) +"deg)" );
				
				speedX = Math.ceil( ( e.clientX - lastX )/2 );
				
				speedY = Math.ceil( ( e.clientY - lastY )/2 );
				
				lastX = e.clientX;
				lastY = e.clientY;
				
			});
			
			oDoc.mouseup( function()
			{
				this.onmousemove = null;
				this.onmouseup = null;
				startMove( oContainer );
				setTimeout(randomQuestion, 1000);
			});
			
			stopMove( oContainer.timer );
			return false;
		});
		
		var wheel = function( e )
		{
			onMouseWheel.call( null, e || window.event );
		};
		
		addEvent( oDoc[0], "mousewheel", wheel );
		addEvent( oDoc[0], "DOMMouseScroll", wheel );
	};
	
	/*
		加入之后使得在骰子生成之后开始转动
	*/
	window.setTimeout(function(){
		var cntcc = 0;
		var hjzgg;
		var clientX = Math.ceil(Math.random()*500);
		var clientY = Math.ceil(Math.random()*500);
		var moveX = clientX,
			moveY = clientY;
				
		var startX = x;
		var startY = y;
		
		var lastX = moveX;
		var lastY = moveY;
		<%
			if(session.getAttribute("score_acquire") != null){
		%>
				alert("您本次的得分是：<%=(Integer)session.getAttribute("score_acquire")%>分!");
		<%
				session.removeAttribute("score_acquire");
			}
		%>
		speedX = speedY = 0;
		randomQuestion();//后台请求随机题目
		hjzgg=window.setInterval(function(){
			++cntcc;
			y = startY + ( clientX - moveX )/5;
			x = startX - ( clientY - moveY )/5;
			if(cntcc==25){ 
				 window.clearInterval(hjzgg);
			}
			transform( oContainer, "perspective(" + pers + "px) rotateX("+ Math.ceil( x ) +"deg) rotateY(" + Math.ceil( y ) +"deg)" );
			
			speedX = Math.ceil( ( clientX - lastX )/2 );
			
			speedY = Math.ceil( ( clientY - lastY )/2 );
			lastX = clientX;
			lastY = clientY;
			clientX = Math.ceil(Math.random()*500);
		    clientY = Math.ceil(Math.random()*500);
		}, 100); 
	},2000); 
	
	/*********************************************************/		
};
Aui.ready(myfun);

</script>
</head>

<body>
</body>
</html>
