<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
			<table ID="menuTable" class="indent">
				<thead>
					<tr>
						<th colspan="3">NBA BEST</th>
					</tr>
					<tr>
						<th style="text-align:left">YEAR</th>
						<th style="text-align:left">Western champion</th>
						<th style="text-align:left">Coach</th>
						<th style="text-align:left">Eastern champion</th>
						<th style="text-align:left">Coach</th>
						<th style="text-align:left">PlayOffs Champion</th>
						<th style="text-align:left">Coach</th>
						<th style="text-align:left">MVP</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="/NBA_LEAGUE/section">
						<tr>
							<td colspan="3">
								<xsl:value-of select="@name" />
							</td>
						</tr>
																					<xsl:for-each select="entree" >
						
						<tr>
							<xsl:attribute name="playoff_schampion">
				<xsl:value-of select="@boolean(.@playoff_schampion)" />
				</xsl:attribute>
				<td align="center">
					<input name="winner0" type="checkbox" />
				</td>
				<td>
                    <xsl:value-of select="Year" />
                </td>
				<td align="right">
                    <xsl:value-of select="Winner" />
                </td>
				<td align="right">
                    <xsl:value-of select="Coach" />
                </td>
				<td align="right">
                    <xsl:value-of select="mvp" />
                </td>
				<td align="right">
                    <xsl:value-of select="mvp_team" />
                </td>
			</tr>
		</xsl:for-each>
	</xsl:for-each>
	</tbody>
	</table>
	</xsl:template>
	</xsl:stylesheet>
