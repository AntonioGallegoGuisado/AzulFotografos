	var isNS = (navigator.appName == "Netscape") ? 1 : 0;
	
	if(navigator.appName == "Netscape") document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP);

		
	$(document).keydown(function(event){
    if(event.keyCode==123){
    return false;
   }
	else if(event.ctrlKey && event.shiftKey && event.keyCode==73){        
      return false;  //Prevent from ctrl+shift+i
   }
});
	
	document.ondragstart= function(){return false};
	document.onselectstart= function(){return false};
	
	function disableselect(e) {             
          return false 
      } 
      function reEnable() { 
          return true 
      } 

      document.onselectstart = new Function("return false") 

      if (window.sidebar) { 
          document.onmousedown = disableselect                    // for mozilla           
          document.onclick = reEnable 
      } 

      function clickIE() { 
          if (document.all) { 
              (message); 
              return false; 
          } 
      } 


      document.oncontextmenu = new Function("return false") 

      var element = document.getElementById('tbl'); 

      element.onmousedown = function () { return false; }        // For Mozilla Browser
	
	function mischandler(){
	return false;
	}
	
	function mousehandler(e){
	var myevent = (isNS) ? e : event;
	var eventbutton = (isNS) ? myevent.which : myevent.button;
	if(eventbutton==2) return false;
	}
	document.oncontextmenu = mischandler;
	document.onmousedown = mousehandler;
	document.onmouseup = mousehandler;
