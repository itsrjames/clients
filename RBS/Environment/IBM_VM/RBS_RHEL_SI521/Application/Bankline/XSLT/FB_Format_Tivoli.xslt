<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by Matt Bradley (Sterling Commerce) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- ************* XSLT *******************
	
	Author:			Matt Bradley
	Project:			RBS GPL FileBroker
	Date:			26/10/2009
	Version: 		1.0
	Desc:			Formats various events to log to Tivoli
		 
	*********************************************-->
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="*">
		<xsl:element name="Tivoli">
			<xsl:element name="TIV_ID">
				<xsl:choose>
					<xsl:when test="starts-with(//Event/id,'FileBroker.FBEvent.BPException')">
						<!--go back 4 spaces looking for a 3 digit  number and a period - get the number and strip off the original string-->
						<xsl:value-of select="concat(substring-before(//Event/id, concat('.', substring-after(substring(//Event/id, string-length(//Event/id)-3), '.'))),'.',//Event/ErrorCode)"/>
					</xsl:when>
					<xsl:otherwise>
						<!--go back 4 spaces looking for a 3 digit  number and a period - get the number and strip off the original string-->
						<xsl:value-of select="substring-before(//Event/id, concat('.', substring-after(substring(//Event/id, string-length(//Event/id)-3), '.')))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="TIV_SEVERITY">
				<xsl:choose>
					<xsl:when test="starts-with(//Event/id,'Aft.')">
						<xsl:text>WARNING</xsl:text>
					</xsl:when>
					<xsl:when test="starts-with(//Event/id,'FileBroker.FBEvent.BPException') and string(//ExceptionLevel)='Abnormal'">
						<xsl:text>WARNING</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>CRITICAL</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:choose>
				<xsl:when test="starts-with(//Event/id,'FileBroker.FBEvent.BPException')">
					<!--	TIV_MSG is generated from Event/ErrorCode + : + Event/ErrorName + . + Event/ErrorDescription + [Business Process ID= + Event/WFID + ][Info= + Event/Info-->
					<xsl:element name="TIV_MSG">
						<xsl:value-of select="concat(//Event/ErrorName,'(', //Event/ErrorCode, '):',//Event/ErrorDescription,'[WFID=',//Event/WFID,'][Info=', //Event/Info, ']')"/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="starts-with(//Event/id,'Fg.Visibility.ArrivedFileFailed')">
					<!--	TIV_MSG is generated from File Gateway Error. An error occurred routing a file through the File Gateway [Data Flow ID= + Event/ DataflowId + ]-->
					<xsl:element name="TIV_MSG">
						<xsl:value-of select="concat('File Gateway Error. An error occurred routing a file through the File Gateway [Data Flow ID=', //Event/DataflowId, ']')"/>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<!--Non-specific error-->
					<xsl:element name="TIV_MSG">
						<xsl:for-each select="//Event/*[local-name()!='id' and local-name()!='ExceptionLevel' and local-name()!='TimeStamp' and local-name()!='adminAuditId' and local-name()!='time']">
							<xsl:value-of select="local-name()"/>
							<xsl:text>=</xsl:text>
							<xsl:copy-of select="string(.)"/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>