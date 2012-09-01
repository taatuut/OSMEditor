xquery version "1.0-ml";
(: dumphamburg.xqy :)
declare namespace hb = "http://www.marklogic.com/ns/osm-hamburg";
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor</title>
</head>
<body>
<h1>MarkLogic OSM Editor</h1>
{
(: todo - only if node count > 0 :)
for $node in doc("hamburg.xml")/hb:hamburg/hb:node
return

<div class="node" id="{ string($node/@id) }">
User: { string($node/@user) }
<br/>
Tags:
<table style="border:1px black solid;">
<thead>
<tr>
<th>
Key</th>
<th>
Value
</th>
</tr>
</thead>
{for $tag in $node/hb:tag
return
<tr><td>
{ string($tag/@k) }
</td><td>
{ string($tag/@v) }
</td></tr>
}</table>
</div>
}

<a href="updatehamburg-form.xqy">Update Tags</a>
</body>
</html>
