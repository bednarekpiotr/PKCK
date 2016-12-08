<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xalan="http://xml.apache.org/xslt">
<xsl:output method="xml" version="1.0" encoding="UTF-8"  omit-xml-declaration="no"  indent="yes" xalan:indent-amount="4"/>

<xsl:key name="IdAutoraKey" match="autor" use="@IdAutora"/>
<xsl:key name="IdKategoriiKey" match="definicja_kategorii" use="@IdKategorii"/>



<xsl:template match="@* | node() ">
    <xsl:copy>
        <xsl:apply-templates select="@* | node() "/>
    </xsl:copy>
</xsl:template>

<xsl:template match="opis" />
<xsl:template match="lista_kategorii" />
<xsl:template match="książka/@pozycja_id" />
<xsl:template match="książka/@autorzy" />
<xsl:template match="autorzy_książek" />


<xsl:template match="księgarnia/książka | księgarnia/e-book | księgarnia/czasopismo" >
<xsl:element name="książka">
	<xsl:apply-templates/>	
	    <xsl:element name="Autorzy">
			<xsl:element name="Autor">
				<xsl:value-of select="key('IdAutoraKey', @IdAutora)"/>
			</xsl:element>
			<xsl:element name="Autor">
				<xsl:value-of select="key('IdAutoraKey', @IdAutoraDrugiego)"/>
			</xsl:element>
        </xsl:element>
		<xsl:element name="Kategoria">
				<xsl:value-of select="key('IdKategoriiKey', @IdKategorii)"/>
		</xsl:element>
</xsl:element>
</xsl:template>


<xsl:template match="księgarnia">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" />
                <Statystyki>
                    <Ogólne>
                        <LiczbaPozycji><xsl:value-of select="count(/księgarnia/(książka|e-book|czasopismo))"/></LiczbaPozycji>
						<LiczbaKsiążek><xsl:value-of select="count(/księgarnia/książka)"/></LiczbaKsiążek>
						<LiczbaEbooków><xsl:value-of select="count(/księgarnia/e-book)"/></LiczbaEbooków>
						<LiczbaCzasopism><xsl:value-of select="count(/księgarnia/czasopismo)"/></LiczbaCzasopism>
                    </Ogólne>
					<Finansowe>
						<ŚredniaCenaPozycji><xsl:value-of select="sum(/księgarnia/(książka/cena|e-book/cena|czasopismo/cena)) div count(/księgarnia/(książka|e-book|czasopismo))"></xsl:value-of></ŚredniaCenaPozycji>
						<!-- <ŚredniaCenaPozycji><xsl:value-of select="round(avg(/księgarnia/książka/cena) div 0.01) * 0.01"></xsl:value-of></ŚredniaCenaPozycji> -->
					</Finansowe>
				</Statystyki>
		</xsl:copy>
</xsl:template>
		










				
</xsl:stylesheet>