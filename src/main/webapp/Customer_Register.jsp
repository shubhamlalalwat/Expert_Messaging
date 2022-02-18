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
  <title>Customer Registration</title>
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

<!-- ----------------------------------------Login Button	------------------------------------------------------------------------ -->
					<li><a href="Login.jsp"><i class="fa fa-lock" aria-hidden="true"></i>Login</a>
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
        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

<!-------------------------------------------------- Logo Button ----------------------------------------------------------------------------------------------->
        <!-- logo -->
        <a href="Index.jsp" class="navbar-brand"><img class="img-responsive" alt="" src="images/logo.png">
        </a>

        <!-- header end -->
      </div>

    </div>
  </div>

  <!-- HEADER Navigation End -->

    <!-- =-=-=-=-=-=-= Page Breadcrumb =-=-=-=-=-=-= -->
    <section class="page-title">
      <div class="container">
        <div class="row">
          <div class="col-md-7 col-sm-7 co-xs-12 text-right">
              <h1><b>Customer Registration</b></h1>
          </div>
          <!-- end col -->
            <!-- end bread -->
          </div>
          <!-- end col -->
        </div>
        <!-- end row -->
      </section>
   
 <!-- end container -->
 
    <!-- =-=-=-=-=-=-= Page Breadcrumb End =-=-=-=-=-=-= -->

    <!-- =-=-=-=-=-=-= Register Form =-=-=-=-=-=-= -->
    <section class="section-padding-80 white" id="register">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3">

            <div class="box-panel">
<!-- ------------------------------------------------------ Registration Form ------------------------------------------------------------------------------ -->
              <!-- form login -->
              <form action="db_Customer_Register.jsp" method="post">
                  
                <div class="form-group">
                  <!--label>Id</label-->
                  <label>Email</label>
                  <input type="email" placeholder="Enter your email" name="id" class="form-control" required>
                </div>

                <div class="form-group">
                  <label>Password</label>
                  <input type="password" placeholder="Enter your password" name="password" class="form-control" required id="myInput"><br>
                 <input type="checkbox" onclick="myFunction()"> Show Password
                </div>
                
                <div class="form-group">
                  <label>First Name</label>
                  <input type="text" placeholder="Enter your firstName" name="firstName" class="form-control" required>
                </div>
                
                <div class="form-group">
                  <label>Last Name</label>
                  <input type="text" placeholder="Enter your lastName" name="lastName" class="form-control" required>
                </div>
                
                <div class="form-group">
                  <label>Mobile Number</label>
                  <input type="text" placeholder="Enter your Mobile Number" name="mobileNumber" class="form-control" required>
                </div>
                
                <div class="form-group">
                  <div class="row">
                    <div class="col-xs-12 text-right">

<!-- ------------------------------------------ Login Button	------------------------------------------------------------------------------ -->
                      <a href="Login.jsp">Already Register Sign In</a>
                    </div>
                  </div>
                </div>

                <button class="btn btn-primary btn-lg btn-block">Create Account</button>
                  </form>
              <!-- form login -->
            </div>
          </div>
         </div>

<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
            
   </div>
      <!-- end container -->
    </section>
    <!-- =-=-=-=-=-=-= Register Form End =-=-=-=-=-=-= -->

  
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
