declare namespace tei="http://www.tei-c.org/ns/1.0";
declare option saxon:output "method=xhtml";
<html xmlns="http://www.w3.org/1999/xhtml">
<head/>
<ul>
{
let $authors := doc('/home/jason/Downloads/BroadwayJournal_18450419.xml')//tei:div[@type='piece']
for $x in $authors
let $page := $x/preceding::tei:pb[1]/@n/string()
return  <li>{concat($x/@resp/string(), " - ", data($x/tei:head), "     ", $page)}</li> 

}
</ul>
</html>