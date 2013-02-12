

<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" class="en">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdviceShip / Hoşgeldiniz</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">


<link rel="stylesheet" type="text/css" href="img/join_5bc5f261.css">

<link REL="SHORTCUT ICON" HREF="img/favicon.ico">


<script type="text/javascript">
	window.main = function() {
		$(function() {
			P.Join.Terms.setup();

		});
	};
</script>

<script type="text/javascript" async="" src="img/ga.js"></script>
</head>
<body class="loaded"
	onload="$(&#39;body&#39;).addClass(&#39;loaded&#39;)">

	<div id="SignUp" class="logo_exp">

		<div class="education logo">
			<p>Hoşgeldiniz</p>
			<img src="img/benimler-logo.png">
		</div>

		<div class="wrapper">
			<div class="shadow"></div>
			<div class="content">
				<div class="header">

					<div class="getStarted"></div>

					<h1>adviceship keşfi için hesabınızı oluşturun.</h1>

				</div>

				<div class="intermission">
					<h2 class="text"></h2>
				</div>
				<ul class="buttons">
					<li>

						<form action="<c:url value="/signin/facebook" />" method="POST">
							<button class="BigButton facebook" type="submit">Facebook
								ile bağlan</button>
							<input type="hidden" name="scope"
								value="email,publish_stream,offline_access" />
						</form>


					</li>

				</ul>



				<div class="footer">

					<h2 class="login">
						<span>...... </span>
					</h2>

					<iframe src="http://player.vimeo.com/video/58311719" width="500"
						height="281" frameborder="0" webkitAllowFullScreen
						mozallowfullscreen allowFullScreen></iframe>
					<p>
						<a href="http://vimeo.com/58311719">AdviceShip Tanıtım</a> from <a
							href="http://vimeo.com/user15889617">Mehmet Ersin Bitirgen</a> on
						<a href="http://vimeo.com">Vimeo</a>.
					</p>


				</div>

			</div>
		</div>
	</div>

	<div id="Loading"></div>


	<script type="text/javascript" src="img/jquery-1.7.1.min.js"></script>

	<script>
		var weakPasswords = [ "pinterest", "password", "123456", "welcome ",
				"ninja", "abc123", "123456789", "12345678", "sunshine",
				"princess", "qwerty", "master", "michael", "jordan", "dragon",
				"soccer", "killer", "pepper", "devil", "princess", "1234567",
				"iloveyou" ]
		var passStrengthOpts = {
			userid : "",
			shortPassStr : 'Please use at least 6 characters',
			blackPassStr : 'Password too common',
			badPassStr : 'Weak Password',
			goodPassStr : 'OK',
			strongPassStr : 'Great!',
			samePasswordStr : 'Username and password identical',
			badPassStyle : "bad_password",
			goodPassStyle : "ok_password",
			strongPassStyle : "strong_password"
		};
		$(document).ready(
				function() {
					var passStrengthElem = $(".strength_validated_password")
					if (passStrengthElem.length != 0) {
						passStrengthElem.passStrength($(".submit_button_id"),
								$("#password_validation_msg"), weakPasswords,
								passStrengthOpts);
					}
				});
	</script>

	<script type="text/javascript" src="img/bundle_join_36b8e3ba.js"></script>

	<script type="text/javascript">
		function filtered_gaq_push_pageview() {
			cur_url = document.URL;

			if (!cur_url.match(/email=/)) {
				_gaq.push([ '_trackPageview' ]);
			}
		}

		function trackGAEvent(category, action, label, value) {
			_gaq = _gaq || []

			// Event
			_gaq.push([ '_trackEvent', category, action, label, value ]);

			// Virtual Page
			virtual_page = '_event_';
			virtual_page += "/" + category;

			if (!action)
				action = '_';
			virtual_page += "/" + action;
			if (label)
				virtual_page += "/" + label;

			_gaq.push([ '_trackPageview', virtual_page ]);

		}

		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-12967896-1' ]);
		_gaq.push([ '_setCustomVar', 1, 'is_logged_in', 'logged out', 2 ]);
		_gaq.push([ '_setCustomVar', 2, 'page_name', 'register_landing', 1 ]);

		filtered_gaq_push_pageview();

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			(document.getElementsByTagName('head')[0] || document
					.getElementsByTagName('body')[0]).appendChild(ga);
		})();
	</script>


	<script type="text/javascript">
		$(document).ready(function() {

			if (top != self) {
				$('body').html('<h1>Unauthorized</h1>')
			}
		});
	</script>

	<script type="text/javascript">
		(function() {
			var footer = new Image();
			footer.src = '/_ch/bwxtkie5';
		})();
	</script>




	<div id="TermsDialog" class="ModalContainer">
		<div class="modal wide">
			<div class="header lg">
				<a href="https://pinterest.com/join/signup/#" class="close"><strong>Close</strong>
					<span></span></a>
				<h2></h2>
			</div>
			<div class="body"></div>
		</div>
	</div>
</body>
</html>