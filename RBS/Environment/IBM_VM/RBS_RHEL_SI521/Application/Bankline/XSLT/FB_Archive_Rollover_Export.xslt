<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="*">
		<ExportConfiguration>
			<OutputFormatType>XML Document</OutputFormatType>
			<ExportResourcesBasedOnTagName>No</ExportResourcesBasedOnTagName>
			<ExportType>Standard</ExportType>
			<Resources>
				<Resource>
					<Name>Service_instances</Name>
					<PatternSet include="BackupService"/>
				</Resource>
			</Resources>
			<Passphrase>
				<SecurityContext>FBSystem</SecurityContext>
				<SecurityIdentity>Archive</SecurityIdentity>
				<ExportCertificate>Yes</ExportCertificate>
			</Passphrase>
		</ExportConfiguration>
	</xsl:template>
</xsl:stylesheet>
