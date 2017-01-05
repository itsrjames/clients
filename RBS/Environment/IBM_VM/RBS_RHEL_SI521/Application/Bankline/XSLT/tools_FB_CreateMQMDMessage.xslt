<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:SwInt="http://tempuri.org/SwInt.xsd" xmlns:Sw="http://tempuri.org/Sw.xsd" xmlns:ns="http://tempuri.org/ns.xsd">
	<xsl:output method="text" indent="yes"/>
	<!-- ************* XSLT *******************
		
		Author:			Peter McHugh
		Project:			RBS GPL
		Date:			22/10/2009
		Version: 		1.0
		Desc:			Creates a text MQ message containing the filename of a file that is about to be transferred by MQ.
		
*********************************************-->
	<xsl:template match="/">
				<xsl:value-of select="concat(//Filename,'&#xA;')"/>
	</xsl:template>
</xsl:stylesheet>