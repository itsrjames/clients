<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java">
<!-- ************* XSLT *******************
		
		Author:			Matt Bradley
		Project:			RBS GPL FileBroker
		Date:			29/04/2010
		Version: 		1.0
		Desc:			Creates a FO file (for PDF) of the GPL File records
				
*********************************************-->
	<!-- keys for grouping-->
	<xsl:key name="directionkey" match="row" use="OUTBOUND"/>
	<xsl:key name="channelkey" match="row" use="concat(CHANNEL,OUTBOUND)"/>
	<xsl:key name="filekey" match="row" use="concat(DATAFLOW_ID, CHANNEL,OUTBOUND)"/>
<xsl:param name="reportstart"/>
<xsl:param name="reportend"/>
	
	<xsl:template match="*">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- defines the layout master -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first" page-height="21cm" page-width="29.7cm" margin-top="1cm" margin-bottom="2cm" margin-left="1.5cm" margin-right="1.5cm">
					<fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
					<fo:region-before extent="1.5cm"/>
					<fo:region-after extent="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!-- starts actual layout -->
			<fo:page-sequence master-reference="first">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" padding="0 0 0.2cm 0">Royal Bank of Scotland: FileBroker GPL Files Report - Page <fo:page-number></fo:page-number> of <fo:page-number-citation ref-id="last-page"></fo:page-number-citation> [Created: <xsl:value-of select="java:java.util.Date.new()"/>]</fo:block>
					
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<!-- this defines a title level 1-->
					<fo:block font-size="18pt" font-family="sans-serif" line-height="24pt" space-after.optimum="15pt" background-color="#6F8DD9" color="white" text-align="center" padding-top="3pt">
						<xsl:value-of select="'FileBroker GPL Files Report ('"/>
						<xsl:value-of select="$reportstart"/>
						<xsl:value-of select="' to '"/>
						<xsl:value-of select="$reportend"/>
						<xsl:value-of select="')'"/>
					</fo:block>
					<!-- table start -->
					<xsl:for-each select="//row[generate-id(.)=generate-id(key('directionkey', OUTBOUND)[1])]">
						<xsl:sort select="OUTBOUND"/>
						<fo:table table-layout="fixed" border-collapse="separate">
							<fo:table-column column-width="10mm"/>
							<fo:table-column column-width="40mm"/>
							<fo:table-column column-width="90mm"/>
							<fo:table-column column-width="40mm"/>
							<fo:table-column column-width="40mm"/>
							<fo:table-column column-width="35mm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell/>
									<fo:table-cell/>
									<fo:table-cell>
										<fo:block font-size="16pt" font-weight="bold" text-align="left">Direction: 
										<xsl:choose>
											<xsl:when test="number(OUTBOUND)=0">Inbound</xsl:when>
											<xsl:otherwise>Outbound</xsl:otherwise>
										</xsl:choose>
										
										
										</fo:block>
									</fo:table-cell>
									
								</fo:table-row>
	
								
								
								
									<xsl:for-each select="key('directionkey', OUTBOUND)[generate-id(.)=generate-id(key('channelkey', concat(CHANNEL,OUTBOUND)))]">
						<xsl:sort select="CHANNEL"/>
				
								<fo:table-row>
									<fo:table-cell/>
									<fo:table-cell/>
									<fo:table-cell>
										<fo:block font-size="12pt" font-weight="bold" text-align="left">Channel: 
										<xsl:value-of select="CHANNEL"/>
										</fo:block>
									</fo:table-cell>
									
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="left" font-size="10pt">#</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left" font-size="10pt">File (DataFlow) ID</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left" font-size="10pt">Filename</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="10pt">Channel Ref</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="10pt">CSID</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left" font-size="10pt">Last Modified</fo:block>
									</fo:table-cell>
								</fo:table-row>
								
								<xsl:for-each select="key('channelkey', concat(CHANNEL,OUTBOUND))[generate-id(.)=generate-id(key('filekey', concat(DATAFLOW_ID, CHANNEL,OUTBOUND)))]">
									<xsl:sort select="LAST_MODIFIED"/>
									<xsl:choose>
										<xsl:when test="(position() mod 2) =1">
											<fo:table-row>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left" font-size="8pt">
														<xsl:value-of select="position()"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="DATAFLOW_ID"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="substring(CUSTOMER_FILENAME, 1, 70)"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="center"  font-size="8pt">
														<xsl:value-of select="CHANNEL_REFERENCE"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="center"  font-size="8pt">
														<xsl:value-of select="SUBMITTER_ID"/>
													</fo:block>
												</fo:table-cell>
										
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="LAST_MODIFIED"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:when>
										<xsl:otherwise>
											<fo:table-row>
												<fo:table-cell>
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="position()"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="DATAFLOW_ID"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="substring(CUSTOMER_FILENAME, 1, 70)"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="center"  font-size="8pt">
														<xsl:value-of select="CHANNEL_REFERENCE"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="center"  font-size="8pt">
														<xsl:value-of select="SUBMITTER_ID"/>
													</fo:block>
												</fo:table-cell>
										
												<fo:table-cell>
													<fo:block text-align="left"  font-size="8pt">
														<xsl:value-of select="LAST_MODIFIED"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								
										<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="16pt" font-family="sans-serif" space-after.optimum="25pt" text-align="left" font-weight="bold"/>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="16pt" font-family="sans-serif" space-after.optimum="25pt" text-align="left" font-weight="bold"/>
									</fo:table-cell>
								</fo:table-row>
			
				
					</xsl:for-each>
								
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="16pt" font-family="sans-serif" space-after.optimum="25pt" text-align="left" font-weight="bold"/>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="16pt" font-family="sans-serif" space-after.optimum="25pt" text-align="left" font-weight="bold"/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</xsl:for-each>
					<fo:block font-size="16pt" font-family="sans-serif" space-after.optimum="25pt" text-align="left" font-weight="bold"/>
					<!-- table end -->
					<fo:block id="last-page"></fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
