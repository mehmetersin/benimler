<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>

<title>AdviceShip</title>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="content-type"
	content="application/xhtml+xml; charset=UTF-8" />
<meta name="description" content="Site Description Here" />
<meta name="keywords" content="keywords, here" />
<meta name="robots" content="index, follow, noarchive" />
<meta name="googlebot" content="noarchive" />

<link rel="stylesheet" type="text/css" media="screen"
	href="css/screen.css" />

</head>

<body>

	<!-- wrap starts here -->
	<div id="wrap">

		<!--header -->
		<div id="header">
			<h1 id="logo-text">
				<a href="http://www.adviceship.com" title="">adviceship</a>
			</h1>
			<p id="slogan">Advice Friendship...</p>
			<div id="nav">
				<ul>
					<li class="first"><a href="http://www.adviceship.com">Home</a></li>
					<li><a href="style.html">Share Advice</a></li>
					<li><a href="archives.html">Help</a></li>

					<li><a href="http://www.adviceship.com">About</a></li>
				</ul>
			</div>
			<div id="header-image"></div>
			<!--header ends-->
		</div>

		<!-- content -->
		<div id="content-outer" class="clear">
			<div id="content-wrap">
				<div id="content">
					<div id="left">

						<form:form method="POST" modelAttribute="searchText"
							id="quick-search" action="/benimler/searchbenimle">


							<p>
								<label for="qsearch">Search:</label>
								<form:input path="text" value="Search advices..." class="tbox" />

								<input type="image" src="img/search.gif" title="Search"
									name="searchsubmit" alt="Search" class="submit">
							</p>

						</form:form>



						<div class="post no-bg">

							<c:forEach items="${benims}" var="benimItem">


								<ol class="commentlist">
									<li class="alt" id="comment-63"><cite> <img alt=""
											src="http://graph.facebook.com/<c:out value="${benimItem.userId}"/>/picture"
											class="avatar" height="40" width="40" /> <a
											href="http://www.adviceship.com">${benimItem.user.name}</a>
											share an advice in <br /> <span class="comment-data">${benimItem.category.displayText}
										</span> <br /> <span class="comment-data"><c:out
													value="${benimItem.timestamp}" /> </span>
									</cite>
										<div class="comment-text">
											<p>
												<c:out value="${benimItem.title}" />
												<c:out value="${benimItem.description}" />
											</p>
										</div></li>
									<table>
										<tbody>
											<tr>
												<th><strong>Comments</strong></th>

											</tr>
											<tr>
												<td><form:form method="POST"
														modelAttribute="searchText"
														action="/benimler/commentbenimle">

														<div>
															<form:input id="commentText"  value="Comment advice..." path="text" />
															<input id="id" name="id" type="hidden"
																value="${benimItem.id}" /> <input type="submit"
																id="commentsubmit" value="Comment" class="button" />
														</div>
													</form:form></td>
											</tr>

											<c:forEach items="${benimItem.comments}" var="ci">

												<tr>
													<td>
														<li id="comment-67"><cite> <img alt=""
																src="http://graph.facebook.com/<c:out value="${ci.userId}"/>/picture"
																class="avatar" height="40" width="40" /> <c:out
																	value="${ci.username}" /> Says: <br /> <span
																class="comment-data"> </span>

																<div class="comment-text">
																	<p>
																		<c:out value="${ci.text}" />
																	</p>
																</div>
														</cite></li>
													</td>
												</tr>

											</c:forEach>

										</tbody>
									</table>
									<div class="entry">
										<p></p>
									</div>
								</ol>

							</c:forEach>
						</div>
					</div>
					<div id="right">
						<div class="sidemenu">
							<h3>Last Advices</h3>

							<ul>

								<c:forEach items="${favBenimle}" var="favBenimle">

									<li><a href="http://www.adviceship.com"> <c:out
												value="${favBenimle.user.name} advice in ${favBenimle.title}" /></a></li>

								</c:forEach>

							</ul>

						</div>

						<div class="sidemenu">
							<h3>Last Comments</h3>

							<ul>

								<c:forEach items="${favCommentList}" var="favComment">

									<li><a href="http://www.adviceship.com"> <c:out
												value="${favComment.username} says: ${favComment.text}" /></a></li>
								</c:forEach>
							</ul>

						</div>

						<div class="sidemenu">
							<h3>Advice Categories</h3>
							<ul>

								<c:forEach items="${favCategoryList}" var="favCategory">

									<li><a href="http://www.adviceship.com"><c:out
												value="${favCategory.displayText}" /></a></li>

								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
				<!-- content end -->
			</div>

		</div>

		<!-- footer starts here -->
		<div id="footer-outer" class="clear">
			<div id="footer-wrap">
				<div class="col-a">
					<h3>Home</h3>
					<p>Home</p>
					<div class="footer-list">
						<ul>
							<li><a href="http://www.adviceship.com">Home</a></li>
						</ul>
					</div>
				</div>
				<div class="col-a">
					<h3>Share Advice</h3>
					<p>Share Advice</p>
					<div class="footer-list">
						<ul>
							<li><a href="http://www.adviceship.com">Share Advice</a></li>
						</ul>
						<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

						<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>

<title>Fresh Pick</title>

<meta http-equiv="content-type"
	content="application/xhtml+xml; charset=UTF-8" />
<meta name="author" content="root" />
<meta name="description" content="Site Description Here" />
<meta name="keywords" content="keywords, here" />
<meta name="robots" content="index, follow, noarchive" />
<meta name="googlebot" content="noarchive" />

<link rel="stylesheet" type="text/css" media="screen"
	href="css/screen.css" />

</head>


						</html>

					</div>
				</div>
				<div class="col-b">
					<h3>About</h3>
					<p>Mehmet Ersin Bitirgen</p>

				</div>
				<!-- footer ends -->
			</div>
		</div>

		<!-- footer-bottom starts -->
		<div id="footer-bottom">
			<div class="bottom-left">
				<p>
					&copy; 2011 <strong>Mehmet Ersin Bitirgen</strong>&nbsp; &nbsp;
					&nbsp; Design by <a href="http://www.adviceship.com/">Mesoft</a>
				</p>
			</div>

			<div class="bottom-right">
				<p></p>
			</div>
			<!-- footer-bottom ends -->
		</div>

		<!-- wrap ends here -->
	</div>

</body>
</html>

