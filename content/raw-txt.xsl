<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    
    <xsl:template match="/raw">
        <TEI
            xmlns:xi="http://www.w3.org/2001/XInclude"
            xmlns:svg="http://www.w3.org/2000/svg"
            xmlns:math="http://www.w3.org/1998/Math/MathML"
            xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>The Broadway Journal VOL. 1, NO. 16</title>
                        <author>John Bisco</author>
                        <respStmt>
                            <name>Gayle</name>
                            <resp>encoder</resp>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <p>
                            <title>The Broadway Journal</title>
                            is project of Louisiana State University
                        </p>
                    </publicationStmt>
                    <sourceDesc default="false">
                        <p>
                            blah blah blah
                        </p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            
            <text><body><div>
                <xsl:copy-of select="node()|text()|*|@*" copy-namespaces="yes"/>
            </div></body></text></TEI>
    </xsl:template>
    
</xsl:stylesheet>