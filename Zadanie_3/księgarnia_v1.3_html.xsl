<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8"
      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />
	  
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
	<body>
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
		<table  border="1">
				<tr>
					<th style="text-align:center">Liczba Pozycji</th>
					<th style="text-align:left">Liczba Książek</th>
					<th style="text-align:left">Liczba Ebooków</th>	
					<th style="text-align:left">Liczba Czasopism</th>
					
				</tr>	
						
			


					<tr>
						<td style="text-align:center"><xsl:value-of select="księgarnia/Statystyki/Ogólne/LiczbaPozycji"/></td>
						<td style="text-align:center"><xsl:value-of select="LiczbaKsiążek"/></td>
						<td style="text-align:center"><xsl:value-of select="LiczbaEbooków"/></td>
						<td style="text-align:center"><xsl:value-of select="LiczbaCzasopism"/></td>
		
					</tr>

				</table>
			

			
	</body>
</html>
	
	
	
	
	
</xsl:template>
		
</xsl:stylesheet>