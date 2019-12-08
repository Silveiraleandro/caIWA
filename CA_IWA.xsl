<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <--!xsl code style provided by <Mikhail Timofeev> (<16 September – 02 December>) <Web applications/XML, XSL, CSS, JavaScript>Code provider can be found at https://moodle.cct.ie/ .-->
    <!--this file will convert the xml document into html-->
    <xsl:template match="/"> <!--starting from the root element-->
                <table id="menuTable" class="indent table-hover"> <!-- giving an id to the table and setting a hover on it-->
                    <thead>
                        <tr>
                            <th colspan="4">NBA</th> <!--defining the number of columns of the table-->
                        </tr>
                        <tr> <!-- the four attributes of the table-->
                            <th>Player Position</th>
                            <th>Player Name</th>
                            <th>Player Value</th>
                            <th>Current Team</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/NBA/section"> <!--selecting from each section from the root-->
                            <tr>
                                <td colspan="4">
                                    <xsl:value-of select="@position" /> <!-- from each section "position" -->
                                </td>
                            </tr>
                            <xsl:for-each select="entree">  <!--from each container entree-->
                                <tr id="{position()}"> <!-- set the id position-->
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
