xquery version "1.0-ml";
(: updatehamburg-writeditable.xqy :)
declare namespace hb="http://www.marklogic.com/ns/osm-hamburg";
declare function local:updateTag()
{
if (doc("hamburg.xml")) then
let $tokens := fn:tokenize(xdmp:get-request-field("id"), "_")
let $id := $tokens[1]
let $pos := $tokens[2]
let $key := $tokens[3]
let $value := xdmp:get-request-field("value")
let $tag := doc("hamburg.xml")/hb:hamburg/hb:node[@id = $id]/hb:tag[string(position()) = $pos]
return
if ($tag) then
(xdmp:node-replace($tag,<hb:tag>{ attribute k {$key}, attribute v {$value} }</hb:tag>),$value)
else
<span>Could not locate node with id { $id }.</span>
else
<span>Unable to access parent XML document.</span>
};
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
{local:updateTag()}
</body>
</html>