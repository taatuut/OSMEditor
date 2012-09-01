xquery version "1.0-ml";
(: dumphamburg.xqy :)
declare namespace hb = "http://www.marklogic.com/ns/osm-hamburg";
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor</title>
<link rel="stylesheet" type="text/css" media="screen" href="css/reset-fonts.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/examples.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/leaflet.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/osmeditor.css" />
 <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4/leaflet.css" />
 <!--[if lte IE 8]>
     <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4/leaflet.ie.css" />
 <![endif]-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/ui/extensions/ui.tabs.paging.js"></script>
<script type="text/javascript" src="http://cdn.leafletjs.com/leaflet-0.4/leaflet.js"></script>
<script type="text/javascript" src="js/osmeditor.js"></script>
</head>
<body>
<h1>MarkLogic OSM Editor</h1>
<div id="example">
<ul class="tabs">
{
(: todo - only if node count > 0 :)
(: tabs :)
for $node in doc("hamburg.xml")/hb:hamburg/hb:node
return
<li><a href="#{ string($node/@id) }"><span>{ string($node/@id) }</span></a></li>
}
</ul>

{
(: panes :)
for $node in doc("hamburg.xml")/hb:hamburg/hb:node
return
<div id="{ string($node/@id) }">
<div class="user">{ string($node/@user) }</div>
<table id="table{ string($node/@id) }" class="tags">
<thead><tr><th>Key</th><th>Value</th></tr></thead>
{for $tag in $node/hb:tag
return
<tr><td>
{ string($tag/@k) }
</td><td>
{ string($tag/@v) }
</td></tr>
}</table>
<a href="updatehamburg-form.xqy">Update Tags</a>
<input type="button" value="Show on map" onclick="showMap({ string($node/@id) }, { string($node/@lat) }, { string($node/@lon) });" ></input>
</div>
}
<div id="map"></div>
</div>
</body>
</html>