<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xalan="http://xml.apache.org/xslt">
<xsl:output method="xml" version="1.0" encoding="UTF-8"  omit-xml-declaration="no"  indent="yes" xalan:indent-amount="4"/>

<xsl:key name="IdAutoraKey" match="Stanowisko" use="@id"/>



<xsl:template match="@* | node() ">
    <xsl:copy>
        <xsl:apply-templates select="@* | node() "/>
    </xsl:copy>
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
						<ŚredniaCenaPozycji><xsl:value-of select="sum(/księgarnia/(książka/cena|e-book/cena|czasopismo/cena)) div count(/księgarnia/(książka|e-book|czasopismo)) div 0.01 *0.01 "></xsl:value-of></ŚredniaCenaPozycji>
					</Finansowe>
				</Statystyki>
		</xsl:copy>
</xsl:template>
		










				
</xsl:stylesheet>