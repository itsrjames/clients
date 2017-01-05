<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by Matt Bradley (Sterling Commerce) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- ************* XSLT *******************
	
	Author:		Matt Bradley
	Project:		RBS FileBroker BAO
	Date:		09/02/2011
	Version: 	1.0
	Desc:		Flattens Translation XML report from Translation Service for GPL FSN file
	*********************************************-->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" cdata-section-elements="RRReport"/>
	<xsl:template match="*">
		<xsl:element name="TransReport">
			<xsl:element name="RRReport">
				<xsl:for-each select="/TranslationReport/*[local-name()='Input' or local-name()='Pre-session']/*[local-name()='Error' or local-name()='Warning']">
					<xsl:variable name="exception" select="Info[Name='10006']/Value"/>
					<xsl:variable name="additionalinfo" select="Info[Name='10018']/Value"/>
					
					<xsl:text>Line# </xsl:text>
					<xsl:value-of select="Info[Name='10002']/Value"/>
					<xsl:text>[</xsl:text>
					<xsl:value-of select="Info[Name='10004']/Value"/>
					<xsl:text>] (</xsl:text>
					<xsl:value-of select="Code"/>
					<xsl:text>) </xsl:text>
					<xsl:choose>
						<xsl:when test="Code='25'">
							<xsl:text>BlockDataUnknown</xsl:text>
						</xsl:when>
						<xsl:when test="Code='100'">
							<xsl:text>Mandatory Data Missing</xsl:text>
						</xsl:when>
						<xsl:when test="Code='101'">
							<xsl:text>Insufficient Repeats</xsl:text>
						</xsl:when>
						<xsl:when test="Code='100'">
							<xsl:text>Mandatory Data Missing</xsl:text>
						</xsl:when>
						<xsl:when test="Code='102'">
							<xsl:text>Too Many Repeats</xsl:text>
						</xsl:when>
						<xsl:when test="Code='110'">
							<xsl:text>Incorrect Data Format</xsl:text>
						</xsl:when>
						<xsl:when test="Code='111'">
							<xsl:text>Data Not Min Length</xsl:text>
						</xsl:when>
						<xsl:when test="Code='112'">
							<xsl:text>Data Exceeds Max Length</xsl:text>
						</xsl:when>
						<xsl:when test="Code='113'">
							<xsl:text>Invalid Date</xsl:text>
						</xsl:when>
						<xsl:when test="Code='120'">
							<xsl:text>Too Many Components</xsl:text>
						</xsl:when>
						<xsl:when test="Code='121'">
							<xsl:text>Too Many Composite Elements</xsl:text>
						</xsl:when>
						<xsl:when test="Code='122'">
							<xsl:text>Unsupported Data Type</xsl:text>
						</xsl:when>
						<xsl:when test="Code='123'">
							<xsl:text>Data Conversion Error</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="string-length($exception)=0 and string-length($additionalinfo)=0">
								<xsl:text>Unspecified error</xsl:text>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="string-length($exception)>0 or string-length($additionalinfo)>0">
						<xsl:text> - </xsl:text>
						<xsl:choose>
							<xsl:when test="string-length($exception)>0">
								<xsl:value-of select="$exception"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="Info[Name='10018']/Value"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:value-of select="'&#xD;'"/>
				</xsl:for-each>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>