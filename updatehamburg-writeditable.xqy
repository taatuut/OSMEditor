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
		(
		fn:normalize-space($value),
		xdmp:node-replace($tag,<hb:tag>{ attribute k {$key}, attribute v {$value} }</hb:tag>)
		)
	else
		(
		if (fn:string-length($pos) < 1) then
			(
			fn:normalize-space($value),
			xdmp:node-insert-child(doc("hamburg.xml")/hb:hamburg/hb:node[@id = $id],<hb:tag>{ attribute k {"custom"}, attribute v {$value} }</hb:tag>)
			)
		else
			(
			<span>no node with id { $id }.</span>
			)
		)
else
<span>Unable to access parent XML document.</span>
};local:updateTag()
