declare namespace tei="http://www.tei-c.org/ns/1.0";
declare option saxon:output "method=xhtml";

declare function local:getAuthor($piece as element(tei:div))
    as xs:string {
    replace($piece/@resp/string(), 'personography.xml#', '')
    };


declare function local:getPage($piece as element(tei:div))
    as xs:string {
    $piece/preceding::tei:pb[1]/@n/string()
    };

declare function local:getTitle($piece as element(tei:div))
    as xs:string {
    data($piece/tei:head)
    };


<html xmlns="http://www.w3.org/1999/xhtml">
<head/>
<ul>
{
let $pieces := doc('/home/jason/Downloads/BroadwayJournal_18450419.xml')//tei:div[@type='piece']
for $piece in $pieces
    let $page   := local:getPage($piece) 
    let $author := local:getAuthor($piece)
    let $title  := local:getTitle($piece)
    
return  <li>{concat($author, " - ", $title, "     ", $page)}</li> 

}
</ul>
</html>