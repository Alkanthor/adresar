<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output 
        method="html" 
        encoding="UTF-8" 
        indent="yes" 
        doctype-public="-//W3C//DTD HTML 4.01//EN" 
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

    <xsl:template match="/contacts">
        <html>
            <head>
                <style type="text/css">
                    <![CDATA[
                        body {
                            min-width: 39em;
                            margin: auto;
                            padding: 0em 2em;
                            background-color: #FFCC7F;
                            font-family: sans-serif, serif;
                            color: #000000;
                        }
                        #zahlavi {
                            position: relative;
                            top: 0em;
                            min-width: 35em;
                            max-width: 50em;
                            height: 5em;
                            margin: 0em auto;
                            padding: 1em;
                            background-color: #000000;
                            color: #FFFFFF;
                        }
                        #obsah {
                            position: relative;
                            min-width: 35em;
                            max-width: 52em;
                            margin: 0em auto;
                            padding: 1em 0em;
                            background-color: #FFF3E0;
                            color: #000000;
                        }
                        #text {
                            padding: 0em 1em;
                        }
                        a {
                            color: #807340;
                        }
                        a:hover {
                            color: #FF6600;
                        }
                        h3, h5 {
                            margin: 1.0em 0em 0em 0em;
                        }
                        
                        h3 {
                        padding:  0.5em;
                        color: #FFF3E0;
                        }
                        
                        .person-name{
                        background-color: #807340;                       
                        }
                       
                        .person-group{
                        border-style: solid;
                        border-color:#807340;
                        border-width: medium;
                        padding: 0.5em;
                        }
                       
                        div.value {
                            text-indent: 1.5em;
                        }
                        .label {
                            font-style: italic;
                        }
                    ]]>
                </style>
                <title>Kontakty</title>
            </head>
            <body>
                <div id="zahlavi">
                    <h1>Databáze kontaktů</h1>
                </div>
                <div id="obsah">
                    <div id="text">
                        <xsl:apply-templates select="*"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="person">
        <div class="person-name">
            <xsl:apply-templates select="name"/>
        </div>
        <div class="person-group">
            <div class="item-group">
                <ul>
                    <xsl:apply-templates select="email"/>
                    <xsl:apply-templates select="phone"/>
                    <xsl:apply-templates select="webpage"/>
                    <xsl:apply-templates select="other"/>
                </ul>
            </div>
            <div class="item-group">

                <ul>
                    <xsl:apply-templates select="postadress"/>
                </ul>
            </div>
            <div class="item-group">

                <xsl:if test="./note">
                    <h5>Notes:</h5>
                </xsl:if>
                <ul>
                    <xsl:apply-templates select="note"/>
                </ul>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="name">
        <h3>
            <span class="person-name">
                <xsl:value-of select="text()"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="../surname/text()"/>
            </span>
        </h3>
    </xsl:template>
    
    <xsl:template match="email">
        <li>
            <span class="item">
                email:
                <xsl:value-of select="text()"/>
            </span>
        </li>
    </xsl:template>
    
    <xsl:template match="phone">
        <li>
            <span class="item">
                phone:
                <xsl:value-of select="text()"/>
            </span>
        </li>
    </xsl:template>
    
    <xsl:template match="webpage">
        <li>
            <span class="item">
                webpage:
                <a href="{text()}">
                    <xsl:value-of select="text()"/>
                </a>
            </span>
        </li>
    </xsl:template>
    
    <xsl:template match="other">
        <li>
            <span class="item">
                <xsl:value-of select="./name/text()"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select="./userId/text()"/>
            </span>
        </li>
    </xsl:template>
    
    <xsl:template match="postadress">
        <li>
            <span class="item">
                adress:
                <xsl:value-of select="./homeNumber/text()"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="./street/text()"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="./city/text()"/>
                <xsl:text>, (</xsl:text>
                <xsl:value-of select="./street/text()"/>
                <xsl:text>)</xsl:text>
            </span>
        </li>
    </xsl:template>
    
    <xsl:template match="note">
        <li>
            <span class="item">
                <xsl:value-of select="text()"/>
            </span>
        </li>
    </xsl:template>
    
</xsl:transform>
