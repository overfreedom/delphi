function ClickWindow(url, w, h){ 
   var lf = (screen.width/2)-(w/2);
   var tp = (screen.height/2)-(h/2);

   window.open(url, "_blank", 'width='+w+', height='+h+', top='+tp+', left='+lf+', srocollbars=yes' );
}

function ClickReport(url){
   window.open(url);
}

function pinSymbol(color) { 
	return { 
		path: 'M 0,0 C -2, -17 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-17 0, 0 z', 
		fillColor: color, 
		fillOpacity: 1, 
		strokeWeight: 1, 
		scale: 1
	}; 
}

// M 0,0 C -2, 0 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,0 0, 0 z
// M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z

function pinSymbol_(color) { 
	return { 
		path: 'M 0,0 C -2, 0 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,0 0, 0 z', 
		fillColor: color, 
		fillOpacity: 1, 
		strokeWeight: 1, 
		scale: 1
	}; 
}