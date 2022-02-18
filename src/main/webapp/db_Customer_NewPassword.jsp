<%@page import="dao.CustomerDAO"%>
<jsp:useBean id="u"  class="dto.Customer" scope="request"></jsp:useBean>
<jsp:setProperty name="u" property="*"></jsp:setProperty>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password</title>
    </head>
    <body>
        <%
        String id=request.getParameter("emailID");
        String password=request.getParameter("password1");
         	CustomerDAO obj=new CustomerDAO();
            boolean i=obj.forgotPassword(id,password);
            
            if(i)
            {
                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
                out.println("<script>");
                out.println("$(document).ready(function(){");
                out.println("swal ( 'Verification Message' ,  'You have been successfully Changed Password' ,'success' );");
                out.println("});");
                out.write("setTimeout(function(){window.location.href='Login.jsp'},2000);");
                out.println("</script>");
            }
           
            else
            {
                 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			     out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
 			     out.println("<script>");
			     out.println("$(document).ready(function(){");
		         out.println("swal ( 'Verification Message' ,  'Verification failed !!!' ,  'warning' );");
		         out.println("});");
		         out.write("setTimeout(function(){window.location.href='Login.jsp'},2000);");
			     out.println("</script>");
            }
        
        
        %>
    </body>
</html>
