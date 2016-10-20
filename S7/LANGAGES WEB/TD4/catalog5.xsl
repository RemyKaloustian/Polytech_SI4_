<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <Artistes>
                <xsl:apply-templates/>
        </Artistes>
    </xsl:template>

    <xsl:template match="CD">
        <xsl:if test="YEAR &gt; 1990">
            <Artiste>
                    <xsl:apply-templates select="ARTIST"/>
            </Artiste>
        </xsl:if>
    </xsl:template>


    <xsl:template match="ARTIST">
        Artist: <span style="color:#00ff00">
            <xsl:value-of select="."/>
        </span>
        <br />
    </xsl:template>

</xsl:stylesheet>
