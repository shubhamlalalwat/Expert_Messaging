<%-- 
    Author     : Prateek Haryani
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE htmll>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="ScriptsBundle">
  <title>Admin Page</title>
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
  <link type="text/css" rel="Stylesheet" href="css/styles/shCoreDefault.css" />
  <!-- =-=-=-=-=-=-= Css Animation =-=-=-=-=-=-= -->
  <link type="text/css" rel="stylesheet" href="css/animate.min.css" />
  <!-- =-=-=-=-=-=-= Hover Dropdown =-=-=-=-=-=-= -->
  <link type="text/css" rel="stylesheet" href="css/bootstrap-dropdownhover.min.css" />
  <!-- JavaScripts -->
  <script src="js/modernizr.js"></script>

</head>

<body>

        <%
            
            String id = (String)session.getAttribute("adminID");
                    if(id==null)
                    {
                    	out.println("<script>");
                        out.write("setTimeout(function(){window.location.href='Login.jsp'},500);");
                        out.println("</script>");
                    }
		%>


	<!-- =-=-=-=-=-=-= HEADER =-=-=-=-=-=-= -->
<div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
					<li><a href="Admin_Index.jsp">Home</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					<li><a href="Admin_AddCategories.jsp"><i aria-hidden="true"></i><b>Add Categories</b></a>
					</li>
					<li><a href="Admin_ExpertRegister.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>Expert Register</a>
					</li>
					<li><a href="Logout.jsp"><i class="icon-lock"></i> Logout</a></li>
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
				<!-- logo -->
				<a href="Admin_Index.jsp" class="navbar-brand">
					<img class="img-responsive" alt="" src="images/logo.png">
				</a>
				<!-- header end -->
			</div>
		</div>
	</div>
	<!-- HEADER Navigation End -->
	<!-- =-=-=-=-=-=-= HOME =-=-=-=-=-=-= -->
        <div class="full-section search-section">
	</div>
	<!-- =-=-=-=-=-=-= HOME END =-=-=-=-=-=-= -->
		<!-- =-=-=-=-=-=-= Latest Questions  =-=-=-=-=-=-= -->
		<section class="white question-tabs padding-bottom-80" id="latest-post">
			<div class="container">
				<div class="row">
					<!-- Content Area Bar -->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<!-- Tabs -->
								<ul class="nav panel-tabs">
									<li  class="active">
									 <a data-toggle="tab" href="#tab1"><i class="icofont icon-layers"></i><span class="hidden-xs">Show Customer List</span></a> 
									</li>
									<li> <a data-toggle="tab" href="#tab2"><i class="icofont icon-layers"></i><span class="hidden-xs">Show Expert List</span></a> 
									</li>
									<li> <a data-toggle="tab" href="#tab3"><i class="icofont icon-global"></i><span class="hidden-xs">Show All Expert Incidents </span></a> 
									</li>
									<li> <a data-toggle="tab" href="#tab4"><i class="icofont icon-global"></i><span class="hidden-xs">Show All Customer Incidents</span></a> 
									</li>
									<li> <a data-toggle="tab" href="#tab5"><i class="icofont icon-global"></i><span class="hidden-xs">Show All Categories</span></a> 
									</li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div id="tab1" class="tab-pane active">
                                 <iframe height="500px" width="100%" src="Admin_AllCustomers.jsp" style="border: 2px solid green;"></iframe>
                                </div>
								<div id="tab2" class="tab-pane">
                                 <iframe height="500px" width="100%" src="Admin_AllExperts.jsp" style="border: 2px solid green;"></iframe>
								</div>
								<div id="tab3" class="tab-pane">
                                 <iframe height="500px" width="100%" src="Admin_AllExpertsIncident.jsp" style="border: 2px solid green;"></iframe>
								</div>
								<div id="tab4" class="tab-pane">
                                 <iframe height="500px" width="100%" src="Admin_AllCustomerIncident.jsp" style="border: 2px solid green;"></iframe>
                                </div>										
								<div id="tab5" class="tab-pane">
                                 <iframe height="500px" width="100%" align="middle" src="Admin_AllCategories.jsp" style="border: 2px solid green;"></iframe>
                                </div>										
                              </div>
							</div>
						</div>
									<!-- Question Listing End -->
								</div>
								<!-- Pagination View More -->
								<!-- Pagination View More End -->
							</div>
						</section>
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