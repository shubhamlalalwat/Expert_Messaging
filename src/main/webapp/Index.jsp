<%-- 
    Author     : Prateek Haryani
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="ScriptsBundle">

	<title>SLICK</title>

	<!-- =-=-=-=-=-=-= Favicons Icon =-=-=-=-=-=-= -->
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<!-- =-=-=-=-=-=-= Mobile Specific =-=-=-=-=-=-= -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<!-- =-=-=-=-=-=-= Bootstrap CSS Style =-=-=-=-=-=-= -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- =-=-=-=-=-=-= Template CSS Style =-=-=-=-=-=-= -->
	<link rel="stylesheet" href="css/style.css">
	<!-- =-=-=-=-=-=-= Font Awesome =-=-=-=-=-=-= -->
	<link rel="stylesheet" href="css/font-awesome.css">
	<!-- =-=-=-=-=-=-= Et Line Fonts =-=-=-=-=-=-= -->
	<link rel="stylesheet" href="css/et-line-fonts.css">
	<!-- =-=-=-=-=-=-= Owl carousel =-=-=-=-=-=-= -->
	<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="css/owl.style.css">
	<!-- =-=-=-=-=-=-= Highliter Css =-=-=-=-=-=-= -->
	<link type="text/css" rel="stylesheet" href="css/styles/shCoreDefault.css" />
    <!-- =-=-=-=-=-=-= Css Animation =-=-=-=-=-=-= -->
    <link type="text/css" rel="stylesheet" href="css/animate.min.css" />
    <!-- =-=-=-=-=-=-= Hover Dropdown =-=-=-=-=-=-= -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap-dropdownhover.min.css" />
	<!-- JavaScripts -->
	<script src="js/modernizr.js"></script>
</head>

<body>

	<!-- =-=-=-=-=-=-= PRELOADER =-=-=-=-=-=-= -->
	<div class="preloader"><span class="preloader-gif"></span>
	</div>

	<!-- =-=-=-=-=-=-= HEADER =-=-=-=-=-=-= -->
<div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
<!------------------------------------------------- Home Button ----------------------------------------------------------------------------------------- -->	
					<li><a href="Index.jsp">Home</a>
					</li>

				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
				
				
<!-- ------------------------------------------ Login and Sign Up Button	------------------------------------------------------------------------------ -->
					<li><a href="Login.jsp"><i class="fa fa-lock" aria-hidden="true"></i>Login</a>
					</li>
					<li><a href="Customer_Register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>Signup</a>
					</li>


				</ul>
			</div>
		</div>
	</div>
</div>

	<!-- =-=-=-=-=-=-= HEADER Navigation =-=-=-=-=-=-= -->
	<div class="navbar navbar-default">
		<div class="container">

			<!-- header -->
			<div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">	<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
<!-------------------------------------------------- Logo Button ----------------------------------------------------------------------------------------------->
				<!-- logo -->
				<a href="Index.jsp" class="navbar-brand">
					<img class="img-responsive" alt="" src="images/logo.png">
				</a>

				<!-- header end -->
			</div>
			
			<!-- navigation menu -->
			<div class="navbar-collapse collapse">
			
				<!-- right bar -->
				<ul class="nav navbar-nav navbar-right">
					<li>
						<div class="btn-nav"><a href="#" class="btn btn-primary btn-small navbar-btn">Welcome in Slick</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- navigation menu end -->
			<!--/.navbar-collapse -->
		</div>
	</div>
	<!-- HEADER Navigation End -->

	<!-- =-=-=-=-=-=-= HOME =-=-=-=-=-=-= -->
	<div class="full-section search-section">
		<div class="search-area container">
			<h3 class="search-title">Have a Question?</h3>
			<p class="search-tag-line">If you have search any question you can write or enter what you are looking for!</p>
			
			
<!-- ------------------------------------------------Search Button	----------------------------------------------------------->
            <form autocomplete="off" method="get" class="search-form clearfix" id="search-form" action="db_CheckCredential.jsp">
				<input type="text" title="* Please enter a search term!" placeholder="Type your search terms here" class="search-term " autocomplete="off">
				<input type="submit" value="Search" class="search-btn">
			</form>
			

		</div>
	</div>
        	<!-- =-=-=-=-=-=-= JQUERY =-=-=-=-=-=-= -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap Core Css  -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Jquery Smooth Scroll  -->
	<script src="js/jquery.smoothscroll.js"></script>
	<!-- Jquery Easing -->
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- Jquery Counter -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Jquery Waypoints -->
	<script src="js/jquery.waypoints.js"></script>
	<!-- Jquery Appear Plugin -->
	<script src="js/jquery.appear.min.js"></script>
	<!-- Carousel Slider  -->
	<script src="js/carousel.min.js"></script>
	<!-- Jquery Parallex -->
	<script src="js/jquery.stellar.min.js"></script>
	<!--Style Switcher -->
	<script src="js/bootstrap-dropdownhover.min.js"></script>
	<!-- Include jQuery Syntax Highlighter -->
	<script type="text/javascript" src="scripts/shCore.js"></script>
	<script type="text/javascript" src="scripts/shBrushPhp.js"></script>
	<!-- Template Core JS -->
	<script src="js/custom.js"></script>
</body>
</html>