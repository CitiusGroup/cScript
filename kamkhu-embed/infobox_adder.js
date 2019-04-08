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
		console.log("meni");
		window.open("https://www.iubenda.com/api/privacy-policy/91125875");
		return false;
	}
	
	function loadExternalLibs() {
		
		$.getScript("https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js").done(function(){
			
			// Apply fixed width to modals that have a `data-modal-width` attribute
			//
			$(document).on($.modal.BEFORE_OPEN, '.modal[data-modal-max-width]', function(event, modal) {
				
				modal.elm.css('max-width', modal.elm.data().modalMaxWidth);
			});
		});
		
		$("head").append("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css\" />");
	}
	
	var loader = function () {
		
		// Add modal library
		//
		loadExternalLibs();
		
		
		// Create modal window
		//
		var modal = $("<div id=\"myModalWindow\" class=\"modal\" data-modal-max-width=\"1200\"></div>");
		
		
		// Create link element
		//
		var link = $("<a>", {
			text: "Kalustoluettelo",
			title: "Kalustoluettelo",
			href: "javascript:void(0)",
			//href: "#myModalWindow",
			//rel: "modal:open",
			click: function(){
				$.ajax({
					type: "GET",
					url: "https://www.iubenda.com/api/privacy-policy/91125875",
					success: function(json){
						
						// Set the loaded content into window
						//
						$("#myModalWindow").html(json.content);
						
						// Show the window
						//
						$("#myModalWindow").modal({
							fadeDuration: 75,
							closeText: "Sulje"
						});
					}
				})
			}
		});
		
		
		// Create container element
		//
		var container = $("<div>", {
			css: {
				background: "lightgray",
				height: "50px",
				width: "100%"
			}
		});
		
		// Append elements into container
		//
		$(container).append(modal);
		$(container).append(link);
		
		
		// Set the container to body
		//
		$("body").append(container);
		
		
		
		
		
		/*
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
		*/
		
	}; 
	
	if( w.addEventListener){
		w.addEventListener("load", loader, false);
	} else if (w.attachEvent){
		w.attachEvent("onload", loader);
	}else{
		w.onload = loader;
	}
})(window, document);

