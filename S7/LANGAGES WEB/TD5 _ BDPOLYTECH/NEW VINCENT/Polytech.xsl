<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
			    <h1>Nom des etudiants travaillant dans la salle numero 310 du batiment O</h1>
                <xsl:apply-templates select="polytech/salles/salle"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="polytech/salles/salle">
		<xsl:if test="numero='310' and batiment='O'">
			  <p>
				<ul>
				  <xsl:apply-templates select="/polytech/annees/annee">
					  <xsl:with-param name="id" select="@id"/>
				  </xsl:apply-templates>
				</ul>
			 </p>           
		</xsl:if>
    </xsl:template>
	
	<xsl:template match="/polytech/annees/annee">
		<xsl:param name="id"/>
		<xsl:apply-templates select="UEs/UE">
		    <xsl:with-param name="id" select="$id"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="UEs/UE">
		<xsl:param name="id"/>
		<xsl:apply-templates select="enseignements/enseignement">
		    <xsl:with-param name="id" select="$id"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="enseignements/enseignement">
		<xsl:param name="id"/>
		<xsl:apply-templates select="salles/salle" mode="findid">
		    <xsl:with-param name="id" select="$id"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="salles/salle" mode="findid">
		<xsl:param name="id"/>
		<xsl:if test="@id = $id">
			<xsl:for-each select="../../etudiants/etudiant">
				<xsl:apply-templates match="/polytech/etudiants/etudiant">
					<xsl:with-param name="idetudiant" select="@id"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="/polytech/etudiants/etudiant">
		<xsl:param name="idetudiant"/>
		<xsl:if test="@id = $idetudiant">
			<li>
				<xsl:value-of select="etatcivil/nom" />
			</li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
