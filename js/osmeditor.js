$(function($) {
// tab paging
$('#example').tabs();
$('#example').tabs('paging');

//Leaflet OSM map
var blnStaticStartlocation = true;
if (blnStaticStartlocation) {
	map = L.map('map').setView([51.8361, 5.8667], 16);
}
else {
	map = L.map('map');
	map.locate({setView: true, maxZoom: 16});
}
L.tileLayer('http://{s}.tile.cloudmade.com/1cb8ec5bee914c668126ca5ef43fd201/997/256/{z}/{x}/{y}.png', {
	attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
	maxZoom: 18
}).addTo(map);

// bind functions

$(".showonmap").bind("click", function() {
var id = $(this).attr("osmid");
var lat = $(this).attr("osmlat");
var lon = $(this).attr("osmlon");
var tableId = '#table'+id;
$(tableId + ' td').attr('class', 'edit');
var tableHtml = $(tableId).parent().html();
map.panTo([lat, lon]);
var marker = L.marker([lat, lon]).addTo(map);
marker.bindPopup(tableHtml).openPopup();
});

$(".updatetags").bind("click", function() {
var id = $(this).attr("osmid");
var tableId = '#table'+id;
$(tableId).css({'border': '2px red solid'});
$(tableId + ' td.edit').editable();
});

});
