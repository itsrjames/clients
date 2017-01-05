<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:SwInt="http://tempuri.org/SwInt.xsd" xmlns:Sw="http://tempuri.org/Sw.xsd" xmlns:ns="http://tempuri.org/ns.xsd">
	<xsl:output method="text" indent="yes"/>
	<!-- ************* XSLT *******************
		
		Author:			Matt Bradley
		Project:		RBS GPL FileBroker
		Date:			18/05/2010
		Version: 		1.0
		Desc:			Creates a text MQ ACK message containing the filename and status of a file that is about to be transferred by MQ.
		
*********************************************-->
	<xsl:template match="*">
				<xsl:value-of select="concat(MQ/correlationId,'&#xA;')"/>
				<xsl:value-of select="concat(FB_MQProcessMeta/MetaData,'&#xA;')"/>
				<xsl:choose>
					<xsl:when test="number(FB_MQProcessMeta/MQStatus)=0 or string-length(FB_MQProcessMeta/MQStatus)=0">
						<xsl:value-of select="concat('OK','&#xA;')"/>
					</xsl:when>
					<xsl:when test="number(FB_MQProcessMeta/MQStatus)=1">
						<xsl:value-of select="concat('NOK-ACKD','&#xA;')"/>
					</xsl:when>
					<xsl:when test="number(FB_MQProcessMeta/MQStatus)=2">
						<xsl:value-of select="concat('NOK-FILESENT','&#xA;')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('NOK-UNKNOWN','&#xA;')"/>
					</xsl:otherwise>
				</xsl:choose>
	</xsl:template>
</xsl:stylesheet>