<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- this XSL stylesheet matches the <JavacoTea> tag in an associated XML
	file and replaces it with the HTML contents of the template. -->
	<xsl:template match="/">
		<html>
		<body>
			<h2>NBA_LEAGUE</h2>
			<table border="1">
				<tr bgcolor="#9acd32">
					<th style="text-align:left">YEAR</th>
					<th style="text-align:left">Western champion</th>
					<th style="text-align:left">Coach</th>
					<th style="text-align:left">Eastern champion</th>
					<th style="text-align:left">Coach</th>
					<th style="text-align:left">PlayOffs Champion</th>
					<th style="text-align:left">Coach</th>
					<th style="text-align:left">MVP</th>
				</tr>
				<xsl:for-each select="NBA_LEAGUE/section@Eastern Conference">
				
					<td><xsl:value-of select="Winner"/></td>
					<td><xsl:value-of select="Year"/></td>
					<td><xsl:value-of select="Coach"/></td>	
				
				</xsl:for-each>
				<xsl:for-each select="NBA_LEAGUE/section@Western Conference">
				
					<td><xsl:value-of select="Winner"/></td>
					<td><xsl:value-of select="Year"/></td>
					<td><xsl:value-of select="Coach"/></td>	
				
				</xsl:for-each>
				<xsl:for-each select="NBA_LEAGUE/section@playoffs">> 
				
					<td><xsl:value-of select="Year"/></td>
					<td><xsl:value-of select="Winner"/></td>
					<td><xsl:value-of select="Coach"/></td>
					<td><xsl:value-of select="mvp"/></td>
					<td><xsl:value-of select="mvp team"/></td>
				</tr>
				</xsl:for-each>
			</table>
		</body>
		</html>
	</xsl:template>
	</xsl:stylesheet>





					
				
