<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xalan="http://xml.apache.org/xslt"> 
<xsl:output method="xml" version="1.0" encoding="UTF-8"
            omit-xml-declaration="no" indent="yes" xalan:indent-amount="4" />
			
<xsl:key name="IdAutoraKey" match="autor" use="@IdAutora" /> 
<xsl:key name="IdKategoriiKey" match="kategoria" use="@IdKategorii" /> 

<xsl:template match="@* | node() "> 
   <xsl:copy> 
      <xsl:apply-templates select="@* | node() " /> 
   </xsl:copy> 
</xsl:template> 


<xsl:template match="/księgarnia/książka | /księgarnia/e-book | /księgarnia/czasopismo">
   
   <xsl:element name="{local-name()}"> 
      <xsl:apply-templates /> 
	  <xsl:element name = "cenaPLN">
		<xsl:for-each select = "./cena">
			<xsl:choose>
				<xsl:when test = "./@waluta='USD'">
					<xsl:value-of select = ".*4"/>
				</xsl:when>
				<xsl:when test = "./@waluta='GBP'">
					<xsl:value-of  select = ".*4"/>
				</xsl:when>
				<xsl:when test = "./@waluta='EUR'">
					<xsl:value-of  select = ".*4.5"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select = "." />
				</xsl:otherwise>
				
			</xsl:choose>
		</xsl:for-each>
	  </xsl:element>
      <xsl:element name="Autorzy"> 
            <xsl:copy-of select="key('IdAutoraKey', @IdAutora)" /> 
            <xsl:copy-of select="key('IdAutoraKey', @IdAutoraDrugiego)" /> 
      </xsl:element> 
		<xsl:copy-of select="key('IdKategoriiKey', @IdKategorii)" />
	  
   </xsl:element> 
</xsl:template> 


<xsl:template match="opis" /> 
<xsl:template match="wydanie/@numerWydania" />
<xsl:template match="@IdKategorii" /> 
<xsl:template match="@IdAutora" />
<xsl:template match="@pozycja_id" /> 
<xsl:template match="książka/@autorzy" /> 
<xsl:template match="autorzy_książek" /> 
<xsl:template match = "@autorzy" />





<xsl:template match="/księgarnia"> 
   <xsl:copy> 
      <xsl:apply-templates select="@* | node()" /> 
      <Kategorie> 
         <xsl:for-each select="/księgarnia/lista_kategorii/kategoria"> 
            <xsl:variable name="zmienna1" select="./@IdKategorii" /> 
            <xsl:element name="Kategoria"> 
               <xsl:value-of select="nazwa" /> 
               <xsl:for-each select="/księgarnia/książka | /księgarnia/e-book | /księgarnia/czasopismo">
                  
                  <xsl:variable name="zmienna2" select="./@IdKategorii" /> 
                  <xsl:if test="$zmienna1=$zmienna2"> 
                     <xsl:copy>
					 <xsl:apply-templates />
<!-- <xsl:element name="{local-name()}">  -->

	  <xsl:element name = "cenaPLN">
		<xsl:for-each select = "./cena">
			<xsl:choose>
				<xsl:when test = "./@waluta='USD'">
					<xsl:value-of select = ".*4"/>
				</xsl:when>
				<xsl:when test = "./@waluta='GBP'">
					<xsl:value-of  select = ".*5.11"/>
				</xsl:when>
				<xsl:when test = "./@waluta='EUR'">
					<xsl:value-of  select = ".*4.5"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select = "." />
				</xsl:otherwise>
				
			</xsl:choose>
		</xsl:for-each>
	  </xsl:element>
      <xsl:element name="Autorzy"> 
            <xsl:copy-of select="key('IdAutoraKey', @IdAutora)" /> 
            <xsl:copy-of select="key('IdAutoraKey', @IdAutoraDrugiego)" /> 
      </xsl:element> 
		<xsl:copy-of select="key('IdKategoriiKey', @IdKategorii)" />
                     </xsl:copy> 
                  </xsl:if> 
               </xsl:for-each> 
            </xsl:element> 
         </xsl:for-each> 
      </Kategorie> 
      <Statystyki> 
         <Ogólne> 
            <LiczbaPozycji><xsl:value-of select="count(/księgarnia/(książka|e-book|czasopismo))" /></LiczbaPozycji>            
            <LiczbaKsiążek><xsl:value-of select="count(/księgarnia/książka)" /></LiczbaKsiążek>            
            <LiczbaEbooków><xsl:value-of select="count(/księgarnia/e-book)" /></LiczbaEbooków>            
            <LiczbaCzasopism><xsl:value-of select="count(/księgarnia/czasopismo)" /></LiczbaCzasopism>
			<LiczbaKategorii><xsl:value-of select = "count(/księgarnia/lista_kategorii/kategoria)"/></LiczbaKategorii>
         </Ogólne> 
      </Statystyki> 
   </xsl:copy> 
</xsl:template> 


</xsl:stylesheet>
