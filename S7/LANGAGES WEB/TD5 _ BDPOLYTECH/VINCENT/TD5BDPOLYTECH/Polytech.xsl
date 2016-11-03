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
				  <h1>Nom des étudiants travaillant dans la salle numéro 310 du bâtiment O</h1>
                  <p>
					<ul>
					  <xsl:call-template name="salleId">
						  <xsl:with-param name="id" select="@id"/>
					  </xsl:call-template>
					</ul>
                 </p>           
                
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>              
    </xsl:template>

    <xsl:template name="salleId">
        <xsl:param name ="id"/>
		<xsl:for-each select="/polytech/annees/annee">
			<xsl:for-each select="UEs/UE">
				<xsl:for-each select="enseignements/enseignement">
					<xsl:for-each select="salles/salle">
						<xsl:choose>
							<xsl:when test="@id = $id">
								<xsl:for-each select="../../etudiants/etudiant">
									<li>
										<xsl:call-template name="nomEtudiants">
											<xsl:with-param name="idetudiant" select="@id"/>
										</xsl:call-template>
									</li>
								</xsl:for-each>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
    </xsl:template>

    <xsl:template name="nomEtudiants">
        <xsl:param name="idetudiant"/>
		<xsl:for-each select="/polytech/etudiants/etudiant">
			<xsl:choose>
				<xsl:when test="@id=$idetudiant">
					<xsl:value-of select="etatcivil/nom" />
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
    </xsl:template>

    <xsl:template match="text() | @*"/>
      


</xsl:stylesheet>
