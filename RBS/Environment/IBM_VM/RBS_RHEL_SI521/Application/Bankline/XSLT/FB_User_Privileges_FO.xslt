<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- keys for grouping-->
	<xsl:key name="userkey" match="row" use="USER_ID"/>
	<xsl:key name="permkey" match="row" use="concat(PERMISSION, USER_ID)"/>
	<xsl:template match="*">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- defines the layout master -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
					<fo:region-before extent="1.5cm"/>
					<fo:region-after extent="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!-- starts actual layout -->
			<fo:page-sequence master-reference="first">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" padding="0 0 0.2cm 0">Royal Bank of Scotland: User Privileges Report</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<!-- this defines a title level 1-->
					<fo:block font-size="18pt" font-family="sans-serif" line-height="24pt" space-after.optimum="15pt" background-color="#6F8DD9" color="white" text-align="center" padding-top="3pt">
						<xsl:value-of select="'User Privileges Report'"/>
					</fo:block>
					<!-- table start -->
					<xsl:for-each select="//row[generate-id(.)=generate-id(key('userkey', USER_ID)[1])]">
						<xsl:sort select="USER_ID"/>
						<fo:table table-layout="fixed" border-collapse="separate">
							<fo:table-column column-width="10mm"/>
							<fo:table-column column-width="150mm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell/>
									<fo:table-cell >
										<fo:block font-size="16pt" font-weight="bold" text-align="left">User ID: <xsl:value-of select="USER_ID"/> (<xsl:value-of select="concat(FIRST_NAME, ' ', LAST_NAME)"/>)</fo:block>
									</fo:table-cell>
									
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="left">#</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left">Permission</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:if test="number(SUPER)=1">
							
								<fo:table-row>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left">
														1
													</fo:block>
												</fo:table-cell>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left">Super User</fo:block>
												</fo:table-cell>
											</fo:table-row>
							</xsl:if>
							<xsl:if test="number(SUPER)=0">
								<xsl:for-each select="key('userkey', USER_ID)[generate-id(.)=generate-id(key('permkey', concat(PERMISSION, USER_ID)))]">
									<xsl:choose>
										<xsl:when test="(position() mod 2) =1">
											<fo:table-row>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left">
														<xsl:value-of select="position()"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell background-color="#CCCCCC">
													<fo:block text-align="left">
														<xsl:value-of select="PERMISSION"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:when>
										<xsl:otherwise>
											<fo:table-row>
												<fo:table-cell>
													<fo:block text-align="left">
														<xsl:value-of select="position()"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="left">
														<xsl:value-of select="PERMISSION"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if>
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
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>