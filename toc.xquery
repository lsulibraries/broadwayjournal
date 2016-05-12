declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace html="http://www.w3.org/1999/xhtml";
declare option saxon:output "method=xhtml";
declare variable $doc := doc('/home/jason/Documents/broadwayjournal/content/BroadwayJournal_18450419.xml')/tei:TEI;
declare variable $pieces := $doc//tei:div[@type='piece'];


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
    
        return  <tr><td><a href="#{$title}">{$title}</a></td><td>{$author}</td><td>{$page}</td></tr> 
    };

declare function local:getTocHeader($doc as element(tei:TEI))
    as element(div){
        let $title := $doc/tei:text/tei:front/tei:div/tei:head
        let $num   := $doc/tei:text/tei:front/tei:div//tei:num
        let $date  := $doc/tei:text/tei:front/tei:div//tei:date

        return <div><h1>{$title}</h1><h2>{$num}</h2><h3>{$date}</h3></div>
    };

declare function local:getPieceTitle($piece as element(tei:div))
    as element(h2){
        let $title := $piece//tei:head
        return <h2 id="{$title}">{$title}</h2>
    };


declare function local:getPieces($piece as element(tei:div))
    as element(div){
        let $title := local:getPieceTitle($piece)
        return <div>{$title}{$piece//tei:p}</div>
    };

<html>
<head/>
    <body>
        {
            local:getTocHeader($doc)
        }
        <table>
            {
                for $piece in $pieces
                return local:getTocRow($piece)
            }
        </table>
        <div>
            {
                for $piece in $pieces
                return local:getPieces($piece)
            }
        </div>
    </body>
</html>