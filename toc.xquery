declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace html="http://www.w3.org/1999/xhtml";
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

declare function local:getTocRow($piece as element(tei:div))
    as element(tr){
        let $page   := local:getPage($piece)
        let $author := local:getAuthor($piece)
        let $title  := local:getTitle($piece)
    
        return  <tr><td>{$title}</td><td>{$author}</td><td>{$page}</td></tr> 
    };

declare function local:getTocHeader($doc as element(tei:TEI))
    as element(div){
        let $title := $doc/tei:text/tei:front/tei:div/tei:head
        let $num   := $doc/tei:text/tei:front/tei:div//tei:num
        let $date  := $doc/tei:text/tei:front/tei:div//tei:date

        return <div><h1>{$title}</h1><h2>{$num}</h2><h3>{$date}</h3></div>
    };



<html>
<head/>
<body>
{
    let $doc := doc('/home/jason/Documents/broadwayjournal/content/BroadwayJournal_18450419.xml')/tei:TEI
    return local:getTocHeader($doc)
}
<table>


{

let $pieces := doc('/home/jason/Downloads/BroadwayJournal_18450419.xml')//tei:div[@type='piece']
for $piece in $pieces
return local:getTocRow($piece)

}
</table>
</body>
</html>