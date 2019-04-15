<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

  <xsl:template match="Adresar">
    <adresar>
      <xsl:apply-templates select="osoba"/>
      <xsl:apply-templates select="kompanija"/>
    </adresar>
  </xsl:template>

  <xsl:template match="osoba">
    <osoba>
      <punoIme>
        <ime>
          <xsl:value-of select="punoIme/ime"/>
        </ime>
        <xsl:if test="boolean(punoIme/srednjeIme)">
          <srednjeIme>
            <xsl:value-of select="punoIme/srednjeIme"/>
          </srednjeIme>
        </xsl:if>        
        <xsl:for-each select="punoIme/prezime">
          <prezime>
            <xsl:value-of select="."/>
          </prezime>
        </xsl:for-each>              
      </punoIme>
      <datumRodjenja>
        <dan>
          <xsl:value-of select="datumRodjenja/dan"/>
        </dan>
        <mesec>
          <xsl:value-of select="datumRodjenja/mesec"/>
        </mesec>
        <godina>
          <xsl:value-of select="datumRodjenja/godina"/>
        </godina>
      </datumRodjenja>
      <telefon>
        <xsl:value-of select="telefon"/>
      </telefon>
      <xsl:for-each select="email">
        <email>
          <xsl:value-of select="."/>
        </email>
      </xsl:for-each>
      <xsl:apply-templates select="adresa"/>
    </osoba>
  </xsl:template>

  <xsl:template match="adresa">
    <adresa>
      <xsl:for-each select="*">
        <xsl:if test="not(local-name() = 'drzava')">
          <xsl:attribute name="{name()}">
            <xsl:value-of select="text()"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="boolean(drzava)">
        <drzava>
          <xsl:value-of select="drzava"/>
        </drzava>
      </xsl:if>
    </adresa>
  </xsl:template>

  <xsl:template match="kompanija">
    <kompanija>
      <naziv>
        <xsl:value-of select="naziv"/>
      </naziv>
      <xsl:apply-templates select="adresa"/>
      <telefon>
        <xsl:value-of select="telefon"/>
      </telefon>
      <xsl:for-each select="email">
        <email>
          <xsl:value-of select="."/>
        </email>
      </xsl:for-each>
    </kompanija>
  </xsl:template>
</xsl:stylesheet>
