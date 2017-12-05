xquery version "1.0-ml";
(: updatehamburg-write.xqy :)
declare namespace hb="http://www.marklogic.com/ns/osm-hamburg";
declare function local:updateFirstTag()
{
if (doc("hamburg.xml")) then
let $id := xdmp:get-request-field("id")
let $key := xdmp:get-request-field("key")
let $value := xdmp:get-request-field("value")
let $n := doc("hamburg.xml")/hb:hamburg/hb:node[@id = $id]
return
if ($n) then
(
xdmp:node-replace($n/hb:tag,
<hb:tag>{ attribute k {$key}, attribute v {$value} }</hb:tag>)
,
xdmp:redirect-response("dumphamburg.xqy")
)
else
<span>Could not locate node with id { $id }.</span>
else
<span>Unable to access parent XML document.</span>
};
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Update In Process</title>
</head>
<body>
Attempting to complete update and redirect browser to detail page.
<p>
If you are seeing this page, either the redirect has failed
or the update has failed. The update has failed if there is
a reason provided below:
<br/>
{ local:updateFirstTag() }
</p>
</body>
</html>