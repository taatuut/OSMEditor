xquery version "1.0-ml";
(: spatialsearchhamburg.xqy :)
(: http://rockycode.com/blog/marklogic-external-variable-access/ :)
(: http://xquerywebappdev.wordpress.com/category/tips-n-tricks/ :)
declare namespace hb="http://www.marklogic.com/ns/osm-hamburg"; 
declare function local:llclat()
{
let $llclat := 53.2
let $urillclat := xdmp:get-request-field("llclat")
let $rllclat := if (fn:string-length($urillclat) < 1) then $llclat else $urillclat
return
xs:double($rllclat)
};
declare function local:llclon()
{
let $llclon := 9.7
let $urillclon := xdmp:get-request-field("llclon")
let $rllclon := if (fn:string-length($urillclon) < 1) then $llclon else $urillclon
return
xs:double($rllclon)
};
declare function local:urclat()
{
let $urclat := 53.8
let $uriurclat := xdmp:get-request-field("urclat")
let $rurclat := if (fn:string-length($uriurclat) < 1) then $urclat else $uriurclat
return
xs:double($rurclat)
};
declare function local:urclon()
{
let $urclon := 10.1
let $uriurclon := xdmp:get-request-field("urclon")
let $rurclon := if (fn:string-length($uriurclon) < 1) then $urclon else $uriurclon
return
xs:double($rurclon)
};
declare function local:nodesearch()
{
let $r := cts:search(doc("hamburg.xml")//hb:hamburg/hb:node, 
  cts:element-attribute-pair-geospatial-query(xs:QName("hb:node"), 
    xs:QName("lat"), xs:QName("lon"), cts:box(local:llclat(), local:llclon(), local:urclat(), local:urclon())))
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
<script type="text/javascript">
var viewlat = {local:llclat()} + ({local:urclat()} - {local:llclat()})/2;
var viewlon = {local:llclon()} + ({local:urclon()} - {local:llclon()})/2;
</script>
</head>
<body>
{local:nodesearch()}
<div id="map" style="width:850px; height:500px;"></div>
<!--
leaflet heatmap from http://sunng87.github.com/heatcanvas/leaflet.html
-->
<form id="frmBoundingBox" action="" method="post">
LLC LAT <input type="text" id="llclat" name="llclat" value="{local:llclat()}"/>
<br/>
LLC LON <input type="text" id="llclon" name="llclon" value="{local:llclon()}"/>
<br/>
URC LAT <input type="text" id="urclat" name="urclat" value="{local:urclat()}"/>
<br/>
URC LON <input type="text" id="urclon" name="urclon" value="{local:urclon()}" />
<input type="submit" value="Set Bounding Box" />
</form>
<div id="hdata"></div>
</body>
</html>
