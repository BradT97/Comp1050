<?xml version="1.0"?>
<!--
	File:					styles.xsl
	
	Description
	
	Developer:				Bradley Turner
	Date of Creation:		18/10/16
	
	Last Modified:			19/10/16
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/> 
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="style.css" />
				<title>Rosella Estate - <xsl:value-of select="rooms/@type" /> suites </title>
				
			</head>
			<body>
				<div class="parallaxScroll" id="smallHeader" style="min-height:400px;"></div>
				
				<div class="middle">
					<h1 id="pageTitle"><xsl:value-of select="rooms/@type" /> suites</h1>
					<div class="navContainer">
						<ul class="navPane" id="navTop">
							<li><a href="index.html#down">Home</a></li>
							<li><a href="http://www.blogtyrant.com/best-about-us-pages/">About Us</a></li>
							<!--realisitcally this doesnt need to do anything as this page is the active page-->
							<li><a href="survey.html">Leave a Review</a></li> 
						</ul>
					</div>
					<table class="roomDisplay">
						<!-- Table displays data as shown below
							________________________________
							|				|				|
							|	room image	|	room data	|	
							_________________________________
						-->
						
						<xsl:for-each select="rooms/room">
						<xsl:sort select="name"/>
							
							<tr>
								<!-- Room image -->
								<td id="roomPhoto" style="width:35%;min-width:405px;">
									<img src="{photo_file}" alt="photo not available"></img>
								</td>
								<td>
									<!-- Room name -->
									<h3 style="margin:0;">
										<xsl:value-of select="name" /> (<xsl:value-of select="people/@capacity" /> people)
									</h3>
									
									<!-- Room cost -->
									<p style="margin-top:0;">
										$<xsl:value-of select="cost/@perNight" /> per night
										<!-- If there is an additional vineyard package - display its cost -->
										<xsl:if test="vineyardTour[@inc='yes']">
											 + $<xsl:value-of select="vineyardTour/@extraCharge"/> included vineyard tour (optional)
										</xsl:if>
									</p>
									<p>
										<xsl:value-of select="description" />
									</p>
									<p>
										Room Features:
										<ul class="inclusions">
											<xsl:choose>
												<xsl:when test="location[@story='ground']">
													<li>Located on the ground floor
														<xsl:if test="gardenAccess[@inc='yes']">
															with garden access
														</xsl:if>
													</li>
												</xsl:when>
												<xsl:when test="location[@story='floor1']">
													<li>Located on the first floor</li>
												</xsl:when>
												<xsl:when test="location[@story='floor2']">
													<li>Located on the second floor</li>
												</xsl:when>
											</xsl:choose>
											
											
											<xsl:if test="fourPostBed[@inc='yes']">
												<li>Four-post bed</li>
											</xsl:if>
											<xsl:if test="wifi[@inc='yes']">
												<li>5g Wireless Internet</li>
											</xsl:if>
											
											
										</ul>
									</p>
									<p style="margin-bottom:0;">
										Reviews of this room can be found at <a href="{guest_reviews_link}"><xsl:value-of select="guest_reviews_link"/></a>
									</p>
									<p style="margin-top:0;">
										<xsl:if test="vineyardTour[@inc='yes']">
											Optional Vineyard Tour Package: <xsl:value-of select="vineyardTour" />
										</xsl:if>
									</p>
								</td>
							</tr>
							
						</xsl:for-each>
					</table>
					
					<hr />
				</div>
				
				<!-- Creates another navigation pane at the bottom of the form again providing links  -->
				<div class="navContainer" id ="navBottom">
					<ul class="navPane">
						<li><a href="index.html#down">Home</a></li>
						<li><a href="budget.xml">Budget Suites</a></li>
						<li><a href="luxury.xml">Luxury Suites</a></li>
						<li><a href="http://www.blogtyrant.com/best-about-us-pages/">About Us</a></li>
						<li><a href="http://www.blogtyrant.com/best-contact-us-pages/">Contact</a></li>
						<li><a href="https://media.termsfeed.com/pdf/terms-and-conditions-template.pdf">Terms and Conditions</a></li>
						<li><a href="https://www.visser.com.au/blog/generic-privacy-policy-for-australian-websites/">Privacy Policy</a></li>
						
					</ul>
				</div>	
				
				<!-- Creates another strip of whitespace to mimic index.html  -->
				<div class="parallaxScroll" id="smallBottom"></div>
				
				<!-- Footer to display copyright  -->
				<div class="footer">
					<span style="vertical-align:top;padding-right:20px;font-size:12px;">&#xA9; 2016 - Bradley Turner, brad.c.turner1997@gmail.com</span>
				</div>
				
			
			
			
			</body>
		</html>
	</xsl:template>
	
	

</xsl:stylesheet>