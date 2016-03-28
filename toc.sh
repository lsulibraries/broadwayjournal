#! /bin/bash
java -cp saxon/saxon9he.jar net.sf.saxon.Transform  -s:toc.xsl -xsl:toc.xsl -o:index.html