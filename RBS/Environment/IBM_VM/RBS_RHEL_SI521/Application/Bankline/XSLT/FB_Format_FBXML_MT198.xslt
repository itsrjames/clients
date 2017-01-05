<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by Matt Bradley (Sterling Commerce) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- ************* XSLT *******************
	
	Author:		Matt Bradley
	Project:		RBS FileBroker BAO
	Date:		14/02/2011
	Version: 	1.0
	Desc:		Formats a FSN (FBXML) into MT198
	*********************************************-->
	<xsl:output method="text"/>
	<!--<xsl:variable name="SenderID">RBOSGB2LXGPL</xsl:variable>
	<xsl:variable name="ReceiverID">30005</xsl:variable>
	<xsl:variable name="UnknownCSID">00000000</xsl:variable>-->
	<xsl:param name="SenderID"/>
	<xsl:param name="ReceiverID"/>
	<xsl:param name="UnknownCSID"/>
	<xsl:variable name="TWELVE_XS">XXXXXXXXXXXX</xsl:variable>
	<xsl:variable name="CRLF" select="'&#xA;'"/>
	<xsl:template match="*">
		<!--
{1:F99RBOSGB2LXGPL0000000000}{2:I1982000465 N}{4: 
:20:FSN3310 
:12:198 
:77E: 
GPL.EICSV.21002831.AN 
2010-05-26/10:15:29 
File accepted for further processing 
-}
{1:F99XXXXXXXXXXXX0000000000}{2:I198XXXXXXXXXXXXN}{4: 
:20:FSN3332 
:12:198
:77E: 
GPL.EICSV.21002844.AN 
2010-05-18/10:30:22 
GPL_RR08 
The file contents have failed validation 
Line# 1[Field1] Bankline Direct ID in content does not match submitter.
Line# 2[Field1] Bankline Direct ID in content does not match submitter.
Line# 3[Field1] Bankline Direct ID in content does not match submitter.
-}
-->
		<!-- block 1-->
		<xsl:text>{1:F99</xsl:text>
		<xsl:value-of select="$SenderID"/>
		<!--pad the Sender ID with trailing spaces to 12 chars-->
		<xsl:call-template name="TrailingSpaces">
			<xsl:with-param name="MaxLength">12</xsl:with-param>
			<xsl:with-param name="Input" select="$SenderID"/>
		</xsl:call-template>
		<xsl:text>0000000000}</xsl:text>
		<!-- block 2-->
		<xsl:text>{2:I198</xsl:text>
		<!--if 00000000 then we have an unknown customer-->
		<xsl:choose>
			<xsl:when test="$ReceiverID=$UnknownCSID">
				<xsl:value-of select="$TWELVE_XS"/>
				<xsl:call-template name="TrailingSpaces">
					<xsl:with-param name="MaxLength">12</xsl:with-param>
					<xsl:with-param name="Input" select="$TWELVE_XS"/>
				</xsl:call-template>
			</xsl:when>
			<!--pad the ReceiverID with trailing spaces to 12 chars-->
			<xsl:otherwise>
				<xsl:value-of select="$ReceiverID"/>
				<xsl:call-template name="TrailingSpaces">
					<xsl:with-param name="MaxLength">12</xsl:with-param>
					<xsl:with-param name="Input" select="$ReceiverID"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>N}</xsl:text>
		<!-- block 4-->
		<xsl:text>{4:</xsl:text>
		<xsl:value-of select="$CRLF"/>
		<xsl:text>:20:</xsl:text>
		<xsl:value-of select="concat('FSN', FileId)"/>
		<xsl:value-of select="$CRLF"/>
		<xsl:text>:12:198</xsl:text>
		<xsl:value-of select="$CRLF"/>
		<xsl:text>:77E:</xsl:text>
		<xsl:value-of select="$CRLF"/>
		<!--<xsl:value-of select="Filename"/>
		<xsl:value-of select="$CRLF"/>-->
		<xsl:variable name="long_filename0" select="substring(Filename, 1,77)"/>
		<xsl:variable name="long_filename1" select="substring(Filename, 78,255)"/>
		<xsl:variable name="long_filename2" select="substring(Filename, 256,233)"/>
		<xsl:choose>
			<!--add the Filename to the report if longer than 78chars-->
			<xsl:when test="string-length(Filename)>78">
				<xsl:value-of select="substring(Filename, 1,75)"/>
				<xsl:text>...</xsl:text>
				<xsl:value-of select="$CRLF"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="Filename"/>
				<xsl:value-of select="$CRLF"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="substring-before(translate(Timestamp, 'T', '/'), '.')"/>
		<xsl:value-of select="$CRLF"/>
		<xsl:choose>
			<xsl:when test="Status='R'">
				<xsl:if test="string-length(RejectionReason/Code)>0">
					<xsl:value-of select="RejectionReason/Code"/>
					<xsl:value-of select="$CRLF"/>
				</xsl:if>
				<xsl:if test="string-length(RejectionReason/Description)>0">
					<xsl:choose>
						<!--wrap the description if longer than 78chars-->
						<xsl:when test="string-length(RejectionReason/Description)>78">
							<xsl:value-of select="substring(RejectionReason/Description, 1,77)"/>
							<xsl:text>-</xsl:text>
							<xsl:value-of select="$CRLF"/>
							<!--max 2 lines-->
							<xsl:value-of select="substring(RejectionReason/Description, 78,155)"/>
							<xsl:value-of select="$CRLF"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="RejectionReason/Description"/>
							<xsl:value-of select="$CRLF"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>File accepted for further processing</xsl:text>
				<xsl:value-of select="$CRLF"/>
			</xsl:otherwise>
		</xsl:choose>
		<!--display the full filename in the report-->
		<xsl:choose>
			<xsl:when test="string-length(Filename)>78">
				<xsl:text>Full filename:</xsl:text>
				<xsl:value-of select="substring(Filename, 1,63)"/>
				<xsl:text>-</xsl:text>
				<xsl:value-of select="$CRLF"/>
				<xsl:value-of select="substring(Filename, 64,77)"/>
				<xsl:if test="string-length(Filename)>140">
					<xsl:text>-</xsl:text>
					<xsl:value-of select="$CRLF"/>
					<xsl:value-of select="substring(Filename, 141,219)"/>
				</xsl:if>
				<xsl:value-of select="$CRLF"/>
			</xsl:when>
		</xsl:choose>
		<!-- we need no more than 5 lines from the report
			each line is no longer than 78 chars
			-->
		<xsl:choose>
			<xsl:when test="string-length(Report)>0">
				<xsl:call-template name="format-report">
					<xsl:with-param name="text" select="Report"/>
					<xsl:with-param name="delimiter" select="'&#xA;'"/>
					<xsl:with-param name="maxlinelength">78</xsl:with-param>
					<xsl:with-param name="line">1</xsl:with-param>
					<xsl:with-param name="maxlines">5</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
		<xsl:text>-}</xsl:text>
	</xsl:template>
	<xsl:template name="TrailingSpaces">
		<xsl:param name="MaxLength"/>
		<xsl:param name="Input"/>
		<xsl:if test="string-length($Input) &lt; number($MaxLength)">
			<xsl:call-template name="for.loop">
				<xsl:with-param name="i">1</xsl:with-param>
				<xsl:with-param name="count" select="($MaxLength)-string-length($Input)"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="for.loop">
		<xsl:param name="i"/>
		<xsl:param name="count"/>
		<xsl:if test="$i &lt;= $count">
			<xsl:value-of select="'&#32;'"/>
		</xsl:if>
		<xsl:if test="$i &lt;= $count">
			<xsl:call-template name="for.loop">
				<xsl:with-param name="i">
					<xsl:value-of select="$i + 1"/>
				</xsl:with-param>
				<xsl:with-param name="count">
					<xsl:value-of select="$count"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="format-report">
		<xsl:param name="text"/>
		<xsl:param name="delimiter"/>
		<xsl:param name="maxlinelength"/>
		<xsl:param name="line"/>
		<xsl:param name="maxlines"/>
		<xsl:if test="$line &lt;= $maxlines">
			<xsl:choose>
				<xsl:when test="contains($text, $delimiter)">
					<xsl:variable name="t" select="substring-before($text, $delimiter)"/>
					<xsl:if test="normalize-space($t)">
						<xsl:value-of select="substring($t, 1, $maxlinelength)"/>
						<xsl:value-of select="$CRLF"/>
					</xsl:if>
					<xsl:call-template name="format-report">
						<xsl:with-param name="text" select="substring-after($text, $delimiter)"/>
						<xsl:with-param name="delimiter" select="$delimiter"/>
						<xsl:with-param name="maxlinelength" select="$maxlinelength"/>
						<xsl:with-param name="line" select="$line+1"/>
						<xsl:with-param name="maxlines" select="$maxlines"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="normalize-space($text)">
						<xsl:value-of select="substring($text,1,$maxlinelength)"/>
						<xsl:value-of select="$CRLF"/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>