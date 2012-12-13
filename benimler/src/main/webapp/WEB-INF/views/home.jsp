<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="description" />
<meta name="keywords" content="keywords" />
<meta name="author" content="author" />
<title>benimLerr: (beta)</title>


<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />

</head>
<body>
	<div id="container">
		<div id="top">
			<div class="left">
				<h1 id="site_title">
					<img src="img/shopping.png" alt="Sample Image" height="40"
						width="40" class="left" /> benimLer
				</h1>
				<div id="site_description">Seninle olanlar...</div>
			</div>
			<a href="#" class="button feed right"><span></span></a>
			<div class="clearer"></div>
		</div>
		<div class="path" id="nav">
			<ul>
				<li><a href="#">Nedir bu benimLe !</a></li>
			</ul>
			<div class="clearer"></div>
		</div>
		<div id="main">
			<div class="inner_copy"></div>
			<div class="left" id="main_left">

				<div class="content">
					<form method="get" id="searchform" action="#">
						<div>
							<input type="text" value="" name="s" id="s" /> <input
								type="submit" id="searchsubmit" value="Search" class="submit" />
						</div>
					</form>
				</div>

				<c:forEach items="${benims}" var="benimItem">

					<div id="splash">
						<div class="container">
							<div class="post">

								<div class="body">
									<p>
										<img src="img/shopping.png" alt="Sample Image" height="20"
											width="20" class="left" /> <a href="#"><c:out
												value="${benimItem.user.name}" /></a> posted a benimLe in
										<c:out value="${benimItem.categoryId}" />
									</p>
									<img
										src="http://graph.facebook.com/<c:out value="${benimItem.userId}"/>/picture"
										alt="Sample Image" height="60" width="60" class="left" />
									<p>
										<c:out value="${benimItem.title}" />
										<c:out value="${benimItem.description}" />
									</p>

								</div>
								<div class="metadata">
									<div class="left">
										<span class="comment">
											<div class="left">
												<span class=""><a href="#">4 Comments</a></span>
											</div>
											<table>
												<tr>
													<td><img
														src="http://graph.facebook.com/<c:out value="${benimItem.id}"/>/picture"
														alt="Sample Image" height="30" width="30" class="" /></td>
													<td><a href="http://goo.gl/eD8CB"><c:out
																value="${benimItem.url}" /></a> Deneme Olsun</td>
												</tr>

											</table>
											<table>
												<tr>
													<td>
														<div class="content">
															<form method="get" id="searchform" action="#">
																<div>
																	<input type="text" value="" name="s" id="s" /> <input
																		type="submit" id="searchsubmit" value="Yorumla"
																		class="submit" />
																</div>
															</form>
														</div>
													</td>
												</tr>
											</table>


										</span>
									</div>


									<div class="clearer"></div>
								</div>
							</div>
						</div>
					</div>


				</c:forEach>




			</div>
			<div class="right" id="main_right">
				<div id="sidebar">

					<h2>Categories</h2>
					<ul class="content">
						<li><a href="#">Single Column</a> (5)</li>
						<li><a href="#">Three Columns</a> (2)</li>
						<li><a href="#">Two Columns</a> (13)</li>
					</ul>


				</div>
			</div>
			<div class="clearer"></div>
		</div>
		<div id="footer">
			<div class="left">
				<a href="#">Website.com</a> | <a href="#top">Go to top</a>
			</div>
			<div class="right">
				<a href="http://templates.arcsin.se/">Website template</a> by Arcsin
			</div>
			<center>
				Popular free web templates <a
					href="http://www.websitetemplatesonline.com" target="_blank">at
					www.WebsiteTemplatesOnline.com</a>. Impressive <a
					href="http://www.flashtemplates.com/flash-templates/"
					title="Flash Templates for Websites">Flash Templates for
					Websites</a>.
			</center>
			<div class="clearer"></div>
		</div>
	</div>
</body>
</html>

