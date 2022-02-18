<%-- 
    Author     : Prateek Haryani
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%       
         String user_id = (String)session.getAttribute("customerID");
		System.out.println(user_id);
         if(user_id == null) 
         {
             out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
    	     out.println("<script>");
		     out.println("$(document).ready(function(){");
		     out.println("swal ( 'Warning  Message' ,  'You must have to login first to search a question!!!' ,'warning' );");
		     out.println("});");
		     out.write("setTimeout(function(){window.location.href='Login.jsp'},2000);");
		     out.println("</script>");
         }
         else
         {
        	 out.println("<script>");
		     out.write("setTimeout(function(){window.location.href='Login.jsp'},100);");
		     out.println("</script>");
         }
         %>
    </body>
</html>
