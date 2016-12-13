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
	<div class="sidebar">
                <img class="logo" src="logo.png" alt="Logo księgarni" />
                <h4>MENU</h4>
                <ul>
				
                    <li><a href="#listapozycji">Lista Pozycji</a></li>
					<ul>
						 <li><a href="#kategorie">Pozycje z podziałem na kategorie </a></li>

					</ul>

                    <li>
                        <a href="#statystyki">Statystyki</a>
                        <ul>
                            <li><a href="#ogolne">Ogólne</a></li>
							<li><a href="#finansowe">Finansowe</a></li>
    
                        </ul>
                    </li>
					<li><a href="#metadane">Metadane</a></li>
                </ul>

            </div>
		<div id="links">
		<h1   id="listapozycji" style="text-align:center">Lista pozycji</h1>
			<table  align = "center" border="1">
				<tr>
					<th style="text-align:center">Rodzaj pozycji</th>
					<th style="text-align:left">Tytuł</th>
					<th style="text-align:left">Nazwa kategorii</th>
					<th style="text-align:left">Język</th>
					<th style="text-align:left">Cena</th>
					<th style="text-align:left">Waluta</th>
					<th style="text-align:left">Cena w PLN</th>
					<th style="text-align:left">Autor</th>
				</tr>
				<xsl:for-each select="księgarnia/(książka|czasopismo|e-book)">
				<xsl:sort select="local-name()"/>
				<xsl:sort select="nazwa_kategorii"/>
					<tr>
						<td style="text-align:center"><xsl:value-of select="local-name()"/></td>
						<td style="text-align:center"><xsl:value-of select="tytuł"/></td>
						<td style="text-align:center"><xsl:value-of select="Kategoria"/></td>
						<td style="text-align:center"><xsl:value-of select="język"/></td>
						<td style="text-align:center"><xsl:value-of select="cena"/></td>
						<td style="text-align:center"><xsl:value-of select="cena/@waluta"/></td>
						<td style="text-align:center"><xsl:value-of select="cenaPLN"/></td>
						<td style="text-align:center"><xsl:value-of select="Autorzy"/></td>
					</tr>
				</xsl:for-each>
			</table>
							<h1 style="text-align:center" id = "kategorie">Pozycje z podziałem na kategorie</h1>
				<xsl:for-each select = "/księgarnia/Kategorie/Kategoria">

				<h2  style="text-align:center"><xsl:value-of select = "./(książka|e-book|czasopismo)/Kategoria/Nazwa"/></h2>
				<xsl:variable name ="zmienna1" select = "./Nazwa"/>
		<table  align = "center" border="1">
				<tr>
					<th style="text-align:center">Rodzaj pozycji</th>
					<th style="text-align:left">Tytuł</th>
					<th style="text-align:left">Nazwa kategorii</th>
					<th style="text-align:left">Język</th>
					<th style="text-align:left">Cena</th>
					<th style="text-align:left">Waluta</th>
					<th style="text-align:left">Cena w PLN</th>
					<th style="text-align:left">Autor</th>
				</tr>
				<xsl:for-each select="./(książka | czasopismo|e-book)">

					<tr>
						<td style="text-align:center"><xsl:value-of select="local-name()"/></td>
						<td style="text-align:center"><xsl:value-of select="tytuł"/></td>
						<td style="text-align:center"><xsl:value-of select="Kategoria"/></td>
						<td style="text-align:center"><xsl:value-of select="język"/></td>
						<td style="text-align:center"><xsl:value-of select="cena"/></td>
						<td style="text-align:center"><xsl:value-of select="cena/@waluta"/></td>
												<td style="text-align:center"><xsl:value-of select="cenaPLN"/></td>
						<td style="text-align:center"><xsl:value-of select="Autorzy"/></td>
					</tr>

				</xsl:for-each>
			</table>	
			</xsl:for-each>
			
			

<h1 style="text-align:center" id="statystyki">Statystyki Ogólne </h1> 


<table align = "center"  border="1">
<tr>
      <th style="text-align:center">Nazwa</th> 
      <th style="text-align:left">Wartość</th> 
</tr>
<tr>
	<td>Liczba Pozycji</td>
	<td style="text-align:center"><xsl:value-of select = "/księgarnia/Statystyki/Ogólne/LiczbaPozycji"></xsl:value-of></td>
</tr>
<tr>
<td>Liczba E-booków</td>
<td style="text-align:center"><xsl:value-of select = "/księgarnia/Statystyki/Ogólne/LiczbaEbooków"/></td>
</tr>
<tr>
<td>Liczba Czasopism</td>
<td style="text-align:center"><xsl:value-of select = "/księgarnia/Statystyki/Ogólne/LiczbaCzasopism"/></td>
</tr>
<tr>
<td>Liczba Książek</td>
<td style="text-align:center"><xsl:value-of select = "/księgarnia/Statystyki/Ogólne/LiczbaKsiążek"/></td>
</tr>
<tr>
<td>Liczba Kategorii</td>
<td style="text-align:center"><xsl:value-of select = "/księgarnia/Statystyki/Ogólne/LiczbaKategorii"/></td>
</tr>  

</table>

<h1 style="text-align:center" id="finansowe">Statystyki Finansowe </h1> 


<table  align = "center" border="1">
<tr>
      <th style="text-align:center">Nazwa</th> 
      <th style="text-align:left">Wartość</th> 
</tr>
<tr>
	<td>Średnia Cena Pozycji w PLN</td>
	<td style="text-align:center"><xsl:value-of select="round((sum(/księgarnia/(książka|czasopismo|e-book)/cenaPLN) div (count(/księgarnia/(książka|czasopismo|e-book))))div 0.01) * 0.01"></xsl:value-of></td>
</tr>

</table>

<h1 style="text-align:center" id="metadane">Metadane </h1>
<table align = "center"  border="1">
<tr>
      <th style="text-align:center">Autor</th> 
      <th style="text-align:left">Nr Albumu</th> 
</tr>
<xsl:for-each select = "/księgarnia/metadane/autor_projektu">
<tr>
	<td><xsl:value-of select = "."></xsl:value-of></td>
	<td style="text-align:center"><xsl:value-of select = "./@indeks"></xsl:value-of></td>
</tr>
</xsl:for-each>
<tr>
<td  style="text-align:center" colspan = "2">Rok akademicki</td>
</tr>
<tr>
<td  style="text-align:center" colspan = "2"><xsl:value-of select = "/księgarnia/metadane/rok_akademicki" /></td>
</tr>



</table>

			
			
</div>
		


	</body>
</html>
</xsl:template>

<xsl:template match="książka" /> 

<xsl:template match="e-book" /> 

<xsl:template match="czasopismo" /> 

<xsl:template match="Kategorie" /> 

<xsl:template match="Kategoria" /> 

<xsl:template match="lista_kategorii" /> 

<xsl:template match="Ogólne" /> 

<xsl:template match="Statystyki/Finansowe" /> 

<xsl:template match="metadane" />

  
		
</xsl:stylesheet>