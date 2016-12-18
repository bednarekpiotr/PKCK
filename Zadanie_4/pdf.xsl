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
			 
                <fo:flow flow-name="xsl-region-body"> 
				    <fo:block>AAAAA           </fo:block>
				</fo:flow>

            </fo:page-sequence>
	
	</fo:root>
	</xsl:template>



</xsl:stylesheet>