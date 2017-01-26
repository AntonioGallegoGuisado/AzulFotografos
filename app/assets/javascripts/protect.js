	var isNS = (navigator.appName == "Netscape") ? 1 : 0;
	
	if(navigator.appName == "Netscape") document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP);
	
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
	
	$(document).keydown(function(event){
    if(event.keyCode==123){
    return false;
   }
	else if(event.ctrlKey && event.shiftKey && event.keyCode==73){        
      return false;  //Prevent from ctrl+shift+i
   }
});