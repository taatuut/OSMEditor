xquery version "1.0-ml";
(: spatialsearchhamburg.xqy :)

declare namespace hb="http://www.marklogic.com/ns/osm-hamburg"; 
declare function local:ss()
{
let $r := cts:search(doc("hamburg.xml")//hb:hamburg/hb:node, 
  cts:element-attribute-pair-geospatial-query(xs:QName("hb:node"), 
    xs:QName("lat"), xs:QName("lon"), cts:box(53.5, 9.71, 53.6, 9.72)))
	return
 <pre>{$r}</pre>
 };
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor - Spatial search  OpenStreetMap data set</title>
</head>
<body>
<b>Now query</b>
{local:ss()}
<!--
todo:
- something nice with results
- some input tool, could be both input boxes then post request so add handling request parameters too and/or use leaflet map as input
-->
</body>
</html>
