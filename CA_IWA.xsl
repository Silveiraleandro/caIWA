<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <--!xsl code style provided by <Mikhail Timofeev> (<16 September – 02 December>) <Web applications/XML, XSL, CSS, JavaScript>Code provider can be found at https://moodle.cct.ie/ .-->
    
    <xsl:template match="/">
                <table id="menuTable" class="indent table-hover">
                    <thead>
                        <tr>
                            <th colspan="4">NBA</th>
                        </tr>
                        <tr>
                            <th>Player Position</th>
                            <th>Player Name</th>
                            <th>Player Value</th>
                            <th>Current Team</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/NBA/section">
                            <tr>
                                <td colspan="4">
                                    <xsl:value-of select="@position" />
                                </td>
                            </tr>
                            <xsl:for-each select="entree">
                                <tr id="{position()}">
                                    <xsl:attribute name="mvp">
                                        <xsl:value-of select="boolean(./@mvp)" />
                                    </xsl:attribute>
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="player" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="value" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="team" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
    </xsl:template>
</xsl:stylesheet>
