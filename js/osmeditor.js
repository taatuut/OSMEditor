$(function($) {
$('#example').tabs();
$('#example').tabs('paging');
//map = L.map('map').setView([51.8361, 5.8667], 16);
map = L.map('map');
L.tileLayer('http://{s}.tile.cloudmade.com/1cb8ec5bee914c668126ca5ef43fd201/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
}).addTo(map);
map.locate({setView: true, maxZoom: 16});
});

function showOnMap(id,lat,lon) {
var tableId = '#table'+id;
var tableHtml = $(tableId).parent().html();
map.panTo([lat, lon]);
var marker = L.marker([lat, lon]).addTo(map);
marker.bindPopup(tableHtml).openPopup();
}
