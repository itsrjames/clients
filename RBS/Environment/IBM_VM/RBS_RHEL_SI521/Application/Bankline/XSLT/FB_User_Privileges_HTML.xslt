<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<!-- keys for grouping-->
	<xsl:key name="userkey" match="row" use="USER_ID"/>
	<xsl:key name="permkey" match="row" use="concat(PERMISSION, USER_ID)"/>
	<xsl:template match="*">
		<html>
		<head>
		<LINK rel="stylesheet" type="text/css" href="./css/blue/admin.css"/>
			<title>User Privileges Report</title>
		</head>
		
			<body>
			<a class='PageHdr'>User Privileges Report</a>
				<table>
					<tbody>
						<xsl:for-each select="//row[generate-id(.)=generate-id(key('userkey', USER_ID)[1])]">
							<xsl:sort select="USER_ID"/>
							<tr>
								<td colspan="3">
								<table cellpadding="0" cellspacing="0" width="100%">
										<tr class='whiteTblHdr'>
											<td class='whiteTblHdr' align="left" wifth="100">User ID: 
											<img src='./images/blue/plc-holder.gif' border="0"  height='1' width="10"/>
											<xsl:value-of select="USER_ID"/>
											<img src='./images/blue/plc-holder.gif' border="0"  height='1' width="10"/>
											<xsl:text>(</xsl:text>
											<xsl:value-of select="concat(FIRST_NAME, ' ', LAST_NAME)"/>
											<xsl:text>)</xsl:text>
											</td>
											<td class='whiteTblHdr' align="left"><img src='./images/blue/plc-holder.gif' border="0"  height='1' width="50"/></td>
											<td class='whiteTblHdr' align="left"></td>
										</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>#</td>
								<td>Permission</td>
							</tr>
							<xsl:if test="number(SUPER)=1">
							
								<tr>
									<td/>
									<td>1</td>
									<td>
										<xsl:text>Super User</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="number(SUPER)=0">
								<xsl:for-each select="key('userkey', USER_ID)[generate-id(.)=generate-id(key('permkey', concat(PERMISSION, USER_ID)))]">
									<xsl:choose>
										<xsl:when test="(position() mod 2) =1">
										<tr>
										<td class='grayEditSelection'/>
										<td class='grayEditSelection'><xsl:value-of select="position()"/></td>
										<td class='grayEditSelection'>
											
											<xsl:value-of select="PERMISSION"/>
										</td>
									</tr>
										
										</xsl:when>
										<xsl:otherwise>
<tr>
										<td class='editSelection'/>
										<td class='editSelection'><xsl:value-of select="position()"/></td>
										<td class='editSelection'>
											
											<xsl:value-of select="PERMISSION"/>
										</td>
									</tr>										
										</xsl:otherwise>
									</xsl:choose>
									
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>