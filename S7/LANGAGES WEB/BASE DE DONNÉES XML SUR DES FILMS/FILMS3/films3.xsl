<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--
    Afficher attribut, DONE !
    Utiliser xsl element
    -->

    <xsl:template match="/">
        <ARTISTES>           
                <xsl:apply-templates select="FILMS/ARTISTE">
                    <!--Traitement fait avant-->                  
                    </xsl:apply-templates>
            </ARTISTES>
    </xsl:template>

    <xsl:template match="ARTISTE">
        <xsl:element name="ARTISTE">
            <xsl:attribute name="naissance">
                <xsl:value-of select="ANNEENAISS" />
            </xsl:attribute>
            <xsl:element name="ACTNOM">
                <xsl:apply-templates select="ACTNOM"/>
            </xsl:element>
            <xsl:element name="ACTPNOM">
                <xsl:apply-templates select="ACTPNOM"/>
            </xsl:element>
        </xsl:element>           
    </xsl:template>
</xsl:stylesheet>
