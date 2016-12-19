<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"    >

<xsl:output method="xml"  encoding="utf-8"/>

    <xsl:template match="/">
	        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="księgarnia" 
									   page-height="297mm" 
                                       page-width="210mm"
                                       margin-top="20" 
                                       margin-bottom="40" 
                                       margin-left="50" 
                                       margin-right="50">
				    <fo:region-body margin="30,10"/>
                    <fo:region-before extent="5" />
                    <fo:region-after extent="5" />
                    <fo:region-start extent="5" />
                    <fo:region-end extent="5" />
                </fo:simple-page-master>
            </fo:layout-master-set>
			
			 <fo:page-sequence master-reference="księgarnia">
			    <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-family="Segoe UI" color="#7b7366" font-size="10px">
                        <xsl:text>Księgarnia Focus</xsl:text>
                    </fo:block>
                </fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" color="#7b7366" font-family="Segoe UI"  font-size="10px">
                        <xsl:text> - </xsl:text> 
                        <fo:page-number />
						<xsl:text> - </xsl:text>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body"> 
				
		<fo:block font-size="18px" text-align="center" font-weight="bold" font-family="Arial" linefeed-treatment="preserve">
		    <xsl:text>Lista wszystkich pozycji</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>		

		 <fo:table border="solid red" width="100%" font-size="8px">
		            <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Rodzaj</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Tytuł</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Autor</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Nazwa kategorii</fo:block>
                            </fo:table-cell>	
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Język</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Cena</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Waluta</fo:block>
                            </fo:table-cell>	
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Cena w PLN</fo:block>
                            </fo:table-cell>							
                        </fo:table-row>
                    </fo:table-header>
					
					<fo:table-body>
						<xsl:for-each select="księgarnia/(książka|czasopismo|e-book)">
						<xsl:sort select="local-name()"/>
						<xsl:sort select="nazwa_kategorii"/>
					    <fo:table-row>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="local-name()"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./tytuł"/>
                                    </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko)"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./kategoria/nazwa"/>
                                    </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./język"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./cena"/>
                                    </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./cena/@waluta"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./cenaPLN"/>
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>	
					</xsl:for-each>
					</fo:table-body>
		 </fo:table>							
		

		<fo:block font-size="18px" text-align="center" font-weight="bold" font-family="Arial" linefeed-treatment="preserve">
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		    <xsl:text>Lista pozycji z podziałem na kategorie</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>	
		
			<xsl:for-each select = "/księgarnia/Kategorie/Kategoria">
			
			<fo:block font-size="16px" text-align="left" font-weight="bold" font-family="Arial" linefeed-treatment="preserve">
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		    <xsl:value-of select = "./(książka|e-book|czasopismo)/kategoria/nazwa"/>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
			
			<xsl:variable name ="zmienna1" select = "./(książka|e-book|czasopismo)/kategoria/nazwa"/>
				 <fo:table border="solid red" width="100%" font-size="8px">
		            <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Rodzaj</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Tytuł</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Autor</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Nazwa kategorii</fo:block>
                            </fo:table-cell>	
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Język</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Cena</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Waluta</fo:block>
                            </fo:table-cell>	
                            <fo:table-cell border="solid red">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Cena w PLN</fo:block>
                            </fo:table-cell>							
                        </fo:table-row>
                    </fo:table-header>
					
					<fo:table-body>
						<xsl:for-each select="./(książka | czasopismo | e-book)">
						<xsl:sort select="./tytuł"/>
					    <fo:table-row>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="local-name()"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./tytuł"/>
                                    </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="concat(./Autorzy/autor[1]/imięPierwsze,' ',./Autorzy/autor[1]/nazwisko)"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="$zmienna1"/>
                                    </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./język"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./cena"/>
                                    </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./cena/@waluta"/>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="solid red" border-width="0.5pt">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:value-of select="./cenaPLN"/>
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>	
					</xsl:for-each>
					</fo:table-body>
				</fo:table>
				</xsl:for-each>
				<fo:block linefeed-treatment="preserve">
				<xsl:text>&#xD;&#xA;</xsl:text>
				<xsl:text>&#xD;&#xA;</xsl:text>
				</fo:block>	
						<xsl:apply-templates select="księgarnia/Statystyki"/>
						<xsl:apply-templates select="księgarnia/metadane"/>
				</fo:flow>

            </fo:page-sequence>
	
	</fo:root>
	</xsl:template>

		<xsl:template match="Statystyki">
		<fo:block font-size="18px" text-align="center" font-weight="bold" font-family="Arial" linefeed-treatment="preserve">
		    <xsl:text>Statystyki ogólne</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		
		 <fo:table border="solid blue" width="100%">
		            <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell border="solid blue">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Nazwa</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid blue">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Wartość</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
					
					<fo:table-body>
					    <fo:table-row>
                            <fo:table-cell border="dashed blue">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:text>Liczba pozycji</xsl:text>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="dashed blue">
                                    <fo:block text-align="center"> 
									<xsl:value-of select="./Ogólne/LiczbaPozycji" />
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
					    <fo:table-row>
                            <fo:table-cell border="dashed blue">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:text>Liczba książek</xsl:text>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="dashed blue">
                                    <fo:block text-align="center"> 
									<xsl:value-of select="./Ogólne/LiczbaKsiążek" />
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>	
						<fo:table-row>
                            <fo:table-cell border="dashed blue">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:text>Liczba e-booków</xsl:text>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="dashed blue">
                                    <fo:block text-align="center"> 
									<xsl:value-of select="./Ogólne/LiczbaEbooków" />
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
						<fo:table-row>
                            <fo:table-cell border="dashed blue">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:text>Liczba czasopism</xsl:text>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="dashed blue">
                                    <fo:block text-align="center"> 
									<xsl:value-of select="./Ogólne/LiczbaCzasopism" />
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>	
						<fo:table-row>
                            <fo:table-cell border="dashed blue">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:text>Liczba kategorii</xsl:text>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="dashed blue">
                                    <fo:block text-align="center"> 
									<xsl:value-of select="./Ogólne/LiczbaKategorii" />
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>						
					</fo:table-body>
		 </fo:table>
		 
		<fo:block font-size="18px" text-align="center" font-weight="bold" font-family="Arial" linefeed-treatment="preserve">
			<xsl:text>&#xD;&#xA;</xsl:text>
		    <xsl:text>Statystyki finansowe</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		
		 <fo:table border="solid green" width="100%">
		            <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell border="solid green">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Nazwa</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid green">
                                <fo:block font-weight="bold" font-family="Arial" text-align="center">Wartość</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
					
					<fo:table-body>		
						<fo:table-row>
                            <fo:table-cell border="dashed green">
                                    <fo:block text-align="center" font-family="Arial"> 
									<xsl:text>Średnia cena pozycji w PLN</xsl:text>
                                    </fo:block>
                            </fo:table-cell>
							<fo:table-cell border="dashed green">
                                    <fo:block text-align="center"> 
									<xsl:value-of select="round((sum(/księgarnia/(książka|czasopismo|e-book)/cenaPLN) div (count(/księgarnia/(książka|czasopismo|e-book))))div 0.01) * 0.01" />
                                    </fo:block>
                            </fo:table-cell>
                        </fo:table-row>						
					</fo:table-body>
		</fo:table>
		
		<fo:block linefeed-treatment="preserve">
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:text>&#xD;&#xA;</xsl:text>
		</fo:block>
		 
    </xsl:template>
	
	<xsl:template match="metadane">
		<fo:block font-size="18px" text-align="center" font-weight="bold" font-family="Arial">
		    <xsl:text>Autorzy</xsl:text>
		</fo:block>
		<fo:block font-size="14px" text-align="center" font-weight="normal" font-style="italic" font-family="Arial" linefeed-treatment="preserve">
		    <xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:for-each select="./autor_projektu">
			<xsl:value-of select="concat(.,' (',./@indeks,') ')" />
			</xsl:for-each>
			<xsl:text>&#xD;&#xA;</xsl:text>
			<xsl:value-of select="concat('Rok akademicki: ',./rok_akademicki)" />
		</fo:block>
    </xsl:template>



</xsl:stylesheet>