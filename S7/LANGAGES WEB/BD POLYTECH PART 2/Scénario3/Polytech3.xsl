<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h1>Liste des élèves suivant les cours dont Luigi Liquori est responsable</h1>
				<xsl:apply-templates select="polytech/annees/annee"/>
			</body>
		</html>	
	</xsl:template>

	<xsl:template match="polytech/annees/annee">
		<xsl:apply-templates select="UEs/UE"/>
	</xsl:template>

	<xsl:template match="UEs/UE">
		<xsl:apply-templates select="enseignements/enseignement"/>
	</xsl:template>
	
	<xsl:template match="enseignements/enseignement">
		<xsl:if test="responsable='Luigi Liquori'">
			<xsl:apply-templates select="etudiants/etudiant"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="etudiants/etudiant">
		<xsl:apply-templates select="/polytech/etudiants/etudiant">
			<xsl:with-param name="id" select="@id"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="/polytech/etudiants/etudiant">
		<xsl:param name="id"/>
		<xsl:if test="@id=$id">
			<li>
				<xsl:value-of select="etatcivil/nom"/>
			</li>
		</xsl:if>
	</xsl:template>


	<xsl:template match="text() | @*"/>
	  


</xsl:stylesheet>
