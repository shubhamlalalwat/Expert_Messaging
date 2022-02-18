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
		session.invalidate();
       out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
       out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
       out.println("<script>");
       out.println("$(document).ready(function(){");
       out.println("swal ( 'Message' ,  'Logout Successful' ,'success' );");
       out.println("});");
       out.write("setTimeout(function(){window.location.href='Index.jsp'},2000);");
       out.println("</script>");
%>
    </body>
</html>
