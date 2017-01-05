<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:SwInt="http://tempuri.org/SwInt.xsd" xmlns:Sw="http://tempuri.org/Sw.xsd" xmlns:ns="http://tempuri.org/ns.xsd">
	<xsl:output method="text" indent="yes"/>
	<!-- ************* XSLT *******************
		
		Author:			Matt Bradley
		Project:			RBS GPL FileBroker
		Date:			29/04/2010
		Version: 		1.0
		Desc:			Creates a CSV file of the GPL File records
		
*********************************************-->
	<xsl:template match="*">
		<xsl:text>FILE_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>SUBMITTER_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>DATAFLOW_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>CUSTOMER_FILENAME</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>CHANNEL</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>CHANNEL_REFERENCE</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>CHECKSUM</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>OUTBOUND</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>ARCHIVED</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>REPORTED</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>CREATED</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>LAST_MODIFIED</xsl:text>
		<xsl:value-of select="string('&#xA;')"/>
		<xsl:for-each select="row">
			<xsl:value-of select="FILE_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="SUBMITTER_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="DATAFLOW_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="CUSTOMER_FILENAME"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="CHANNEL"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="CHANNEL_REFERENCE"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="CHECKSUM"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="OUTBOUND"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="ARCHIVED"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="REPORTED"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="CREATED"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="LAST_MODIFIED"/>
			<xsl:value-of select="string('&#xA;')"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>