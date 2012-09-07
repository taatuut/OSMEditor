xquery version "1.0-ml";
(: spatialsearchhamburg.xqy :)

declare namespace hb="http://www.marklogic.com/ns/osm-hamburg"; 
declare function local:ss()
{
let $r := cts:search(doc("hamburg.xml")//hb:hamburg/hb:node, 
  cts:element-attribute-pair-geospatial-query(xs:QName("hb:node"), 
    xs:QName("lat"), xs:QName("lon"), cts:box(53.2, 9.5, 53.8, 9.9)))
	return
 <textarea id="xmldisplay">{$r}</textarea>
 };
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor - Spatial search  OpenStreetMap data set</title>
<link rel="stylesheet" href="http://leaflet.cloudmade.com/dist/leaflet.css" />
<link rel="stylesheet" type="text/css" href="css/default.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="http://leaflet.cloudmade.com/dist/leaflet.js" type="text/javascript"></script>
<script type="text/javascript" src="js/heatcanvas.js"></script>
<script type="text/javascript" src="js/heatcanvas-leaflet.js"></script>
<script type="text/javascript" src="js/heatmap.js"></script>
</head>
<body onload="init();">
{local:ss()}
<div id="map" style="width:850px; height:500px;"></div>
<!--
todo:
- something nice with results
- some input tool, could be both input boxes then post request so add handling request parameters too and/or use leaflet map as input
leaflet heatmap from http://sunng87.github.com/heatcanvas/leaflet.html
-->
<div id="hdata"></div>
</body>
</html>
