<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:SwInt="http://tempuri.org/SwInt.xsd" xmlns:Sw="http://tempuri.org/Sw.xsd" xmlns:ns="http://tempuri.org/ns.xsd">
	<xsl:output method="text" indent="yes"/>
	<!-- ************* XSLT *******************
		
		Author:			Matt Bradley
		Project:			RBS GPL FileBroker
		Date:			01/12/2009
		Version: 		1.1
		Desc:			Creates a ProcessedFilereport froma JDBC query XML input
							v1.1 - added DATAFLOW_ID column
		
*********************************************-->
	<xsl:template match="*">
		<xsl:for-each select="row">
				<xsl:value-of select="FILE_NAME"></xsl:value-of>
				<xsl:value-of select="string('|')"/>
				<xsl:value-of select="CUSTOMER_FILENAME"></xsl:value-of>
				<xsl:value-of select="string('|')"/>
				<xsl:value-of select="DATAFLOW_ID"></xsl:value-of>
				<xsl:value-of select="string('&#xA;')"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>