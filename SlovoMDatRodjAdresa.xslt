<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html"/>

  <xsl:template match="Adresar">
    <html>
      <head>
        <title>Stalna adresa, datum rodjenja i prezime na slovo M</title>
      </head>
      <body>
        <h3>Osobe kod kojih</h3>
        <ul>
          <li>
            Godina rodjenja izmedju 1990 - 2005
          </li>
          <li>
            Prezime pocinje na slovo M
          </li>
          <li>
            Adresa im je stalna
          </li>
        </ul>
        
        
        <table style="border:2px solid black">
          <thead >
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
        <h4>Kompanije koje u svom nazivu imaju vise od 6 karaktera</h4>
        <table>
          <thead>
            <tr>
              <th rowspan="2" style="border:2px solid black">Naziv</th>
              <th colspan="4" style="border:2px solid black">Adresa</th>
              <th rowspan="2" style="border:2px solid black">Telefon</th>
              <th rowspan="2" style="border:2px solid black">Email</th>
            </tr>
            <tr>
              <th style="border:1px solid black">Ulica</th>
              <th style="border:1px solid black">Broj</th>
              <th style="border:1px solid black">Grad</th>
              <th style="border:1px solid black">Država</th>
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
    <xsl:if test="(adresa/@tip = 'stalna') and (datumRodjenja/godina &gt; 1989) and (datumRodjenja/godina &lt; 2006) and (starts-with(punoIme/prezime, 'M'))">
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
          <xsl:for-each select="punoIme/prezime">
            <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>          
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

  <xsl:template match="kompanija">
    <xsl:if test="string-length(naziv) &gt; 6">
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
