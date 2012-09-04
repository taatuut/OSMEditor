(function(a){function l(a,b,c){switch(a){case"round":return Math.round(c*(1-Math.cos(Math.asin(b/c))));case"cool":return Math.round(c*(1+Math.cos(Math.asin(b/c))));case"sharp":return c-b;case"bite":return Math.round(c*Math.cos(Math.asin((c-b-1)/c)));case"slide":return Math.round(c*Math.atan2(b,c/b));case"jut":return Math.round(c*Math.atan2(c,c-b-1));case"curl":return Math.round(c*Math.atan(b));case"tear":return Math.round(c*Math.cos(b));case"wicked":return Math.round(c*Math.tan(b));case"long":return Math.round(c*Math.sqrt(b));case"sculpt":return Math.round(c*Math.log(c-b-1,c));case"dogfold":case"dog":return b&1?b+1:c;case"dog2":return b&2?b+1:c;case"dog3":return b&3?b+1:c;case"fray":return b%2*c;case"notch":return c;case"bevelfold":case"bevel":return b+1;case"steep":return b/2+1;case"invsteep":return(c-b)/2+1}}function k(b){while(b){var c=a.css(b,"backgroundColor"),d;if(c&&c!="transparent"&&c!="rgba(0, 0, 0, 0)"){if(c.indexOf("rgb")>=0){d=c.match(/\d+/g);return"#"+j(d[0])+j(d[1])+j(d[2])}return c}if(b.nodeName.toLowerCase()=="html")break;b=b.parentNode}return"#ffffff"}function j(a){a=parseInt(a).toString(16);return a.length<2?"0"+a:a}function i(b,c){return parseInt(a.css(b,c))||0}var b=document.createElement("div").style,c=b["MozBorderRadius"]!==undefined,d=b["WebkitBorderRadius"]!==undefined,e=b["borderRadius"]!==undefined||b["BorderRadius"]!==undefined,f=document.documentMode||0,g=a.browser.msie&&(a.browser.version<8&&!f||f<8),h=a.browser.msie&&function(){var a=document.createElement("div");try{a.style.setExpression("width","0+0");a.style.removeExpression("width")}catch(b){return false}return true}();a.support=a.support||{};a.support.borderRadius=c||d||e;a.fn.corner=function(b){if(this.length==0){if(!a.isReady&&this.selector){var f=this.selector,j=this.context;a(function(){a(f,j).corner(b)})}return this}return this.each(function(f){var j=a(this),m=[j.attr(a.fn.corner.defaults.metaAttr)||"",b||""].join(" ").toLowerCase(),n=/keep/.test(m),o=(m.match(/cc:(#[0-9a-f]+)/)||[])[1],p=(m.match(/sc:(#[0-9a-f]+)/)||[])[1],q=parseInt((m.match(/(\d+)px/)||[])[1])||10,r=/round|bevelfold|bevel|notch|bite|cool|sharp|slide|jut|curl|tear|fray|wicked|sculpt|long|dog3|dog2|dogfold|dog|invsteep|steep/,s=(m.match(r)||["round"])[0],t=/dogfold|bevelfold/.test(m),u={T:0,B:1},v={TL:/top|tl|left/.test(m),TR:/top|tr|right/.test(m),BL:/bottom|bl|left/.test(m),BR:/bottom|br|right/.test(m)},w,x,y,z,A,B,C,D,E,F,G,H,I,J;if(!v.TL&&!v.TR&&!v.BL&&!v.BR)v={TL:1,TR:1,BL:1,BR:1};if(a.fn.corner.defaults.useNative&&s=="round"&&(e||c||d)&&!o&&!p){if(v.TL)j.css(e?"border-top-left-radius":c?"-moz-border-radius-topleft":"-webkit-border-top-left-radius",q+"px");if(v.TR)j.css(e?"border-top-right-radius":c?"-moz-border-radius-topright":"-webkit-border-top-right-radius",q+"px");if(v.BL)j.css(e?"border-bottom-left-radius":c?"-moz-border-radius-bottomleft":"-webkit-border-bottom-left-radius",q+"px");if(v.BR)j.css(e?"border-bottom-right-radius":c?"-moz-border-radius-bottomright":"-webkit-border-bottom-right-radius",q+"px");return}w=document.createElement("div");a(w).css({overflow:"hidden",height:"1px",minHeight:"1px",fontSize:"1px",backgroundColor:p||"transparent",borderStyle:"solid"});x={T:parseInt(a.css(this,"paddingTop"))||0,R:parseInt(a.css(this,"paddingRight"))||0,B:parseInt(a.css(this,"paddingBottom"))||0,L:parseInt(a.css(this,"paddingLeft"))||0};if(typeof this.style.zoom!=undefined)this.style.zoom=1;if(!n)this.style.border="none";w.style.borderColor=o||k(this.parentNode);y=a(this).outerHeight();for(z in u){A=u[z];if(A&&(v.BL||v.BR)||!A&&(v.TL||v.TR)){w.style.borderStyle="none "+(v[z+"R"]?"solid":"none")+" none "+(v[z+"L"]?"solid":"none");B=document.createElement("div");a(B).addClass("jquery-corner");C=B.style;A?this.appendChild(B):this.insertBefore(B,this.firstChild);if(A&&y!="auto"){if(a.css(this,"position")=="static")this.style.position="relative";C.position="absolute";C.bottom=C.left=C.padding=C.margin="0";if(h)C.setExpression("width","this.parentNode.offsetWidth");else C.width="100%"}else if(!A&&a.browser.msie){if(a.css(this,"position")=="static")this.style.position="relative";C.position="absolute";C.top=C.left=C.right=C.padding=C.margin="0";if(h){D=i(this,"borderLeftWidth")+i(this,"borderRightWidth");C.setExpression("width","this.parentNode.offsetWidth - "+D+'+ "px"')}else C.width="100%"}else{C.position="relative";C.margin=!A?"-"+x.T+"px -"+x.R+"px "+(x.T-q)+"px -"+x.L+"px":x.B-q+"px -"+x.R+"px -"+x.B+"px -"+x.L+"px"}for(E=0;E<q;E++){F=Math.max(0,l(s,E,q));G=w.cloneNode(false);G.style.borderWidth="0 "+(v[z+"R"]?F:0)+"px 0 "+(v[z+"L"]?F:0)+"px";A?B.appendChild(G):B.insertBefore(G,B.firstChild)}if(t&&a.support.boxModel){if(A&&g)continue;for(H in v){if(!v[H])continue;if(A&&(H=="TL"||H=="TR"))continue;if(!A&&(H=="BL"||H=="BR"))continue;I={position:"absolute",border:"none",margin:0,padding:0,overflow:"hidden",backgroundColor:w.style.borderColor};J=a("<div/>").css(I).css({width:q+"px",height:"1px"});switch(H){case"TL":J.css({bottom:0,left:0});break;case"TR":J.css({bottom:0,right:0});break;case"BL":J.css({top:0,left:0});break;case"BR":J.css({top:0,right:0});break}B.appendChild(J[0]);var K=a("<div/>").css(I).css({top:0,bottom:0,width:"1px",height:q+"px"});switch(H){case"TL":K.css({left:q});break;case"TR":K.css({right:q});break;case"BL":K.css({left:q});break;case"BR":K.css({right:q});break}B.appendChild(K[0])}}}}})};a.fn.uncorner=function(){if(e||c||d)this.css(e?"border-radius":c?"-moz-border-radius":"-webkit-border-radius",0);a("div.jquery-corner",this).remove();return this};a.fn.corner.defaults={useNative:true,metaAttr:"data-corner"}})(jQuery)