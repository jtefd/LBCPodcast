<?xml version="1.0" encoding="iso-8859-1"?><!-- DWXMLSource="test.xml" --><!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:media="http://search.yahoo.com/mrss">
<xsl:output method="html" encoding="iso-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<title>AudioAgain - <xsl:value-of select="rss/channel/title"/></title>
<link rel="stylesheet" href="/shared/podcast.css" type="text/css"/>
</head>

<body>
<div class="banner" id="banner"><a href="http://www.audioagain.com">
  <img src="http://www.audioagain.com/shared/images/aa_logo.jpg" alt="Audio Again Logo" border="0" /></a> <span class="poweredby"><br />
</span></div>

<div id="content">


	<div  id="mainbody">
	
		<div id="channeltitle">
	
			<h1><img src="{rss/channel/itunes:image/@href}" width="100" height="100" align="right" />
			  <xsl:value-of select="rss/channel/title"/></h1>
			
			<p><xsl:value-of select="rss/channel/description" disable-output-escaping="yes"/>&nbsp;[<a href="{rss/channel/link}" target="_blank">more</a>] </p>
			  
	    </div>
		 
		 <div id="episodes">
		  
		  <h2>Latest Episodes</h2>
		  
		  <ul>
		  <xsl:for-each select="rss/channel/item">
			
			  <li><a href="{enclosure/@url}"><xsl:value-of select="title"/></a><br />
				<xsl:value-of select="description" disable-output-escaping="yes"/><br />
				<span style="font-size:xx-small; color:#999999"><xsl:value-of select="pubDate"/></span><br />
			  &nbsp;</li>
		  </xsl:for-each></ul>
	
		
	
		</div>
	
	</div>
	<div id="rightpane">
	
	  <h3>Subscribe to this feed</h3>
	  You can subscribe to this Podcast feed in a number of ways, including the following:<ul><li>Copy and paste the URL of this page into your chosen podcast software</li>
					<li>Click on the title of each episode to play in your normal media player </li>
	  </ul>										


					
		            
					<xsl:if test="system-property('xsl:vendor')='Microsoft'">
						<h4>Feed URL</h4>
						
		              		<script language="javascript" type="text/javascript">
							var url=window.location;
							document.write('<input size="30" type="text" name="textfield" value="'+ url +'"/>');
							</script>
						
					</xsl:if>
					
        <xsl:if test="system-property('xsl:vendor')='Transformiix'">					
	    </xsl:if>

					<xsl:if test="system-property('xsl:vendor')='Microsoft'">
					
					  <h4>Already have iTunes?</h4>
					
					  <script language="javascript" type="text/javascript">
						var url=window.location;
						var str_url=url.toString();
						var new_url='itpc://' + str_url.substring(7,str_url.length);
						document.write('<img src="http://www.audioagain.com/shared/images/itunes-icon.gif" align="absmiddle" /> ');
						document.write(' <a href="'+new_url+'">Click Here to Subscribe</a>');
  					  </script>
					  
					  <h4>One-click subscriptions</h4>
					

					
					If you use one of the following web-based RSS Readers, click on the appropriate button to subscribe to this podcast feed.
					
					<br/>
					<br/>
					
					<script language="javascript" type="text/javascript">
					var url=window.location;
					
					document.write('<a href="http://www.podnova.com/add.srf?url='+ url +'"><img vspace="3" border="0" alt="Add to PodNova" src="http://www.podnova.com/img_chicklet_podnova.gif" /></a> ');
					document.write('<a href="http://fusion.google.com/add?feedurl='+ url +'"><img vspace="3" border="0" alt="Add to Google" src="http://buttons.googlesyndication.com/fusion/add.gif" /></a> ');
					document.write('<a href="http://add.my.yahoo.com/rss?url='+ url +'"><img vspace="3" border="0" alt="Add to MyYahoo" src="http://us.i1.yimg.com/us.yimg.com/i/us/my/addtomyyahoo4.gif" /></a> ');
					document.write('<a href="http://odeo.com/listen/subscribe?feed='+ url +'"><img vspace="3" border="0" alt="Add to Odeo" src="http://odeo.com/img/badge-channel-black.gif" /></a> ');
					document.write('<a href="http://www.newsgator.com/ngs/subscriber/subext.aspx?url='+ url +'"><img vspace="3" border="0" alt="Add to NewsGator" src="http://www.newsgator.com/images/ngsub1.gif" /></a> ');			
					document.write('<a href="http://www.pageflakes.com/subscribe.aspx?url='+ url +'"><img vspace="3" border="0" alt="Ass to Pageflakes" src="http://www.pageflakes.com/subscribe2.gif" /></a> ');			
					</script>
	  </xsl:if>
	  
	  <h4>Podcast Software</h4>
		We recommend iTunes or Juice player to manage podcasts. Both are free to download.
	
	</div>


</div>

<div style="clear:both;"></div>

<div id="footer"><span class="poweredby">This is a podcast powered by AudioAgain.com<br />
&copy; AudioAgain is a product of Global Radio Technology</span>

</div>

</body>
</html>

</xsl:template>
</xsl:stylesheet>
