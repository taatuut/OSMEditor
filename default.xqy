xquery version "1.0-ml";
(: default.xqy :)
declare namespace hb = "http://www.marklogic.com/ns/osm-hamburg";
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor - Introduction</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.snippet.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/snippet/jquery.snippet.min.js"></script>
<script type="text/javascript" src="js/jquery.corner.js"></script>
<script type="text/javascript" src="js/default.js"></script>
</head>
<body>
<div id="fixed-tr">
<hr/>
<hr/>
<h4>
Time to show what it does
</h4>
<ol dir="rtl">
<li>
<a href="loadhamburg.xqy" target="_blank">
Load sample OpenStreetmap data set for city of Hamburg, Germany
</a>
</li>
<li>
<a href="dumphamburg.xqy" target="_blank">
Display all nodes data from sample data set, show on map and edit OpenStreetmap tags
</a>
</li>
<li>
<a href="" target="_blank">
</a>
Search the data first instead of displaying all - way too much in real OpenStreetMap life
</li>
<li>
<a href="" target="_blank">
</a>
Same display and edit functionality for ways and relations
</li>
</ol>
</div>
<h1>
MarkLogic OSM Editor - Introduction
</h1>
<p>
This is my personal test project using MarkLogic to edit OpenStreetmap data.<br/>
The first version focuses on displaying and querying the data, both relational and spatial.<br/>
Updating information is possible too.<br/>
The data used is a tiny piece of the total OpenStreetmap database and I'm not making changes on any real data (yet).
</p>
<p>
<h4>
How does it look?
</h4>
</p>
<p>
<img src="images/mlosmeditor1.png" />
</p>
<p>
<h4>
Possible enhancements
</h4>
</p>
<p>
Too much to note right now.
<!--
But I'd like to add the following:
Heatmap
MarkLogic xquery paging
-->
</p>
<p>
<h4>
Why this OpenStreetmap editor?
</h4>
</p>
<p>
OpenStreetmap database is quite large, over <a href="http://wiki.openstreetmap.org/wiki/Planet.osm" target="_blank">250 GB</a> currently. OpenStreetmap data is in XML format. Sounds like a good candidate for MarkLogic database capable of handling any data, at any volume, in any structure.
</p>
<p>
<h4>
Statistics
</h4>
There are currently xxx objects in the sample OpenStreetmap datab set used in this application:<br/>
xxx nodes<br/>
xxx ways<br/>
xxx relations<br/>
</p>
<p>
<h4>
Software and data used
</h4>
<ul>
<li>
MarkLogic 5.0-3.3
</li>
<li>
OpenStreetMap, Leaflet &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery &copy; <a href="http://cloudmade.com">CloudMade</a>
<!--
http://leaflet.cloudmade.com/
-->
</li>
<li>
jQuery, jQuery UI, Jeditable, jquery-ui-tabs-paging, Snippet, jQuery Corner
<!--
http://jquery.com/
http://jqueryui.com/
http://www.appelsiini.net/projects/jeditable
http://code.google.com/p/jquery-ui-tabs-paging/
http://www.steamdev.com/snippet/
https://github.com/malsup/corner
-->
</li>
</ul>
</p>
<p>
<h4>
Sample OpenStreetMap data
</h4>
<pre class="xml">
&lt;hamburg xmlns="http://www.marklogic.com/ns/osm-hamburg"&gt;
	&lt;node id="122317" lat="53.5282681" lon="10.0232293" version="6" changeset="11135712" user="cassy" uid="578473" timestamp="2012-03-29T10:05:34Z"&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:Class" v="Point" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:Direction" v="positive" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:LCLversion" v="8.00" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:LocationCode" v="10696" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:NextLocationCode" v="10697" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:PrevLocationCode" v="10695" /&gt;
	&lt;/node&gt;
	&lt;node id="122318" lat="53.5297724" lon="10.0242429" version="5" changeset="11135712" user="cassy" uid="578473" timestamp="2012-03-29T10:05:33Z"&gt;
		&lt;tag k="highway" v="speed_camera" /&gt;
	&lt;/node&gt;
	&lt;node id="122329" lat="53.5375321" lon="10.0310097" version="9" changeset="8215853" user="FvGordon" uid="161619" timestamp="2011-05-22T12:59:16Z"&gt;
		&lt;tag k="highway" v="traffic_signals" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:Class" v="Point" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:Direction" v="positive" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:LCLversion" v="8.00" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:LocationCode" v="35609" /&gt;
		&lt;tag k="TMC:cid_58:tabcd_1:PrevLocationCode" v="53868" /&gt;
	&lt;/node&gt;
	&lt;node id="122331" lat="53.5390823" lon="10.0323663" version="5" changeset="235617" user="mbuege" uid="4902" timestamp="2008-04-23T20:22:49Z"/&gt;
	&lt;node id="122332" lat="53.5391351" lon="10.0323397" version="6" changeset="8215853" user="FvGordon" uid="161619" timestamp="2011-05-22T12:59:52Z"/&gt;
	&lt;node id="94277077" lat="53.5224788" lon="10.0245725" version="2" changeset="1442329" user="klausis" uid="85761" timestamp="2009-06-06T21:36:13Z"/&gt;
	&lt;node id="94277079" lat="53.5238790" lon="10.0233364" version="5" changeset="8883299" user="Glühwürmchen" uid="349191" timestamp="2011-07-31T17:40:23Z"&gt;
		&lt;tag k="highway" v="motorway_junction" /&gt;
		&lt;tag k="name" v="Hamburg-Veddel" /&gt;
		&lt;tag k="ref" v="1" /&gt;
	&lt;/node&gt;
&lt;/hamburg&gt;
</pre>
</p>
</body>
</html>