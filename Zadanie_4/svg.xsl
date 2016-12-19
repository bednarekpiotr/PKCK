<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <xsl:output method="xml" media-type="image/svg" encoding="utf-8"  doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg11.dtd"/>
    
    <xsl:template match="/">
	<svg:svg width="800" height="600" font-family="Calibri">
	<svg:desc>Graficzna prezentacja raportu na temat księgarni Focus</svg:desc>
	<svg:title>Księgarnia Focus</svg:title>
	
	    <defs>
        <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" style="stop-color:rgb(57,147,200);stop-opacity:1" />
            <stop offset="100%" style="stop-color:rgb(178,218,242);stop-opacity:1" />                    
        </linearGradient>
        </defs>
		
		<svg:rect x="3" y="3" width="794" height="594" fill="url(#grad1)" stroke="black" stroke-width="3"/> 
		
		<svg:text x="50%" y="30" font-size="20" fill="white" font-weight="bold" text-anchor="middle">
        Księgarnia Focus - dane graficzne 
        </svg:text>
	
		<xsl:apply-templates select="księgarnia/Statystyki"/>
		<xsl:apply-templates select="księgarnia/metadane"/>
	</svg:svg>
	</xsl:template>
	
	
	<xsl:template match="Statystyki">
		<svg:rect x="100" y="50" width="600" height="200" fill="white" stroke="black"/>
		<svg:text x="50%" y="68" font-size="16" fill="blue" font-weight="bold" text-anchor="middle">Ilość pozycji według rodzaju</svg:text>
		
		<svg:text x="230" y="240" font-size="16" fill="black" font-weight="bold">książki</svg:text>
		<xsl:variable name ="zmienna1" select = "./Ogólne/LiczbaKsiążek"/>
		<xsl:variable name ="zmienna1x" select = "220 - round(($zmienna1 div 20)*120)"/>
		<xsl:variable name ="zmienna12" select = "round(($zmienna1 div 20)*120)"/>
		<xsl:variable name ="zmienna1t" select = "($zmienna1x) - 10"/>
		<svg:rect x="230" y="{$zmienna1x}" width="50" height="{$zmienna12}" fill="green" stroke="green"/>
		<svg:text x="245" y="{$zmienna1t}" font-size="16" fill="black" font-weight="bold"><xsl:value-of select="./Ogólne/LiczbaKsiążek"/></svg:text>
        
		<svg:text x="360" y="240" font-size="16" fill="black" font-weight="bold">czasopisma</svg:text>
		<xsl:variable name ="zmienna2" select = "./Ogólne/LiczbaCzasopism"/>
		<xsl:variable name ="zmienna2x" select = "220 - round(($zmienna2 div 20)*120)"/>
		<xsl:variable name ="zmienna22" select = "round(($zmienna2 div 20)*120)"/>
		<xsl:variable name ="zmienna2t" select = "($zmienna2x) - 10"/>
		<svg:rect x="360" y="{$zmienna2x}" width="50" height="{$zmienna22}" fill="green" stroke="green"/>
		<svg:text x="375" y="{$zmienna2t}" font-size="16" fill="black" font-weight="bold"><xsl:value-of select="./Ogólne/LiczbaCzasopism"/></svg:text>
        
		<svg:text x="520" y="240" font-size="16" fill="black" font-weight="bold">e-booki</svg:text>
		<xsl:variable name ="zmienna3" select = "./Ogólne/LiczbaEbooków"/>
		<xsl:variable name ="zmienna3x" select = "220 - round(($zmienna3 div 20)*120)"/>
		<xsl:variable name ="zmienna32" select = "round(($zmienna3 div 20)*120)"/>
		<xsl:variable name ="zmienna3t" select = "($zmienna3x) - 10"/>
		<svg:rect x="520" y="{$zmienna3x}" width="50" height="{$zmienna32}" fill="green" stroke="green"/>
		<svg:text x="535" y="{$zmienna3t}" font-size="16" fill="black" font-weight="bold"><xsl:value-of select="./Ogólne/LiczbaEbooków"/></svg:text>
		
		<line x1="100" y1="220" x2="700" y2="220" style="stroke:rgb(0,0,0);stroke-width:1" />
		<svg:text x="85" y="225" font-size="16" fill="black" font-weight="bold">0</svg:text>
		
		<line x1="100" y1="190" x2="700" y2="190" style="stroke:rgb(0,0,0);stroke-width:1;stroke-linecap:round;stroke-dasharray:1,10" />
		<svg:text x="85" y="195" font-size="16" fill="black" font-weight="bold">5</svg:text>
		
		<line x1="100" y1="160" x2="700" y2="160" style="stroke:rgb(0,0,0);stroke-width:1;stroke-linecap:round;stroke-dasharray:1,10" />
		<svg:text x="80" y="165" font-size="16" fill="black" font-weight="bold">10</svg:text>

		<line x1="100" y1="130" x2="700" y2="130" style="stroke:rgb(0,0,0);stroke-width:1;stroke-linecap:round;stroke-dasharray:1,10" />
		<svg:text x="80" y="135" font-size="16" fill="black" font-weight="bold">15</svg:text>		

		<line x1="100" y1="100" x2="700" y2="100" style="stroke:rgb(0,0,0);stroke-width:1;stroke-linecap:round;stroke-dasharray:1,10" />
		<svg:text x="80" y="105" font-size="16" fill="black" font-weight="bold">20</svg:text>	

		
	</xsl:template>
	
	<xsl:template match="metadane">
	</xsl:template>

</xsl:stylesheet>