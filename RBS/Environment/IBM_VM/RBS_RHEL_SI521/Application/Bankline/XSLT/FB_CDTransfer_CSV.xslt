<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:SwInt="http://tempuri.org/SwInt.xsd" xmlns:Sw="http://tempuri.org/Sw.xsd" xmlns:ns="http://tempuri.org/ns.xsd">
	<xsl:output method="text" indent="yes"/>
	<!-- ************* XSLT *******************
		
		Author:			Matt Bradley
		Project:			RBS GPL FileBroker
		Date:			29/04/2010
		Version: 		1.0
		Desc:			Creates a CSV file of the CD Transfer records
		
*********************************************-->
	<xsl:template match="*">
		<xsl:text>ASYNC_CD_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>SNODE</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>FILENAME</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>DATAFLOW_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>DELIVERY_WFID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>DELIVERY_KEY</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>DOCUMENT_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>ASYNC_WFID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>BATCH_ID</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>STATUS</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>ARCHIVED</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>CREATED</xsl:text>
		<xsl:value-of select="string(',')"/>
		<xsl:text>LAST_MODIFIED</xsl:text>
		<xsl:value-of select="string('&#xA;')"/>
		<xsl:for-each select="row">
			<xsl:value-of select="ASYNC_CD_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="SNODE"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="FILENAME"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="DATAFLOW_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="DELIVERY_WFID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="DELIVERY_KEY"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="DOCUMENT_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="ASYNC_WFID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="BATCH_ID"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="STATUS"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="ARCHIVED"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="CREATED"/>
			<xsl:value-of select="string(',')"/>
			<xsl:value-of select="LAST_MODIFIED"/>
			<xsl:value-of select="string('&#xA;')"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
