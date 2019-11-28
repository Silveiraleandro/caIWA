<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
                <table id="menuTable" class="indent table-hover">
                    <thead>
                        <tr>
                            <th colspan="3">NBA</th>
                        </tr>
                        <tr>
                            <th>Player Position</th>
                            <th>Player Name</th>
                            <th>Player Value</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/NBA/section">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@position" />
                                </td>
                            </tr>
                            <xsl:for-each select="entree">
                                <tr>
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
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
    </xsl:template>
</xsl:stylesheet>
