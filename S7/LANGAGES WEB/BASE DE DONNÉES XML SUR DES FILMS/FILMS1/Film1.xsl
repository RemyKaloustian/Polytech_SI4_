<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                <h2>
                    <strong>Voici la liste des 48 films</strong></h2>
                <xsl:apply-templates select="FILMS/FILM">
                    <!--Traitement fait avant-->
                    <xsl:sort select="@Annee" data-type="number"  order="descending"></xsl:sort>
                    </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="FILM">
        <xsl:choose>
            <xsl:when test="@Annee &gt; 1988">
                <p>
                    <strong>
                        <xsl:apply-templates select="@Annee"/> : 
                        <xsl:apply-templates select="TITRE"/>
                    </strong>
                 </p>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates select="@Annee"/> :
                    <xsl:apply-templates select="TITRE"/>
                </p>
            </xsl:otherwise>
        </xsl:choose>      
    </xsl:template>

    <xsl:template match="YEAR">
        Title: <span style="color:#ff0000">
            <xsl:value-of select="."/>
        </span>
        <br />
    </xsl:template>

    <xsl:template match="TITRE">
        Artist: <span style="color:#00ff00">
            <xsl:value-of select="."/>
        </span>
        <br />
    </xsl:template>

</xsl:stylesheet>
