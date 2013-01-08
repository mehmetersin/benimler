<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="description" />
<meta name="keywords" content="keywords" />
<meta name="author" content="author" />
<title>benimLerr: (beta)</title>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />

<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />



<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>


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
			<ul>
				<c:url value="/postbenimle" var="somevar" />
				<li><a href="${somevar}">Seninle Olani Benimle</a></li>
			</ul>
			<div class="clearer"></div>
		</div>
		<div id="main">
			<div class="inner_copy"></div>
			<div class="left" id="main_left">

				<div class="content">

					<form:form method="POST" action="/benimler/postingbenimle">
						<div>

							<table>

								<tr>
									<td>Neyi benimledin</td>
									<td><form:input path="title" /></td>
								</tr>

								<tr>
									<td>Açıklasana</td>
									<td><form:input path="description" /></td>
								</tr>

								<tr>
									<td>Web'deki yeri</td>
									<td><form:input path="url" /></td>
								</tr>

								<tr>
									<td>Hangi Kategoride</td>
									<td><form:input path="category" id="category" /></td>
								</tr>

								<tr>
									<td colspan="2"><input type="submit" id="searchsubmit"
										class="submit" /></td>
								</tr>

							</table>


						</div>
					</form:form>
				</div>








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







	<script type="text/javascript">
		function split(val) {
			return val.split(/,\s*/);
		}
		function extractLast(term) {
			return split(term).pop();
		}

		$(document)
				.ready(
						function() {

							$("#category")
									.autocomplete(
											{
												source : function(request,
														response) {
													
													
													
													$
															.getJSON(
																	"${pageContext. request. contextPath}/get_category_list.html",
																	{
																		term : extractLast(request.term)
																	}, response);
												},
												search : function() {
													// custom minLength
													var term = extractLast(this.value);
													if (term.length < 1) {
														return false;
													}
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},
												select : function(event, ui) {
													var terms = split(this.value);
													// remove the current input
													terms.pop();
													// add the selected item
													terms.push(ui.item.value);
													// add placeholder to get the comma-and-space at the end
													terms.push("");
													this.value = terms
															.join("");
													return false;
												}
											});

						});
	</script>



</body>
</html>

