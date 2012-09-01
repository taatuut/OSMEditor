xquery version "1.0-ml";
(: updatehamburg-form.xqy :)
declare namespace hb="http://www.marklogic.com/ns/osm-hamburg";
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Update node tag</title>
</head>
<body>
{
let $node := doc("hamburg.xml")/hb:hamburg/hb:node[2]
return
<form action="updatehamburg-write.xqy">
<input type="hidden" name="id" value="{ string($node/@id) }"/>
<p><b>
Change tags for node <i>{ string($node/@id) }</i>:
</b></p>
<input type="text" name="key"
value="{ string($node/hb:tag[1]/@k) }"/>
<input type="text" name="value"
value="{ string($node/hb:tag[1]/@v) }"/>
<input type="submit" value="Update node tag"/>
</form>
}
</body>
</html>