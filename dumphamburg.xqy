xquery version "1.0-ml";
(: dumphamburg.xqy :)
declare namespace hb = "http://www.marklogic.com/ns/osm-hamburg";
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor</title>
<link rel="stylesheet" type="text/css" media="screen" href="css/reset-fonts.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/examples.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/tabs.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/osmeditor.css" />
 <link rel="stylesheet" href="css/leaflet-0.4/leaflet.css" />
 <!--[if lte IE 8]>
     <link rel="stylesheet" href="css/leaflet-0.4/leaflet.ie.css" />
 <![endif]-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/ui/extensions/ui.tabs.paging.js"></script>
<script type="text/javascript" src="js/leaflet-0.4/leaflet.js"></script>
<script type="text/javascript" src="js/jquery.jeditable.mini.js"></script>
<script type="text/javascript" src="js/osmeditor.js"></script>
</head>
<body>
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
<h4 class="nonedit">
User:
{ string($node/@user) }
</h4>
<div id="tableholder">
<table id="table{ string($node/@id) }" class="tags">
<thead><tr><th>Key</th><th>Value</th></tr></thead><tbody>
{
for $tag at $pos in $node/hb:tag
return
<tr><td class="nonedit">
{ string($tag/@k) }
</td><td class="edit" id="{ string($node/@id) }_{ string($pos) }_{ string($tag/@k) }">
{ string($tag/@v) }
</td></tr>
}
</tbody></table>
<!--
<a href="updatehamburg-form.xqy" osmid="{ string($node/@id) }" >Update Tags</a>
-->
</div>
<p>
<input type="button" value="Show on map" class="showonmap" osmid="{ string($node/@id) }" osmlat="{ string($node/@lat) }" osmlon ="{ string($node/@lon) }" ></input>
<input type="button" value="Update tags" class="updatetags" osmid="{ string($node/@id) }" ></input>
<input type="button" value="Add tag" class="addtag" osmid="{ string($node/@id) }"></input>
</p>
</div>
}
<!--
todo: map does not show zoomin/out images anymore, fix!
-->
<div id="map"></div>
</div>
</body>
</html>