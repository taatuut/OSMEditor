xquery version "1.0-ml";
(: simplesearchhamburg.xqy :)
declare namespace hb="http://www.marklogic.com/ns/osm-hamburg"; 
declare function local:user()
{
let $user := "*as*"
let $uriuser := xdmp:get-request-field("user")
let $ruser := if (fn:string-length($uriuser) < 1) then $user else $uriuser
return
xs:string($ruser)
};

declare function local:simplesearch()
{
let $r := cts:search(doc("hamburg.xml")//hb:hamburg/hb:node, 
	cts:element-attribute-value-query(
		xs:QName("hb:node"), 
		xs:QName("user"), 
		local:user(), "wildcarded", 1.0)
		)
	return
	$r
};
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MarkLogic OSM Editor - Simple search  OpenStreetMap data set</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<textarea id="userxmldisplay">
{local:simplesearch()}
</textarea>
<form id="frmUser" action="" method="post">
<input type="text" id="user" name="user" value="{local:user()}" />
<input type="submit" value="Search" />
</form>
</body>
</html>
