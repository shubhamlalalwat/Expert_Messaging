<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dto.Question"%>
<%@page import="java.util.List"%>
<%@page import="dao.QuestionDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <meta charset="utf-8">
  
  <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'/></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="author" content="ScriptsBundle">
        <title>Expert Index</title>
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
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <%
            
            String id = (String)session.getAttribute("expertid");
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
                            <li><a href="Expert_Index.jsp">Home</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
                        <ul class="top-nav nav-right">
                            <li class="dropdown"> 
                                <a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">
                                    <img class="img-circle resize" alt="" src="images/authors/13.png">
                                    <span style="text-transform: lowercase" class="hidden-xs small-padding">
                                         <%
                                                                    String name=(String)session.getAttribute("expertid");
                                                                    out.print(name);
                                                               %>
                                        <i class="fa fa-caret-down"></i>
                                    </span>
                                </a>
                                <ul class="dropdown-menu ">
                                    <!--li><a href="profile.jsp"><i class=" icon-bargraph"></i> Dashboard</a></li//-->
                                    <li><a href="Expert_Profile_Setting.jsp"><i class=" icon-gears"></i> Profile Setting</a></li>
                                    <!--li><a href="question-list.jsp"><i class="icon-heart"></i> Questions</a></li-->
                                    <li><a href="Logout.jsp"><i class="icon-lock"></i> Logout</a></li>
                                </ul>
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
                    <!-- logo -->
                    <a href="Expert_Index.jsp" class="navbar-brand">
                        <img class="img-responsive" alt="" src="images/logo.png">
                    </a>
                    <!-- header end -->
                </div>
                <!-- navigation menu -->
                <div class="navbar-collapse collapse">
                    <!-- right bar -->
                    <ul class="nav navbar-nav navbar-right">
                            <li>
                            <div class="btn-nav"><a href="#" class="btn btn-primary btn-small navbar-btn">EXPERT HOME</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
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
                                        <li class="active"> <a data-toggle="tab" href="#tab1"><i class="icofont icon-ribbon"></i><span class="hidden-xs">Unanswered Questions</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab2"><i class="icofont icon-layers"></i><span class="hidden-xs">Answered Questions</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab3"><i class="icofont icon-layers"></i><span class="hidden-xs">Incident Raised</span></a> 
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div id="tab1" class="tab-pane active">
                                        <!-- Question Listing -->
                                        <jsp:include page="Expert_ShowAllQuestionsToExpert.jsp"/>
                                        <!-- Question Listing End -->
                                    </div>
                                    <div id="tab2" class="tab-pane">
                                        <!-- Question Listing -->
                                        <jsp:include page="Expert_ShowAllAnswersToExpert.jsp"/> 
                                    </div>
                                        <!-- Question Listing End -->
                                   <div id="tab3" class="tab-pane">
                                        <!-- Question Listing -->
                                        <jsp:include page="Expert_ShowAllIncidentByExpert.jsp"/> 
                                    </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end container -->
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