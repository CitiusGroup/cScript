(function (w,d) {
	
	function attachEvent(el, eventName, fn) {
		
		if( el.addEventListener){
			el.addEventListener(eventName, fn, false);
		} else if (el.attachEvent){
			el.attachEvent("on" + eventName, fn);
		}
	}
	
	function openInfo()
	{
		window.open("https://www.iubenda.com/api/privacy-policy/91125875");
		return false;
	}
	
	var loader = function () {
		
		var l = d.createElement("a");
		l.title = "Kalustoluettelo";
		l.href = "javascript:void(0)";
		l.innerHTML = "Kalustoluettelo";
		attachEvent(l, "click", openInfo);
		
		var c = d.createElement("div");
		c.style.background = "lightgray";
		c.style.height = "50px";
		c.style.width = "50%";
		c.style.margin = "auto";
		d.body.appendChild(c);
		
		c.appendChild(l);
	}; 
	
	if( w.addEventListener){
		w.addEventListener("load", loader, false);
	} else if (w.attachEvent){
		w.attachEvent("onload", loader);
	}else{
		w.onload = loader;
	}
})(window, document);