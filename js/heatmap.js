function init(){
	var map = new L.Map("map");
	var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/997/256/{z}/{x}/{y}.png',
		cloudmadeAttrib = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade',
		cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttrib});
	map.addLayer(cloudmade);

	map.setView(new L.LatLng(53.55, 9.90), 11);                
	var heatmap = new L.TileLayer.HeatCanvas({},{'step':0.5, 'degree':HeatCanvas.LINEAR, 'opacity':0.7});
	var data = [[40.71455, -74.007124, 103], [37.777125, -122.419644, 86], [47.60356, -122.329439, 41]];

	var xml = "<root>"+$("#xmldisplay").val()+"</root>", xmlDoc = $.parseXML(xml), $xml = $(xmlDoc),
	data = $(xml).find("node").each(function() {
		$("#hdata").append("["+$(this).attr("lat")+","+$(this).attr("lon")+","+(20).toString()+"],");
	});
	// todo: vervang de dummy waarde (20).toString() door count(tag) per node, evt. * factor:
	hd = $("#hdata").text();
	hd = hd.substring(0,hd.length-1);
	data = $.parseJSON("["+hd+"]");
	
	for(var i=0,l=data.length; i<l; i++) {
		heatmap.pushData(data[i][0], data[i][1], data[i][2]);
		//if(data[i][2]> 10) {
		//    var marker = new L.Marker(new L.LatLng(data[i][0], data[i][1]));
		//    marker.bindPopup(data[i].toString());
		//    map.addLayer(marker);
		//}
	}
	map.addLayer(heatmap);
}
