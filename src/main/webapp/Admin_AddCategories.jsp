<%-- 
    Author     : Prateek Haryani
--%>


<%@page import="dao.QuestionCategoryDAO"%>
<%@page import="dto.QuestionCategory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="ScriptsBundle">
  <title>Add Categories</title>
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
					<li><a href="Admin_Index.jsp">Home</a>
					</li>
				</ul>
			</div>
	        <div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
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
        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="Admin_Index.jsp" class="navbar-brand"><img class="img-responsive" alt="" src="images/logo.png"></a>
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
              <h1><b>Add Category and SubCategory </b></h1>
          </div>
          </div>
        </div>
      </section>
    <!-- =-=-=-=-=-=-= Page Breadcrumb End =-=-=-=-=-=-= -->
    <!-- =-=-=-=-=-=-= Add Form =-=-=-=-=-=-= -->
    <section class="section-padding-80 white" id="register">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3">
            <div class="box-panel">
              <!-- form login -->
              <form action="db_Admin_AddCategories.jsp" method="post">
				<div>
                  <label>Category ID</label>
                  <select id="qcat" class="questions-category form-control" name="categoryID" onchange="copyValue()">
                      <option value="0">New Category</option>
                      <%
	                        QuestionCategoryDAO qd = new QuestionCategoryDAO();
                            ArrayList<QuestionCategory> lst = qd.getAllQuestionCategories();
                            if(lst != null)
                            {
                                for(QuestionCategory obj : lst)
                                {
			                      %><option value="<%=obj.getId()%>"><%=obj.getCategoryName()%></option>
			                      <%
                                }
                            }
                      %>    
                  </select>
                </div>
				<div class="form-group">
                  <!--label>Id</label-->
                  <label>Category Name</label>
                  <input type="text" id="mytextbox" placeholder="Enter Category Name" name="categoryName" class="form-control" required>
                </div>


	                  <script type="text/javascript">
						function copyValue()
						{
						   var dropboxvalue = document.getElementById('qcat');
						   var displaytext = dropboxvalue.options[dropboxvalue.selectedIndex].text;
						   document.getElementById('mytextbox').value = displaytext;
						   if (parseInt(document.getElementById("qcat").value) === 0) {
							   document.getElementById("mytextbox").readOnly=false;
						   }
		
						   else{
							    document.getElementById("mytextbox").readOnly=true;
						   }
						}
					</script>

                <div class="form-group">
                  <label>Sub Category Name</label>
                  <input type="text" placeholder="Enter SubCategory Name" name="subCategoryName" class="form-control" required ><br>
                </div>

                
                <button class="btn btn-primary btn-lg btn-block">Add Category</button>
                  </form>
              <!-- Form Add -->
            </div>
          </div>
         </div>
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