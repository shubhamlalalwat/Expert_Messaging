<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dao.CustomerDAO" %>
<jsp:useBean id="registerFormObject" class="dto.Customer" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="registerFormObject"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP PAGE</title>
</head>
<body>
        <%             
         CustomerDAO obj=new CustomerDAO();
		String customerID = registerFormObject.getId(); 
        boolean i = obj.checkID(customerID);  
		if(!i){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal ( 'Message From Server' ,  'Duplicate Data Found' ,"
                    + "  'warning' );");
            out.println("});");
            out.write("setTimeout(function(){window.location.href='Customer_Register.jsp'},2000);");
            out.println("</script>");
		}
		else{
			
         i=obj.registerCustomer(registerFormObject);
         
         
         if(i)
         {
             out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
             out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
             out.println("<script>");
             out.println("$(document).ready(function(){");
             out.println("swal ( 'Thank You' ,  'You have been successfully Registered With SLICK ' ,"
                     + "  'success' );");
             out.println("});");
             out.write("setTimeout(function(){window.location.href='CustomerRegistrationDone.jsp'},2000);");
             out.println("</script>");
               %>
	                
               <%
         }
         else 
         {
             out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
             out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
             out.println("<script>");
             out.println("$(document).ready(function(){");
             out.println("swal ( 'Message From Server' ,  'Some Technical Error' ,"
                     + "  'warning' );");
             out.println("});");
             out.write("setTimeout(function(){window.location.href='Customer_Register.jsp'},2000);");
             out.println("</script>");
   		}
		}
     	%>
</body>
</html>