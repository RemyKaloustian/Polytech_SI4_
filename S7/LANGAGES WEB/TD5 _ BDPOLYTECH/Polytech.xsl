<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                 <xsl:variable name="_310id" ></xsl:variable>
                <xsl:apply-templates >
                    <!--Traitement fait avant-->           
                   
                    </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="salles/salle">
        <xsl:choose>
            <xsl:when test="numero='310' and batiment ='O'">
                  <p>
                      <strong>
                          <xsl:apply-templates select ="enseignements/enseignement">
                              <xsl:with-param name="id" select="@id"/>
                          </xsl:apply-templates>
                      </strong>
                 </p>           
                
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>              
    </xsl:template>

    <xsl:template match ="enseignements/enseignement">
        <xsl:param name ="id"/>
        <p>
            <xsl:value-of select="$id"/>
        </p>    
        <xsl:choose>
            <xsl:when test="salles/salle/@id = $id">
                <p>je suis las</p>
                <xsl:apply-templates select="etudiants/etudiant">
                    <xsl:with-param name="idetudiant" select="etudiants/etudiant/@id"/>
                </xsl:apply-templates>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="etudiants/etudiant">
        <xsl:param name="idetudiant"/>
        <xsl:choose>
            <xsl:when test="@id=$idetudiant">
                <p><xsl:value-of select="etatcivil/nom" /></p>
            </xsl:when>
        </xsl:choose>
     </xsl:template>

    <xsl:template match="text() | @*"/>
      


</xsl:stylesheet>
