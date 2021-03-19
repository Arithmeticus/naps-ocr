<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:a="http://www.abbyy.com/FineReader_xml/FineReader6-schema-v1.xml"
   version="3.0">
   
   <xsl:output indent="yes"/>
   
   <xsl:mode default-mode="#unnamed" on-no-match="shallow-copy"/>
   
   <xsl:template match="LINE | PARAGRAPH | PAGECOLUMN | REGION | a:par | a:line" mode="#default abbyy">
      <xsl:apply-templates mode="#current"/>
      <xsl:value-of select="'&#xa;'"/>
   </xsl:template>
   
   <xsl:template match="text()[not(matches(., '\S'))]" mode="#default abbyy"/>
   
   <xsl:template match="WORD">
      <xsl:value-of select=". || ' '"/>
   </xsl:template>
   
   <xsl:template match="/a:*">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="abbyy"/>
      </xsl:copy>
   </xsl:template>
   
   <xsl:mode name="abbyy" on-no-match="text-only-copy"/>
   
   <xsl:template match="a:page" mode="abbyy">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="a:charParams" mode="abbyy">
      <xsl:value-of select="."/>
   </xsl:template>
   
   
   
</xsl:stylesheet>