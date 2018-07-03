<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="Description" content=""/>
<meta property="og:type" content="website">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:image" content="">
<meta property="og:url" content="">
<meta property="og:site_name" content=""/>
<meta name="Keywords" content=""/>
<meta name="Author" content=""/>
<meta name="robots" content="">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="height=1080, width=1920, user-scalable=no" />
<title>GIGAGenie Gallery</title>
	<script type='text/javascript' src='/genieDev/src/unitegallery/js/jquery-11.0.min.js'></script>		
    <script type='text/javascript' src='/genieDev/src/javascripts/unitegallery.min.js'></script>
    <script type='text/javascript' src='/genieDev/src/javascripts/instafeed.min.js'></script>    
	<link rel='stylesheet' href='/genieDev/src/unitegallery/css/unite-gallery.css' type='text/css' />
	<script type='text/javascript' src='/genieDev/src/unitegallery/themes/default/ug-theme-default.js'></script>
    <link rel='stylesheet' 		  href='/genieDev/src/unitegallery/themes/default/ug-theme-default.css' type='text/css' />  
    <link rel='stylesheet' 		  href='/genieDev/src/css/common.css' type='text/css' />
    
    <script type="text/javascript" src="https://svcapi.gigagenie.ai/sdk/v1.0/js/gigagenie.js"></script>
    <script type="text/javascript" src="/genieDev/src/javascripts/gigagenie_module.js"></script>
</head>
<body>

<img alt="" src="/genieDev/src/imgs/MAIN.png">
<div id="instafeed" style="display: none;"></div>

<script type="text/javascript">
(function(){
	$(document).ready(function(){
		
		var cid = '${cid}';
    	if(!cid) {
			gigagenieInit(function(containerId) {
				cid = containerId;
			});
		} else {
			gigagenieInit(function(containerId) {
			    cid = containerId; 
			});
		}
		
		setTimeout(function(){
			var userFeed = new Instafeed({
			    get: 'user',
			    userId: 8091306176,
			    sortBy: "most-recent",
			    limit: 20,
			    accessToken: '8091306176.f93af8a.b745ae6d974a43638e93bf348bdedadf',
			    success: function(response) { 
			    	
		        	 alert(response.data.length+"개의 새로운 사진이 있습니다. 보시겠습니까?"); 
		        	//callback 방식으로, TTS로 재생한 후 음성 인식을 할 경우
		    	   	 var options={};
		    	   	 options.mode=2;
		    	   	 options.voicemsg=response.data.length+"개의 새로운 사진이 있습니다. 보시겠습니까?";
		    	   	 gigagenie.voice.getVoiceText(options,function(result_cd,result_msg,extra){
		    	   	     if(result_cd===200){
		    	   	    	 console.log(event);
		    	   	         console.log("Received Text is "+extra.voicetext);
		    	   	     };
		    	   	 });
		        	 
			    }
			});
	    	var asdf = userFeed.run();
	    	
	    	
		},3000);
		
		  gigagenie.voice.onVoiceCommand=function(event){
       	    console.log("onVoiceCommand");
               switch(event){
                   case 'confirm':
                	   location.href = "geniegallery.do?cid="+cid;
                       break;
                   case 'cancel':
                        break;    
                   default:
                       break;
               }
          }
		
		
		
	});
})()
</script>
</body>
</html>
