<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

    <xsl:template match="Adresar">
      <html>
        <head>
          <title>Email</title>
        </head>
        <body>
          <h4>Osobe koje sadrže više od dve email adrese:</h4>
          <table style="border:2px solid black">
            <thead>
              <tr>
                <th colspan="3" style="border:2px solid black">Puno ime</th>
                <th colspan="3" style="border:2px solid black">Datum rođenja</th>
                <th colspan="4" style="border:2px solid black">Adresa</th>
                <th rowspan="2" style="border:2px solid black">Telefon</th>
                <th rowspan="2" style="border:2px solid black">Email</th>
              </tr>
              <tr>
                <th style="border:2px solid black">Ime</th>
                <th style="border:2px solid black">Srednje ime</th>
                <th style="border:2px solid black">Prezime</th>
                <th style="border:2px solid black">Dan</th>
                <th style="border:2px solid black">Mesec</th>
                <th style="border:2px solid black">Godina</th>
                <th style="border:2px solid black">Ulica</th>
                <th style="border:2px solid black">Broj</th>
                <th style="border:2px solid black">Grad</th>
                <th style="border:2px solid black">Država</th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="osoba"/>
            </tbody>
          </table>
          <h4>Kompanije koje sadrže više od dve email adrese:</h4>
          <table style="border:2px solid black">
            <thead>
              <tr>
                <th rowspan="2" style="border:2px solid black">Naziv</th>
                <th colspan="4" style="border:2px solid black">Adresa</th>
                <th rowspan="2" style="border:2px solid black">Telefon</th>
                <th rowspan="2" style="border:2px solid black">Email</th>
              </tr>
              <tr>
                <th style="border:2px solid black">Ulica</th>
                <th style="border:2px solid black">Broj</th>
                <th style="border:2px solid black">Grad</th>
                <th style="border:2px solid black">Država</th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="kompanija"/>
            </tbody>
          </table>
        </body>
      </html>
    </xsl:template>

  <xsl:template match="osoba">
    <xsl:if test="count(email) &gt; 2">
      <tr>
        <td data-column="Ime" style="border:1px solid black">
          <xsl:value-of select="punoIme/ime"/>
        </td>
        <td data-column="Srednje ime" style="border:1px solid black; text-align:center">
          <xsl:choose>
            <xsl:when test="boolean(punoIme/srednjeIme)">
              <xsl:value-of select="punoIme/srednjeIme"/>
            </xsl:when>
            <xsl:otherwise>
              /
            </xsl:otherwise>
          </xsl:choose>          
        </td>
        <td data-column="Prezime" style="border:1px solid black">
          <xsl:value-of select="punoIme/prezime"/>
        </td>
        <td data-column="Dan" style="border:1px solid black">
          <xsl:value-of select="datumRodjenja/dan"/>
        </td>
        <td data-column="Mesec" style="border:1px solid black">
          <xsl:value-of select="datumRodjenja/mesec"/>
        </td>
        <td data-column="Godina" style="border:1px solid black">
          <xsl:value-of select="datumRodjenja/godina"/>
        </td>
        <td data-column="Ulica" style="border:1px solid black">
          <xsl:value-of select="adresa/ulica"/>
        </td>
        <td data-column="Broj" style="border:1px solid black">
          <xsl:value-of select="adresa/broj"/>
        </td>
        <td data-column="Grad" style="border:1px solid black">
          <xsl:value-of select="adresa/grad"/>
        </td>
        <td data-column="Država" style="border:1px solid black">
          <xsl:choose>
            <xsl:when test="boolean(adresa/drzava)">
              <xsl:value-of select="adresa/drzava"/>
            </xsl:when>
            <xsl:otherwise>
              /
            </xsl:otherwise>
          </xsl:choose>          
        </td>
        <td data-column="Telefon" style="border:1px solid black">
          <xsl:value-of select="telefon"/>
        </td>
        <td data-column="Email" style="border:1px solid black">
          <xsl:for-each select="email">
            <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>          
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="kompanija">
    <xsl:if test="count(email) &gt; 2">
      <tr>
        <td data-column="Naziv" style="border:1px solid black">
          <xsl:value-of select="naziv"/>
        </td>
        <td data-column="Ulica" style="border:1px solid black">
          <xsl:value-of select="adresa/ulica"/>
        </td>
        <td data-column="Broj" style="border:1px solid black">
          <xsl:value-of select="adresa/broj"/>
        </td>
        <td data-column="Grad" style="border:1px solid black">
          <xsl:value-of select="adresa/grad"/>
        </td>        
        <td data-column="Država" style="border:1px solid black; text-align:center">
          <xsl:choose>
            <xsl:when test="boolean(adresa/drzava)">
              <xsl:value-of select="adresa/drzava"/>
            </xsl:when>
            <xsl:otherwise>
              /
            </xsl:otherwise>
          </xsl:choose>          
        </td>
        <td data-column="Telefon" style="border:1px solid black">
          <xsl:value-of select="telefon"/>
        </td>
        <td data-column="Email" style="border:1px solid black">
          <xsl:for-each select="email">
            <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
