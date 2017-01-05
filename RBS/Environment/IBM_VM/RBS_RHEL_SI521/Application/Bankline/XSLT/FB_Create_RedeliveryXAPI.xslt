<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by Matt Bradley (Sterling Commerce) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- ************* XSLT *******************
	
	Author:			Matt Bradley
	Project:			RBS GPL FileBroker
	Date:			04/11/2009
	Version: 		1.0
	Desc:			Creates a XAPI input for Auto-Redelivery
		 
	*********************************************-->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" cdata-section-elements="Report"/>
	<xsl:template match="*">
		<xsl:element name="MultiApi">
			<xsl:for-each select="//row/DELIVERY_KEY">
			<xsl:element name="API">
				<xsl:attribute name="Name">redeliverFgConsumerFile</xsl:attribute>
				<xsl:element name="Input">
					<xsl:element name="redeliverFgConsumerFile">
						<xsl:attribute name="DeliveryKey"><xsl:value-of select="."/></xsl:attribute>
						<xsl:attribute name="Comment">Auto Re-delivery</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>