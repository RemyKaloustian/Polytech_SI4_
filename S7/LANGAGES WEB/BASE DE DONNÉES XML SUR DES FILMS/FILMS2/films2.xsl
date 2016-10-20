<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--
        Objectif :
        Voici la liste des (count actors when drame) acteurs des (select count films when drame)
        
        Nom , prenom
        
    
    -->

    <xsl:template match="/">
        <html>
            <body>
                <h2>
                    <strong>Voici la liste des 
                    <xsl:value-of select="count(//FILMS/FILM[GENRE='Drame']/ROLES/ROLE)" />
                        acteurs des

                        <xsl:value-of select="count(//FILMS/FILM[GENRE='Drame'])"/>
                        Drames
                    </strong></h2>
                <xsl:apply-templates select="FILMS">
                    <!--Traitement fait avant-->                  
                    </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="FILM[GENRE='Drame']">        
                <p>
                    <strong>
                        <xsl:apply-templates select="ROLES"/>                 
                    </strong>
                 </p>           
    </xsl:template>

    <xsl:template match="FILM">
    </xsl:template>
    
    <xsl:template match="ARTISTE">            
    </xsl:template>

    <xsl:template match="ROLES">
        <xsl:apply-templates select="ROLE"/>
    </xsl:template>

    <xsl:template match="ROLE">
        <xsl:apply-templates select="NOM"/> ,
        <xsl:apply-templates select="PRENOM"/><br></br>
    </xsl:template>


    

   

</xsl:stylesheet>
