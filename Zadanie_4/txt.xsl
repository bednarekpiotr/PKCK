<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8" indent="yes"/>
	


	<xsl:template match="/">
	
	<xsl:text>&#xA; SPIS TREŚCI&#xA;&#xA;</xsl:text>
	<xsl:text> 1. Lista wszystkich pozycji&#xA;</xsl:text>
	<xsl:text> 2. Pozycje z podziałem na kategorie&#xA;</xsl:text>
	<xsl:text> 3. Statystyki ogólne&#xA;</xsl:text>
	<xsl:text> 4. Statystyki finansowe&#xA;</xsl:text>
	<xsl:text> 5. Metadane&#xA;&#xA;</xsl:text>
	
	<xsl:text>&#xA; LISTA WSZYSTKICH POZYCJI&#xA;&#xA;</xsl:text>
	<xsl:text>&#xA; RODZAJ&#x9;&#x9;&#x9;TYTUŁ&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;AUTOR&#x9;&#x9;&#x9;&#x9;&#x9;NAZWA KATEGORII&#x9;&#x9;JĘZYK&#x9;&#x9;CENA&#x9;&#x9;WALUTA&#x9;&#x9;CENA W PLN&#xA;&#xA;</xsl:text>
	<xsl:for-each select="księgarnia/(książka|czasopismo|e-book)">
	<xsl:sort select="local-name()"/>
	<xsl:sort select="nazwa_kategorii"/>
	
	<xsl:if test="local-name()='czasopismo'">
	<xsl:value-of select="concat(' ',local-name(),'&#x9;&#x9;',
	substring(./tytuł,0,25),substring('                             ',1,25-string-length(./tytuł)),'&#x9;&#x9;&#x9;',
	substring(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko),0,20),
	substring('                             ',1,20-string-length(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko))),'&#x9;',
	./kategoria/nazwa,'&#x9;&#x9;&#x9;',./język,'&#x9;&#x9;',./cena,'&#x9;&#x9;',./cena/@waluta,'&#x9;&#x9;&#x9;',./cenaPLN,'&#x9;&#x9;','&#xA;')" />
		<xsl:if test="string-length(./tytuł)>25">
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',substring(./tytuł,25),'&#xA;')"/>
		</xsl:if>
	</xsl:if> 	
	
	<xsl:if test="local-name()='książka'">
	<xsl:value-of select="concat(' ',local-name(),'&#x9;&#x9;',
	substring(./tytuł,0,25),substring('                             ',1,25-string-length(./tytuł)),'&#x9;&#x9;&#x9;',
	substring(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko),0,20),
	substring('                             ',1,20-string-length(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko))),'&#x9;',
	./kategoria/nazwa,'&#x9;&#x9;&#x9;',./język,'&#x9;&#x9;',./cena,'&#x9;&#x9;',./cena/@waluta,'&#x9;&#x9;&#x9;',./cenaPLN,'&#x9;&#x9;','&#xA;')" />
		<xsl:if test="string-length(./tytuł)>25">
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',substring(./tytuł,25),'&#xA;')"/>
		</xsl:if>
	</xsl:if>
	
	<xsl:if test="local-name()='e-book'">
	<xsl:value-of select="concat(' ',local-name(),'&#x9;&#x9;&#x9;',
	substring(./tytuł,0,25),substring('                             ',1,25-string-length(./tytuł)),'&#x9;&#x9;&#x9;',
	substring(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko),0,20),
	substring('                             ',1,20-string-length(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko))),'&#x9;',
	./kategoria/nazwa,'&#x9;&#x9;&#x9;',./język,'&#x9;&#x9;',./cena,'&#x9;&#x9;',./cena/@waluta,'&#x9;&#x9;&#x9;',./cenaPLN,'&#x9;&#x9;','&#xA;')" />
		<xsl:if test="string-length(./tytuł)>25">
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',substring(./tytuł,25),'&#xA;')"/>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
	
	
	<xsl:text>&#xA; POZYCJE Z PODZIAŁEM NA KATEGORIE&#xA;&#xA;</xsl:text>
	<xsl:for-each select = "/księgarnia/Kategorie/Kategoria">
	<xsl:value-of select = "concat('&#x9;',./(książka|e-book|czasopismo)/Kategoria/Nazwa,'&#xA;')"/>
	<xsl:variable name ="zmienna1" select = "./Nazwa"/>
	<xsl:text>&#xA; RODZAJ&#x9;&#x9;&#x9;TYTUŁ&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;AUTOR&#x9;&#x9;&#x9;&#x9;&#x9;NAZWA KATEGORII&#x9;&#x9;JĘZYK&#x9;&#x9;CENA&#x9;&#x9;WALUTA&#x9;&#x9;CENA W PLN&#xA;&#xA;</xsl:text>
	<xsl:for-each select="./(książka | czasopismo | e-book)">
	<xsl:sort select="local-name()"/>
	<xsl:sort select="nazwa_kategorii"/>
	
	<xsl:if test="local-name()='czasopismo'">
	<xsl:value-of select="concat(' ',local-name(),'&#x9;&#x9;',
	substring(./tytuł,0,25),substring('                             ',1,25-string-length(./tytuł)),'&#x9;&#x9;&#x9;',
	substring(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko),0,20),
	substring('                             ',1,20-string-length(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko))),'&#x9;',
	./,'&#x9;&#x9;&#x9;',./język,'&#x9;&#x9;',./cena,'&#x9;&#x9;',./cena/@waluta,'&#x9;&#x9;&#x9;',./cenaPLN,'&#x9;&#x9;','&#xA;')" />
		<xsl:if test="string-length(./tytuł)>25">
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',substring(./tytuł,25),'&#xA;')"/>
		</xsl:if>
	</xsl:if> 	
	
	<xsl:if test="local-name()='książka'">
	<xsl:value-of select="concat(' ',local-name(),'&#x9;&#x9;',
	substring(./tytuł,0,25),substring('                             ',1,25-string-length(./tytuł)),'&#x9;&#x9;&#x9;',
	substring(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko),0,20),
	substring('                             ',1,20-string-length(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko))),'&#x9;',
	książka,'&#x9;&#x9;&#x9;',./język,'&#x9;&#x9;',./cena,'&#x9;&#x9;',./cena/@waluta,'&#x9;&#x9;&#x9;',./cenaPLN,'&#x9;&#x9;','&#xA;')" />
		<xsl:if test="string-length(./tytuł)>25">
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',substring(./tytuł,25),'&#xA;')"/>
		</xsl:if>
	</xsl:if>
	
	<xsl:if test="local-name()='e-book'">
	<xsl:value-of select="concat(' ',local-name(),'&#x9;&#x9;&#x9;',
	substring(./tytuł,0,25),substring('                             ',1,25-string-length(./tytuł)),'&#x9;&#x9;&#x9;',
	substring(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko),0,20),
	substring('                             ',1,20-string-length(concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko))),'&#x9;',
	./kategoria/nazwa,'&#x9;&#x9;&#x9;',./język,'&#x9;&#x9;',./cena,'&#x9;&#x9;',./cena/@waluta,'&#x9;&#x9;&#x9;',./cenaPLN,'&#x9;&#x9;','&#xA;')" />
		<xsl:if test="string-length(./tytuł)>25">
		<xsl:value-of select="concat('&#x9;&#x9;&#x9;&#x9;',substring(./tytuł,25),'&#xA;')"/>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
	</xsl:for-each>
	
	<xsl:apply-templates select="księgarnia/Statystyki"/>
    <xsl:apply-templates select="księgarnia/metadane"/>

	</xsl:template>
	
	
	<xsl:template match="tytuł" /> 
	<xsl:template match="język" /> 
	<xsl:template match="częstotliwość" /> 
	<xsl:template match="cena" /> 
	<xsl:template match="cenaPLN" /> 
	<xsl:template match="ISBN" /> 
	<xsl:template match="wydawnictwo" /> 
	<xsl:template match="wydanie" /> 
	
	
<xsl:template match="książka" /> 
<xsl:template match="książka/tytuł" /> 
<xsl:template match="książka/język" /> 
<xsl:template match="książka/cena" /> 
<xsl:template match="książka/ilość_stron" /> 
<xsl:template match="książka/cenaPLN" /> 
<xsl:template match="książka/ISBN" /> 
<xsl:template match="książka/wydawnictwo" /> 
<xsl:template match="książka/wydanie" /> 

<xsl:template match="e-book" /> 

<xsl:template match="czasopismo" /> 

<xsl:template match="Kategorie" /> 

<xsl:template match="Kategoria" /> 

<xsl:template match="lista_kategorii" /> 
	
	

	<xsl:template match="Statystyki">
        <xsl:text>&#xA; STATYSTYKI OGÓLNE&#xA;</xsl:text>
        <xsl:text>&#xA; NAZWA&#x9;&#x9;&#x9;&#x9;&#x9;WARTOŚĆ&#xA;&#xA;</xsl:text>
		<xsl:value-of select="concat(' Liczba pozycji:&#x9;&#x9;',./Ogólne/LiczbaPozycji,'&#xA;')" />
		<xsl:value-of select="concat(' Liczba książek:&#x9;&#x9;',./Ogólne/LiczbaKsiążek,'&#xA;')" />
		<xsl:value-of select="concat(' Liczba e-booków:&#x9;&#x9;',./Ogólne/LiczbaEbooków,'&#xA;')" />
		<xsl:value-of select="concat(' Liczba czasopism:&#x9;&#x9;',./Ogólne/LiczbaCzasopism,'&#xA;')" />
		<xsl:value-of select="concat(' Liczba kategorii:&#x9;&#x9;',./Ogólne/LiczbaKategorii,'&#xA;&#xA;')" />	
        <xsl:text>&#xA; STATYSTYKI FINANSOWE&#xA;</xsl:text>
        <xsl:text>&#xA; NAZWA&#x9;&#x9;&#x9;&#x9;&#x9;WARTOŚĆ&#xA;&#xA;</xsl:text>
		<xsl:value-of select="concat(' Średnia cena &#xA; pozycji w PLN:&#x9;&#x9;&#x9;',round((sum(/księgarnia/(książka|czasopismo|e-book)/cenaPLN) div (count(/księgarnia/(książka|czasopismo|e-book))))div 0.01) * 0.01,'&#xA;')" />			
    </xsl:template>	
	
	<xsl:template match="metadane">
        <xsl:text>&#xA;&#xA; AUTOR&#x9;&#x9;&#x9;&#x9;&#x9;NUMER INDEKSU&#xA;&#xA;</xsl:text>
		<xsl:for-each select="./autor_projektu">
		<xsl:value-of select="concat(.,'&#x9;&#x9;',./@indeks,'&#xA;')" />
		</xsl:for-each>
		<xsl:value-of select="concat('&#xA; Rok akademicki:&#x9;&#x9;',./rok_akademicki,'&#xA;')" />
    </xsl:template>

	
</xsl:stylesheet>