<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h1>Liste des salles utilisees pour l'UE 2 de l'annee 5</h1>
				<xsl:apply-templates select="polytech/annees/annee"/>
			</body>
		</html>	
	</xsl:template>

	<xsl:template match="polytech/annees/annee">
		<xsl:if test="@num='5'">
			  <p>
				<ul>
				  <xsl:apply-templates select="UEs/UE"/>
				</ul>
			 </p>   
		</xsl:if>        
	</xsl:template>

	<xsl:template match="UEs/UE">
		<xsl:if test="@numero='2'">
			<xsl:apply-templates select="enseignements/enseignement"/>
		</xsl:if>   
	</xsl:template>
	
	<xsl:template match="enseignements/enseignement">
		<xsl:apply-templates select="salles/salle">
			<xsl:with-param name="id" select="@id"/>
		</xsl:apply-templates>	
	</xsl:template>
	
	<xsl:template match="salles/salle">
		<xsl:apply-templates select="/polytech/salles/salle">
			<xsl:with-param name="id" select="@id"/>
		</xsl:apply-templates>	
	</xsl:template>

	<xsl:template match="/polytech/salles/salle">
		<xsl:param name="id"/>
		<xsl:if test="@id=$id">
			<li>
				<xsl:value-of select="batiment"/>
				<xsl:value-of select="numero"/>
			</li>
		</xsl:if>
	</xsl:template>


	<xsl:template match="text() | @*"/>
	  


</xsl:stylesheet>
