<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by Matt Bradley (Sterling Commerce) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- ************* XSLT *******************
	
	Author:			Matt Bradley
	Project:			RBS GPL FileBroker
	Date:			19/05/2010
	Version: 		1.0
	Desc:			Creates a XAPI input for changeSchedule from a list of SCHEDULEID
		 
	*********************************************-->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" cdata-section-elements="Report"/>
	<xsl:param name="STATUS"/>
	<xsl:template match="*">
		<xsl:element name="MultiApi">
			<xsl:for-each select="//SCHEDULEID">
			<xsl:element name="API">
				<xsl:attribute name="Name">changeSchedule</xsl:attribute>
				<xsl:element name="Input">
					<xsl:element name="Schedule">
						<xsl:attribute name="ScheduleID"><xsl:value-of select="."/></xsl:attribute>
						<xsl:attribute name="Status"><xsl:value-of select="$STATUS"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
