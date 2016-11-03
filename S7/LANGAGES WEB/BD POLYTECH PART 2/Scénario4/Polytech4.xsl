<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <newpolytech>
            <etudiants>
                <xsl:apply-templates select="polytech/etudiants/etudiant"/>
            </etudiants>

            <enseignants>
                <xsl:apply-templates select="polytech/enseignants/enseignant"/>
            </enseignants>
        </newpolytech>
    </xsl:template>

    <!--AFFICHAGE DES ÉTUDIANTS-->
    <xsl:template match="polytech/etudiants/etudiant">
        <etudiant>
            <prenom>
                <xsl:apply-templates select="etatcivil/prenom"/>
            </prenom>
            <nom>
                <xsl:apply-templates select="etatcivil/nom"/>
            </nom>
            <infos>
                <xsl:apply-templates select="etatcivil/infos/info"/>
            </infos>
        </etudiant>
    </xsl:template>

    <!--AFFICHAGE DES ENSEIGNANS-->
    <xsl:template match="polytech/enseignants/enseignant">
        <enseignant>
            <prenom>
                <xsl:apply-templates select="etatcivil/prenom"/>
            </prenom>
            <nom>
                <xsl:apply-templates select="etatcivil/nom"/>
            </nom>
            <infos>
                <xsl:apply-templates select="etatcivil/infos/info"/>
            </infos>
        </enseignant>
    </xsl:template>

    <xsl:template match="etatcivil/prenom">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="etatcivil/nom">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="etatcivil/infos/info">
        <info>
            <xsl:value-of select="."/>
        </info>
    </xsl:template>
    <!--<xsl:template match="text() | @*"/>-->

</xsl:stylesheet>
