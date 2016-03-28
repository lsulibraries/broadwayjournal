<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:TEI="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:variable name="documents" select="collection('content?select=Gayle*')"/>
    
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <ul>
                    <xsl:for-each select="$documents">
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="document-uri(/)"/>
                                </xsl:attribute>
                                <xsl:value-of select="//TEI:titleStmt/TEI:title"/>
                            </xsl:element>
                            <ul>
                                <xsl:for-each select="//TEI:body//TEI:title">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>