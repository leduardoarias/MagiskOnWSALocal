<?xml version="1.0" encoding="utf-8"?>
<!--
  APA 7 (Microsoft Word Bibliography Engine) - Custom Style
  Target: Microsoft Word for Microsoft 365 bibliography/citation XSL loader.

  Design goals:
  1) Be loadable by Word as a custom bibliography style.
  2) Stay within native Word bibliography source fields and source types.
  3) Approximate APA 7th edition formatting as closely as Word's engine allows.

  IMPORTANT LIMITATION NOTE:
  Word's bibliography engine exposes a fixed source model and does not provide full CSL-like
  control (e.g., deep locale rules, robust sentence-case conversion, conditional date grammars
  for every type, and complete APA 7 edge-case coverage). Known limitations are documented inline.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography"
  exclude-result-prefixes="msxsl b">

  <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes"/>
  <xsl:strip-space elements="*"/>

  <!-- Root dispatcher -->
  <xsl:template match="/">
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <!-- Optional style metadata for Word loader -->
  <xsl:template match="b:Version">
    <xsl:text>2026.03.30</xsl:text>
  </xsl:template>

  <xsl:template match="b:StyleName">
    <xsl:text>APA 7 (Custom M365)</xsl:text>
  </xsl:template>

  <!-- Localized style label shown in References > Style -->
  <xsl:template match="b:StyleNameLocalized">
    <xsl:choose>
      <xsl:when test="b:Lcid='1033'">
        <xsl:text>APA 7 (Custom M365)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>APA 7 (Custom M365)</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    Important fields shown in compact source editor (collapsed mode).
    We keep this conservative to improve data quality for supported types.
  -->
  <xsl:template match="b:GetImportantFields[b:SourceType='Book']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Author/b:Author/b:Corporate</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Publisher</b:ImportantField>
      <b:ImportantField>b:Edition</b:ImportantField>
      <b:ImportantField>b:DOI</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <xsl:template match="b:GetImportantFields[b:SourceType='JournalArticle']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Author/b:Author/b:Corporate</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:JournalName</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Volume</b:ImportantField>
      <b:ImportantField>b:Issue</b:ImportantField>
      <b:ImportantField>b:Pages</b:ImportantField>
      <b:ImportantField>b:DOI</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <xsl:template match="b:GetImportantFields[b:SourceType='BookSection']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:BookTitle</b:ImportantField>
      <b:ImportantField>b:Editor/b:Editor/b:NameList</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Pages</b:ImportantField>
      <b:ImportantField>b:Publisher</b:ImportantField>
      <b:ImportantField>b:DOI</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <xsl:template match="b:GetImportantFields[b:SourceType='Report']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Author/b:Author/b:Corporate</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Institution</b:ImportantField>
      <b:ImportantField>b:Number</b:ImportantField>
      <b:ImportantField>b:DOI</b:ImportantField>
      <b:ImportantField>b:URL</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <xsl:template match="b:GetImportantFields[b:SourceType='WebSite']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Author/b:Author/b:Corporate</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Month</b:ImportantField>
      <b:ImportantField>b:Day</b:ImportantField>
      <b:ImportantField>b:URL</b:ImportantField>
      <b:ImportantField>b:YearAccessed</b:ImportantField>
      <b:ImportantField>b:MonthAccessed</b:ImportantField>
      <b:ImportantField>b:DayAccessed</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <xsl:template match="b:GetImportantFields[b:SourceType='DocumentFromInternetSite']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Author/b:Author/b:Corporate</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Month</b:ImportantField>
      <b:ImportantField>b:Day</b:ImportantField>
      <b:ImportantField>b:URL</b:ImportantField>
      <b:ImportantField>b:YearAccessed</b:ImportantField>
      <b:ImportantField>b:MonthAccessed</b:ImportantField>
      <b:ImportantField>b:DayAccessed</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <xsl:template match="b:GetImportantFields[b:SourceType='ConferenceProceedings']">
    <b:ImportantFields>
      <b:ImportantField>b:Author/b:Author/b:NameList</b:ImportantField>
      <b:ImportantField>b:Title</b:ImportantField>
      <b:ImportantField>b:ConferenceName</b:ImportantField>
      <b:ImportantField>b:Year</b:ImportantField>
      <b:ImportantField>b:Pages</b:ImportantField>
      <b:ImportantField>b:Publisher</b:ImportantField>
      <b:ImportantField>b:DOI</b:ImportantField>
      <b:ImportantField>b:URL</b:ImportantField>
    </b:ImportantFields>
  </xsl:template>

  <!-- Sort bibliography by author/corporate, year, title -->
  <xsl:template match="b:Sort">
    <b:Sort>
      <b:SortKey>b:Author/b:Author/b:NameList/b:Person/b:Last</b:SortKey>
      <b:SortKey>b:Author/b:Author/b:Corporate</b:SortKey>
      <b:SortKey>b:Year</b:SortKey>
      <b:SortKey>b:Title</b:SortKey>
    </b:Sort>
  </xsl:template>

  <!-- Bibliography output container -->
  <xsl:template match="b:Bibliography">
    <html xmlns="http://www.w3.org/TR/REC-html40">
      <body>
        <xsl:apply-templates select="b:Source">
          <xsl:sort select="b:Author/b:Author/b:NameList/b:Person[1]/b:Last" data-type="text"/>
          <xsl:sort select="b:Author/b:Author/b:Corporate" data-type="text"/>
          <xsl:sort select="b:Year" data-type="text"/>
          <xsl:sort select="b:Title" data-type="text"/>
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <!-- Generic bibliography source dispatcher -->
  <xsl:template match="b:Source">
    <p>
      <xsl:choose>
        <xsl:when test="b:SourceType='Book'">
          <xsl:call-template name="render-book"/>
        </xsl:when>
        <xsl:when test="b:SourceType='JournalArticle'">
          <xsl:call-template name="render-journal-article"/>
        </xsl:when>
        <xsl:when test="b:SourceType='BookSection'">
          <xsl:call-template name="render-book-section"/>
        </xsl:when>
        <xsl:when test="b:SourceType='Report'">
          <xsl:call-template name="render-report"/>
        </xsl:when>
        <xsl:when test="b:SourceType='WebSite'">
          <xsl:call-template name="render-website"/>
        </xsl:when>
        <xsl:when test="b:SourceType='DocumentFromInternetSite'">
          <xsl:call-template name="render-document-from-internet"/>
        </xsl:when>
        <xsl:when test="b:SourceType='ConferenceProceedings'">
          <xsl:call-template name="render-conference-proceedings"/>
        </xsl:when>
        <xsl:otherwise>
          <!-- Fallback for unsupported source types -->
          <xsl:call-template name="render-author-or-title-fallback"/>
          <xsl:text> </xsl:text>
          <xsl:call-template name="render-date-parenthesized"/>
          <xsl:text> </xsl:text>
          <i><xsl:value-of select="b:Title"/></i>
          <xsl:text>.</xsl:text>
          <xsl:call-template name="render-doi-or-url-suffix"/>
        </xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:template>

  <!--
    Citation output for in-text citation(s).

    IMPORTANT COMPATIBILITY DECISION:
    In Word, citation grouping/punctuation around the full citation cluster can be managed by the
    citation engine itself. If this template injects parentheses directly, grouped citations may
    become duplicated like: (Author, 2020)(Other, 2021).

    Therefore this style renders only the internal citation text (author, year and separators),
    and leaves outer punctuation to Word.
  -->
  <xsl:template match="b:Citation">
    <html xmlns="http://www.w3.org/TR/REC-html40">
      <body>
        <xsl:apply-templates select="b:Source" mode="citation-entry"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="b:Source" mode="citation-entry">
    <xsl:if test="position() &gt; 1">
      <xsl:text>; </xsl:text>
    </xsl:if>
    <xsl:call-template name="render-citation-author-short"/>
    <xsl:text>, </xsl:text>
    <xsl:call-template name="render-year-short"/>
  </xsl:template>

  <!-- ==================== TYPE RENDERERS ==================== -->

  <xsl:template name="render-book">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <i>
      <xsl:call-template name="render-title-with-subtitle"/>
    </i>
    <xsl:if test="string-length(normalize-space(b:Edition)) &gt; 0">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="normalize-space(b:Edition)"/>
      <xsl:text> ed.)</xsl:text>
    </xsl:if>
    <xsl:text>. </xsl:text>
    <xsl:value-of select="normalize-space(b:Publisher)"/>
    <xsl:text>.</xsl:text>
    <xsl:call-template name="render-doi-or-url-suffix"/>
  </xsl:template>

  <xsl:template name="render-journal-article">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-title-with-subtitle"/>
    <xsl:text>. </xsl:text>
    <i><xsl:value-of select="normalize-space(b:JournalName)"/></i>
    <xsl:if test="string-length(normalize-space(b:Volume)) &gt; 0">
      <xsl:text>, </xsl:text>
      <i><xsl:value-of select="normalize-space(b:Volume)"/></i>
    </xsl:if>
    <xsl:if test="string-length(normalize-space(b:Issue)) &gt; 0">
      <xsl:text>(</xsl:text>
      <xsl:value-of select="normalize-space(b:Issue)"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="string-length(normalize-space(b:Pages)) &gt; 0">
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(b:Pages)"/>
    </xsl:if>
    <xsl:text>.</xsl:text>
    <xsl:call-template name="render-doi-or-url-suffix"/>
  </xsl:template>

  <xsl:template name="render-book-section">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-title-with-subtitle"/>
    <xsl:text>. In </xsl:text>
    <xsl:call-template name="render-editors"/>
    <xsl:if test="string-length(normalize-space(b:BookTitle)) &gt; 0">
      <xsl:text> (</xsl:text>
      <i><xsl:value-of select="normalize-space(b:BookTitle)"/></i>
      <xsl:if test="string-length(normalize-space(b:Pages)) &gt; 0">
        <xsl:text>, pp. </xsl:text>
        <xsl:value-of select="normalize-space(b:Pages)"/>
      </xsl:if>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:text>. </xsl:text>
    <xsl:value-of select="normalize-space(b:Publisher)"/>
    <xsl:text>.</xsl:text>
    <xsl:call-template name="render-doi-or-url-suffix"/>
  </xsl:template>

  <xsl:template name="render-report">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <i><xsl:call-template name="render-title-with-subtitle"/></i>
    <xsl:if test="string-length(normalize-space(b:Number)) &gt; 0">
      <xsl:text> (Report No. </xsl:text>
      <xsl:value-of select="normalize-space(b:Number)"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:text>. </xsl:text>
    <xsl:if test="string-length(normalize-space(b:Institution)) &gt; 0">
      <xsl:value-of select="normalize-space(b:Institution)"/>
      <xsl:text>.</xsl:text>
    </xsl:if>
    <xsl:call-template name="render-doi-or-url-suffix"/>
  </xsl:template>

  <xsl:template name="render-website">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <i><xsl:call-template name="render-title-with-subtitle"/></i>
    <xsl:text>. </xsl:text>
    <xsl:call-template name="render-url-only"/>
  </xsl:template>

  <xsl:template name="render-document-from-internet">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-title-with-subtitle"/>
    <xsl:text>. </xsl:text>
    <xsl:call-template name="render-url-only"/>
  </xsl:template>

  <xsl:template name="render-conference-proceedings">
    <xsl:call-template name="render-author-or-title-fallback"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-date-parenthesized"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="render-title-with-subtitle"/>
    <xsl:text>. In </xsl:text>
    <i><xsl:value-of select="normalize-space(b:ConferenceName)"/></i>
    <xsl:if test="string-length(normalize-space(b:Pages)) &gt; 0">
      <xsl:text> (pp. </xsl:text>
      <xsl:value-of select="normalize-space(b:Pages)"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:text>. </xsl:text>
    <xsl:if test="string-length(normalize-space(b:Publisher)) &gt; 0">
      <xsl:value-of select="normalize-space(b:Publisher)"/>
      <xsl:text>.</xsl:text>
    </xsl:if>
    <xsl:call-template name="render-doi-or-url-suffix"/>
  </xsl:template>

  <!-- ==================== COMMON HELPERS ==================== -->

  <!--
    Author rendering:
    - Corporate author preferred if present.
    - Else render person list as "Last, F. M., Last, F. M., & Last, F. M."
    - APA 7 reference list rule supports up to 20 authors before ellipsis.

    LIMITATION:
    Word source model can carry many names, but XSLT 1.0 engine in Word and practical maintainability
    make full 20+ellipsis handling verbose. This style uses a stable approximation:
    render all provided names joined by comma and ampersand before the final author.
    Impact: entries with >20 authors will not automatically collapse with ellipsis per strict APA 7.
  -->
  <xsl:template name="render-author-or-title-fallback">
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(b:Author/b:Author/b:Corporate)) &gt; 0">
        <xsl:value-of select="normalize-space(b:Author/b:Author/b:Corporate)"/>
        <xsl:text>.</xsl:text>
      </xsl:when>
      <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) &gt; 0">
        <xsl:for-each select="b:Author/b:Author/b:NameList/b:Person">
          <xsl:call-template name="render-person-name"/>
          <xsl:choose>
            <xsl:when test="position() = last()">
              <xsl:text>.</xsl:text>
            </xsl:when>
            <xsl:when test="position() = last() - 1">
              <xsl:text>, &amp; </xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>, </xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <!-- APA 7: if no author, title moves to author position. -->
        <i><xsl:call-template name="render-title-with-subtitle"/></i>
        <xsl:text>.</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="render-person-name">
    <xsl:value-of select="normalize-space(b:Last)"/>
    <xsl:if test="string-length(normalize-space(b:First)) &gt; 0 or string-length(normalize-space(b:Middle)) &gt; 0">
      <xsl:text>, </xsl:text>
      <xsl:if test="string-length(normalize-space(b:First)) &gt; 0">
        <xsl:value-of select="substring(normalize-space(b:First),1,1)"/>
        <xsl:text>.</xsl:text>
      </xsl:if>
      <xsl:if test="string-length(normalize-space(b:Middle)) &gt; 0">
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring(normalize-space(b:Middle),1,1)"/>
        <xsl:text>.</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- Editors for BookSection -->
  <xsl:template name="render-editors">
    <xsl:choose>
      <xsl:when test="count(b:Editor/b:Editor/b:NameList/b:Person) &gt; 0">
        <xsl:for-each select="b:Editor/b:Editor/b:NameList/b:Person">
          <xsl:call-template name="render-person-name"/>
          <xsl:choose>
            <xsl:when test="position() = last()">
              <xsl:text> (Ed.).</xsl:text>
            </xsl:when>
            <xsl:when test="position() = last() - 1">
              <xsl:text>, &amp; </xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>, </xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>(Ed.).</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Date formatter for bibliography -->
  <xsl:template name="render-date-parenthesized">
    <xsl:text>(</xsl:text>
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(b:Year)) &gt; 0">
        <xsl:value-of select="normalize-space(b:Year)"/>
        <xsl:if test="string-length(normalize-space(b:Month)) &gt; 0">
          <xsl:text>, </xsl:text>
          <xsl:value-of select="normalize-space(b:Month)"/>
          <xsl:if test="string-length(normalize-space(b:Day)) &gt; 0">
            <xsl:text> </xsl:text>
            <xsl:value-of select="normalize-space(b:Day)"/>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>n.d.</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>).</xsl:text>
  </xsl:template>

  <!-- Title + subtitle with simple punctuation normalization -->
  <xsl:template name="render-title-with-subtitle">
    <!--
      LIMITATION:
      APA 7 requires sentence case for many title contexts, but Word does not expose
      robust locale-aware case conversion suitable for all languages/scripts in XSLT 1.0.
      We therefore output title/subtitle as entered in source metadata.
      Impact: user must enter sentence case manually where required.
    -->
    <xsl:value-of select="normalize-space(b:Title)"/>
    <xsl:if test="string-length(normalize-space(b:ShortTitle)) &gt; 0 and not(contains(normalize-space(b:Title), ':'))">
      <xsl:text>: </xsl:text>
      <xsl:value-of select="normalize-space(b:ShortTitle)"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="render-doi-or-url-suffix">
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(b:DOI)) &gt; 0">
        <xsl:text> https://doi.org/</xsl:text>
        <xsl:value-of select="normalize-space(b:DOI)"/>
      </xsl:when>
      <xsl:when test="string-length(normalize-space(b:URL)) &gt; 0">
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(b:URL)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="render-url-only">
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(b:URL)) &gt; 0">
        <xsl:value-of select="normalize-space(b:URL)"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- No URL available; keep punctuation stable. -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Citation short author -->
  <xsl:template name="render-citation-author-short">
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(b:Author/b:Author/b:Corporate)) &gt; 0">
        <xsl:value-of select="normalize-space(b:Author/b:Author/b:Corporate)"/>
      </xsl:when>
      <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) = 1">
        <xsl:value-of select="normalize-space(b:Author/b:Author/b:NameList/b:Person[1]/b:Last)"/>
      </xsl:when>
      <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) = 2">
        <xsl:value-of select="normalize-space(b:Author/b:Author/b:NameList/b:Person[1]/b:Last)"/>
        <xsl:text> &amp; </xsl:text>
        <xsl:value-of select="normalize-space(b:Author/b:Author/b:NameList/b:Person[2]/b:Last)"/>
      </xsl:when>
      <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) &gt; 2">
        <!-- APA 7 in-text: 3+ authors => FirstAuthor et al. -->
        <xsl:value-of select="normalize-space(b:Author/b:Author/b:NameList/b:Person[1]/b:Last)"/>
        <xsl:text> et al.</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(b:Title)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="render-year-short">
    <xsl:choose>
      <xsl:when test="string-length(normalize-space(b:Year)) &gt; 0">
        <xsl:value-of select="normalize-space(b:Year)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>n.d.</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Suppress stray text nodes -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
