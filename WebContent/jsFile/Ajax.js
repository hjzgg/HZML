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