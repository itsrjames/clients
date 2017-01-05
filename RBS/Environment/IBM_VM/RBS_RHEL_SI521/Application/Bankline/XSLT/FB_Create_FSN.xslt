<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by Matt Bradley (Sterling Commerce) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- ************* XSLT *******************
	
	Author:			Matt Bradley
	Project:			RBS GPL FileBroker
	Date:			05/04/2011
	Version: 		1.1
	Desc:			04/11/2009(v1.0) - Creates a GPL File Status Notification (FSN - FBXML format)
						05/04/2011(v1.1) - Status is parameterixed and Timestamp is fixed to discount the randomized integer at chars 11 and 12
					
		 
	*********************************************-->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" cdata-section-elements="Report"/>
	<xsl:param name="Status"/>
	<xsl:template match="*">
		<xsl:element name="FSN">
			<xsl:element name="FileId">
				<xsl:value-of select="RouteDataflowId"/>
			</xsl:element>
			<xsl:element name="Filename">
				<xsl:value-of select="PFilename"/>
			</xsl:element>
			<xsl:element name="Timestamp">
				<xsl:value-of select="concat(substring(RouteID, 1,4), '-', substring(RouteID, 5,2), '-', substring(RouteID, 7,2), 'T', substring(RouteID, 9,2), ':', substring(RouteID, 13,2), ':', substring(RouteID, 15,2), '.0Z')"/>
			</xsl:element>
			<xsl:element name="Status">
				<xsl:choose>
					<xsl:when test="translate($Status, 'a', 'A')='A'">
						<xsl:text>A</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>R</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="RejectionReason">
				<xsl:element name="Code">
					<xsl:value-of select="GPL/RRCode"/>
				</xsl:element>
				<xsl:element name="Description">
					<xsl:value-of select="GPL/RRDescription"/>
				</xsl:element>
			</xsl:element>
			<xsl:element name="Report">
				<xsl:value-of select="GPL/RRReport"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>