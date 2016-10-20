<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <Artistes>
                <xsl:apply-templates/>
        </Artistes>
    </xsl:template>

    <xsl:template match="CD">
        <Artiste>
            <Nom> Nom:
                <xsl:apply-templates select="ARTIST"/>
            </Nom>
            <Pays>Pays:
                 <xsl:apply-templates select="COUNTRY"/>
             </Pays>
        </Artiste>
    </xsl:template>

    <xsl:template match="TITLE">
        Title: <span style="color:#ff0000">
            <xsl:value-of select="."/>
        </span>
        <br />
    </xsl:template>

    <xsl:template match="ARTIST">
        Artist: <span style="color:#00ff00">
            <xsl:value-of select="."/>
        </span>
        <br />
    </xsl:template>

</xsl:stylesheet>