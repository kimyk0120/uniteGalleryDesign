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

    <span  class='heartIcon off' ></span>
    <img src="/genieDev/src/imgs/Heart_POP.png" id="heartPop" style="display: none" />
    <span id="memoIcon" class="off"></span>  <!--  on, off  -->
    
	<div id="gallery" style="display:none;">
		 <!-- <img alt="Preview Image 2"
			 src="/genieDev/src/images/thumbs/thumb2.jpg"
			 data-image="/genieDev/src/images/big/image2.jpg"
			 data-description="Preview Image 2 Description">

		<img alt="Youtube Video"
			 data-type="youtube"
			 data-videoid="A3PDXmYoF5U"
			 data-description="You can include youtube videos easily!">
			 
		<img alt="Preview Image 3"
			 src="/genieDev/src/images/thumbs/thumb3.jpg"
			 data-image="/genieDev/src/images/big/image3.jpg"
			 data-description="Preview Image 3 Description">

		<img alt="Vimeo Video"
			 data-type="vimeo"
			 src="http://i.vimeocdn.com/video/447294219_200x150.jpg"
			 data-image="http://i.vimeocdn.com/video/447294219_640.jpg"
			 data-videoid="73234449"
			 data-description="This gallery can also play vimeo videos!">
			
		<img alt="Preview Image 4"
			 src="/genieDev/src/images/thumbs/thumb4.jpg"
			 data-image="/genieDev/src/images/big/image4.jpg"
			 data-description="Preview Image 4 Description">  --> 
	</div>
	<span class='dateoverdes'>2018.06.25</span>
	<span class='GinieMsg'>다음 사진을 보려면 "지니야, 다음"</span>	    
    
    <br><button href="#layer2" class="btn-example" id="popupBtn" style="display: none;"></button>
    
    <!--  popup  -->
    <div class="dim-layer">
        <div class="dimBg"></div>
        <div id="layer2" class="pop-layer">
            <div class="pop-container">
                <div class="pop-conts">                    
                    <h1>Genie 안부확인 서비스</h1>                    
                    <div class="btn-r"></div>
                    <!--content //-->
                    <p class="ctxt mb20">
                        <span class="speakerImg"></span>
                        메모하실 내용을 말씀해 주세요.                        
                    </p>

                    <div class="btn-r">
                        <button class="btn-layerClose" style="background-color: #7e97d4;">취소</button>
                        <button class="btn-layerClose">저장</button>
                        <button class="btn-layerClose">재입력</button>
                    </div>
                    <!--// content-->
                </div>
            </div>
        </div>
    </div>
    <!--  .popup  --> 	
    
    <div id="instafeed" style="display: none;"></div>
    
<script type="text/javascript">
(function(){
    var api;
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
    	/* .genie init */
        
    	// insta client id
    	// f93af8ab98144afd86f6a4be6cb3279e
    	// 8091306176.f93af8a.b745ae6d974a43638e93bf348bdedadf
    	var userFeed = new Instafeed({
		    get: 'user',
		    userId: 8091306176,
		    sortBy: "most-recent",
		    limit: 20,
		    /* template: '<a href="{{link}}" target="_blank"><img src="{{image}}" />{{caption}}</a>',    */
		    /* template: '<img alt="{{caption}}" src="{{image}}" data-image="{{image}}" data-description="{{caption}}" />', */   
		    // {{link}} : 게시물 링크, {{image}} : 사진 url, {{caption}} : 게시물 텍스트
		    accessToken: '8091306176.f93af8a.b745ae6d974a43638e93bf348bdedadf',
		    /* target:'gallery', */
		    success: function(response) { 
		    	 
		    	 if ( response.data.length > 0 ) {  
	                  for(var i = 0; i < response.data.length; i++) {  
	                       var testEl = '<img alt='+response.data[i].caption.text+' src='+response.data[i].images.standard_resolution.url+' data-image='+response.data[i].images.standard_resolution.url+' data-description='+response.data[i].caption.text+'>';		
						   $("#gallery").append(testEl);
                  	  }  
		    	 }
		    }
		});
    	var asdf = userFeed.run();
    	
        $('.btn-example').click(function(){
            var $href = $(this).attr('href');
            layer_popup($href);
        });
        function layer_popup(el){
            var $el = $(el);        
            var isDim = $el.prev().hasClass('dimBg');   
            isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
            var $elWidth = ~~($el.outerWidth()),
                $elHeight = ~~($el.outerHeight()),
                docWidth = $(document).width(),
                docHeight = $(document).height();            
            if ($elHeight < docHeight || $elWidth < docWidth) {
                $el.css({
                    marginTop: -$elHeight /2,
                    marginLeft: -$elWidth/2
                })
            } else {
                $el.css({top: 0, left: 0});
            }
            // 닫기 버튼 선택시  
            $el.find('button.btn-layerClose').click(function(){
                isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); 
                return false;
            });
            // 뒤에 레이어 선택시            
            $('.layer .dimBg').click(function(){
                $('.dim-layer').fadeOut();
                return false;
            });
        }//.layer_popup
        
        
//      var testEl = '<img alt="Preview Image 2" src="images/thumbs/thumb2.jpg" data-image="images/big/image2.jpg" data-description="testest">';		
//		$("#gallery").prepend(testEl);	 			 
        
        // 가운데 하트        
        //$("#heartPop").show();
        
        
        // 지니 메세지 랜덤 노출
        var genieInfoMsg = [];
        genieInfoMsg.push('다음 사진을 보려면 "지니야, 다음"');
        genieInfoMsg.push('이전 사진을 보려면 "지니야, 이전"');
        genieInfoMsg.push('사진을 즐겨찾기 하려면 "지니야, 즐겨찾기해줘"');
        genieInfoMsg.push('목록으로 이동하려면 "지니야, 메인"');
        genieInfoMsg.push('목록으로 이동하려면 "지니야, 목록"');
        genieInfoMsg.push('좋아요를 표시하려면 "지니야, 좋아요"');
        genieInfoMsg.push('사진에 메모를 남기려면 "지니야, 메모"');
        genieInfoMsg.push('사진에 메모를 보려면 "지니야, 메모 보여줘"');
        genieInfoMsg.push('사진을 자동으로 보려면 "지니야, 자동"');
        genieInfoMsg.push('사진을 자동으로 보려면 "지니야, 자동으로 보여줘"');
        genieInfoMsg.push('사진을 확대하려면 "지니야, 확대"');
        genieInfoMsg.push('사진을 축소 하려면 "지니야, 축소"');
        
        
        var setGenieMsg = setInterval(function(){
            var ranNo = Math.floor(Math.random() * genieInfoMsg.length);            
            $(".GinieMsg").html(genieInfoMsg[ranNo]);            
        },5000);
        
        setTimeout(function(){
        	api = jQuery("#gallery").unitegallery({
                thumb_image_overlay_effect:true,
                theme_enable_fullscreen_button: false,
                theme_enable_play_button: false,
                theme_enable_hidepanel_button: false,
                theme_enable_text_panel: true,
                gallery_width:1920,							
                gallery_height:1080,
                slider_scale_mode: "fit",
                slider_enable_zoom_panel:false,
                slider_textpanel_enable_bg:false,
                slider_textpanel_desc_bold:"bold",
                slider_textpanel_desc_font_size:50,
            });  
        	
        },800)
        
        
        
     //@@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@
     
     
        
     // 지니 발화 - 인텐트
     var memoVal;
    	gigagenie.voice.onActionEvent=function(extra){
    		console.log("onActionEvent");
		   	console.log(extra.actioncode);
		   	
		   	if(extra.actioncode == 'NEXTPICTURE'){ // 다음 - 다음페이지	
		   		api.nextItem();
		   	}else if(extra.actioncode == 'PREVPICTURE'){  // 이전 - 이전페이지
		   		api.prevItem();
		   	}else if(extra.actioncode == 'HOME'){ // 홈으로 - index.do로 이동
		   		location.href = "index.do";		   		
		   	}else if(extra.actioncode == 'LIKEIT'){ // 좋아요
		   		$("#heartPop").show("slow");
				$(".heartIcon").removeClass("off").addClass("on");
				setTimeout(function(){
					$("#heartPop").hide("slow");
				},800);
		   	}else if(extra.actioncode == 'MEMO'){ //
		   		
		   		$(".btn-example").trigger("click");
		   			
		   		var options={};
	    	   	 options.voicemsg="메모하실 내용을 말씀해 주세요.";
	    	   	 gigagenie.voice.getVoiceText(options,function(result_cd,result_msg,extra){
	    	   	     if(result_cd===200){
	    	   	         console.log("Received Text is "+extra.voicetext);
						 $(".ctxt.mb20").text(extra.voicetext);	    	   	         
	    	   	     };
	    	   	 });
		   	
		   	}else if(extra.actioncode == 'ZOOMIN'){ // 확대
		   		api.zoomIn();
		   	}else if(extra.actioncode == 'ZOOMOUT'){ // 축소
		   		api.zoomOut();
		   	}else if(extra.actioncode == 'SAVE'){ // 저장
		   		$(".btn-layerClose").trigger("click");
		   		$("#memoIcon").removeClass("off").addClass("on");
		   		
		   	}else if(extra.actioncode == 'REINPUT'){ // 재입력
		   		$(".ctxt.mb20").text("");
		   		var options={};
	    	   	 options.voicemsg="메모하실 내용을 말씀해 주세요.";
	    	   	 gigagenie.voice.getVoiceText(options,function(result_cd,result_msg,extra){
	    	   	     if(result_cd===200){
	    	   	         console.log("Received Text is "+extra.voicetext);
	    	   	         memoVal = extra.voicetext
						 $(".ctxt.mb20").text(extra.voicetext);	    	   	         
	    	   	     };
	    	   	 });
		   	}else if(extra.actioncode == 'AUTOVIEW'){ // 자동넘김
		   		api.play();
		   	}else if(extra.actioncode == 'AUTOVIEWCANCEL'){ // 자동넘김 취소
		   		api.stop();
		   	}else if(extra.actioncode == 'CANCEL'){ // 취소
		   		$(".btn-layerClose").trigger("click");
		   	}else if(extra.actioncode == 'DIRECTVIEW'){ // n번 보여줘
		   		
		   	}else if(extra.actioncode == 'VIEWMEMO'){ // 메모보여줘
		   		$(".ctxt.mb20").text(memoVal);
		   		$(".btn-example").trigger("click");
		   	
		   	}
		   	
		   	
    	}//.지니 발화 - 인텐트
    	
    	
        gigagenie.voice.onVoiceCommand=function(event){
       	    console.log("onVoiceCommand");
               switch(event){
                   case 'NEXTPICTURE':
                	   api.nextItem();
                       break;
                   case 'nextPage':
                	   api.nextItem();
                       break;
                   case 'naviNext':
                	   api.nextItem();
                       break;
                   case 'PREVPICTURE':
                	   api.prevItem();
                        break;    
                   case 'prevPage':
                	   api.prevItem();
                        break;    
                   case 'naviPrev':
                	   api.prevItem();
                        break;    
                   default:
                       break;
               }
          }
    	
    	
 	//@@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@ @@@@@@@@@@@@
        
        
    });//endDomReady
})();//endWinOnload		
</script>
</body>
</html>
    
<!--  api  -->
<!--
api.play()					//start play mode
api.stop()					//stop play mode
api.togglePlay()			//toggle play mode
api.enterFullscreen()		//enter fullscreen
api.exitFullscreen()		//exit fullscreen		
api.toggleFullscreen()		//toggle fullscreen
api.zoomIn()				//zoom in current image
api.zoomOut()				//zoom out current image
api.resetZoom()				//reset zoom to fit zoom mode
api.nextItem()				//next item
api.prevItem()				//previous item
api.selectItem(numItem)		//go to some item by index (0-numItems)
api.resize(width, height)	//resize the gallery to some width. Height is optionary.
api.getItem(numItem)		//get data object of the item by some index.
api.getNumItems()			//get number of items in the gallery    
-->
<!--  api events  -->
<!--
api.on("item_change",function(num, data){		//on item change, get item number and item data
    //do something
});

api.on("resize",function(){				//on gallery resize
    //do something
});

api.on("enter_fullscreen",function(){	//on enter fullscreen
    //do something
});

api.on("exit_fullscreen",function(){	//on exit fulscreen
    //do something
});

api.on("play",function(){				//on start playing
    //do something
});

api.on("stop",function(){				//on stop playing
    //do something
});

api.on("pause",function(){				//on pause playing
    //do something
});

api.on("continue",function(){			//on continue playing
    //do something
});
-->
<!--  data field  -->
<!--
data.index			 
data.title			 
data.description
data.urlImage
data.urlThumb

//that taken from <img... data-custom="value" ... > from gallery markup

data.custom 	//item custom field passed.	    
-->
<!--  notice  -->
<!--    

//Failed to execute 'requestFullscreen' on 'Element': API can only be initiated by a user gesture.


-->