$(document).ready(function(){

	var baseLayer = L.tileLayer(
		'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
		  attribution: '...',
		  maxZoom: 18
		}
	  );
	  
	  var cfg = {
		"radius": 20,
		"maxOpacity": .8, 
		"scaleRadius": false, 
		"useLocalExtrema": false,
		latField: 'lat',
		lngField: 'lng',
		valueField: 'count'
	  };
	  
	var heatmapLayer = new HeatmapOverlay(cfg);
	var map = new L.Map('map', {
	  center: new L.LatLng(viewlat, viewlon),
	  zoom: 10,
	  layers: [baseLayer, heatmapLayer]
	  //layers: [baseLayer]
  });
	
	var data;

	var xml = "<root>"+$("#xmldisplay").val()+"</root>", xmlDoc = $.parseXML(xml), $xml = $(xmlDoc),
	data = $(xml).find("node").each(function() {
		$("#hdata").append("{\"lat\":"+$(this).attr("lat")+", \"lng\":"+$(this).attr("lon")+", \"count\":"+($(this).children("tag").length^3).toString()+"},");
	});
	// todo: vervang de dummy waarde (20).toString() door count(tag) per node, evt. * factor:
	hd = $("#hdata").text();
	hd = hd.substring(0,hd.length-1);
	data = JSON.parse("["+hd+"]");
	
	var testData = {
		max: 4,
		data: data
	};
	  
	  heatmapLayer.setData(testData);
	  
});
