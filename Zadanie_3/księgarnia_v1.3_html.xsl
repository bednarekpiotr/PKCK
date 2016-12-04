<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"
      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pl" xml:lang="pl">
<head>
 <title>XHTML Output</title>
</head>
	<body>
		<div id="links">
		<h1 style="text-align:center">Lista pozycji</h1>
			<table  border="1">
				<tr>
					<th style="text-align:center">Rodzaj pozycji</th>
					<th style="text-align:left">Tytuł</th>
					<th style="text-align:left">Nazwa kategorii</th>
					<th style="text-align:left">Język</th>
					<th style="text-align:left">Cena</th>
					<th style="text-align:left">Waluta</th>
				</tr>
				<xsl:for-each select="księgarnia/(książka|czasopismo|e-book)">
				<xsl:sort select="local-name()"/>
				<xsl:sort select="nazwa_kategorii"/>
					<tr>
						<td style="text-align:center"><xsl:value-of select="local-name()"/></td>
						<td style="text-align:center"><xsl:value-of select="tytuł"/></td>
						<td style="text-align:center"><xsl:value-of select="nazwa_kategorii"/></td>
						<td style="text-align:center"><xsl:value-of select="język"/></td>
						<td style="text-align:center"><xsl:value-of select="cena"/></td>
						<td style="text-align:center"><xsl:value-of select="cena/@waluta"/></td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
			<Statystyki>
			<xsl:apply-templates />
			</Statystyki>

	</body>
</html>
</xsl:template>


  <xsl:template match="metadane">
    <xsl:element name="div">
	<xsl:element name="br" />
        <xsl:text>Autorzy projektu</xsl:text>
	  <xsl:for-each select="autor_projektu">
	    <xsl:element name="h4">
		<xsl:value-of select="." />
		<xsl:value-of select="@indeks" />
		</xsl:element>
	  </xsl:for-each>
	  <xsl:element name="h4">
	  <xsl:text>Rok akademicki </xsl:text>
	  <xsl:value-of select="rok_akademicki" />
	  </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="Statystyki">
    <xsl:element name="div">
        <xsl:text>STATYSTYKI</xsl:text>
      <xsl:element name="br" />
      <xsl:apply-templates />
	    <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:text>#links</xsl:text>
          </xsl:attribute>
          <xsl:text>Powrót do góry</xsl:text>
        </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="Statystyki/Ogólne">
    <xsl:element name="div">
      <xsl:element name="table">
        <xsl:attribute name="border">
          <xsl:text>0</xsl:text>
        </xsl:attribute>
        <xsl:element name="caption">
          <xsl:text>Ogólne</xsl:text>
        </xsl:element>
        <xsl:element name="tr">
          <xsl:element name="th">
            <xsl:text>Nazwa</xsl:text>
          </xsl:element>
          <xsl:element name="th">
            <xsl:text>Wartość</xsl:text>
          </xsl:element>
        </xsl:element>

        <xsl:element name="tr">
          <xsl:element name="td">
            <xsl:text>Liczba pozycji razem:</xsl:text>
          </xsl:element>
          <xsl:element name="td">
            <xsl:value-of select="LiczbaPozycji" />
          </xsl:element>
        </xsl:element>
		
        <xsl:element name="tr">
          <xsl:element name="td">
            <xsl:text>Liczba książek:</xsl:text>
          </xsl:element>
          <xsl:element name="td">
            <xsl:value-of select="LiczbaKsiążek" />
          </xsl:element>
        </xsl:element>
		
        <xsl:element name="tr">
          <xsl:element name="td">
            <xsl:text>Liczba e-booków:</xsl:text>
          </xsl:element>
          <xsl:element name="td">
            <xsl:value-of select="LiczbaEbooków" />
          </xsl:element>
        </xsl:element>
		
        <xsl:element name="tr">
          <xsl:element name="td">
            <xsl:text>Liczba czasopism:</xsl:text>
          </xsl:element>
          <xsl:element name="td">
            <xsl:value-of select="LiczbaCzasopism" />
          </xsl:element>
        </xsl:element>
     
      </xsl:element>
    </xsl:element>
  </xsl:template>
  
  
    <xsl:template match="Statystyki/Finansowe">
	<xsl:element name="br" />
    <xsl:element name="div">
      <xsl:element name="table">
        <xsl:attribute name="border">
          <xsl:text>0</xsl:text>
        </xsl:attribute>
        <xsl:element name="caption">
          <xsl:text>Finansowe</xsl:text>
        </xsl:element>
		
        <xsl:element name="tr">
          <xsl:element name="th">
            <xsl:text>Nazwa</xsl:text>
          </xsl:element>
          <xsl:element name="th">
            <xsl:text>Wartość</xsl:text>
          </xsl:element>
        </xsl:element>

        <xsl:element name="tr">
          <xsl:element name="td">
            <xsl:text>Średnia cena pozycji:</xsl:text>
          </xsl:element>
          <xsl:element name="td">
            <xsl:value-of select="round(ŚredniaCenaPozycji*100) div 100" />
          </xsl:element>
        </xsl:element>
        
      </xsl:element>
    </xsl:element>
  </xsl:template>
		
</xsl:stylesheet>