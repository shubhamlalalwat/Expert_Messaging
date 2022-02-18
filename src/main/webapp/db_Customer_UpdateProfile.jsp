<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dto.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer Profile</title>
    </head>
    <body>
      
<%  
          String id=session.getAttribute("customerID").toString();
          String pass=request.getParameter("password");
          String fname=request.getParameter("firstName");
          String lname=request.getParameter("lastName");
          String mobile=request.getParameter("mobileNumber");
          Customer c=new Customer();
          
          c.setPassword(pass);
          c.setFirstName(fname);
          c.setLastName(lname);
          c.setMobileNumber(mobile);
          c.setId(id);
                  
         CustomerDAO obj=new CustomerDAO();
         
         boolean i=obj.updateCustomer(c);
         
         if(i)
         {
        	 out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
             out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
             out.println("<script>");
             out.println("$(document).ready(function(){");
             out.println("swal ( 'PROFILE UPDATED' ,  'You Profile have been successfully Updated' ,'success' );");
             out.println("});");
             out.write("setTimeout(function(){window.location.href='Customer_Index.jsp'},2000);");
             out.println("</script>");

         }
         else 
         {
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	        out.println("<script>");
	        out.println("$(document).ready(function(){");
	        out.println("swal ( 'Warning' ,  'Not updated,something is wrong!!!' ,'warning' );");
	        out.println("});");
	        out.write("setTimeout(function(){window.location.href='Customer_Profile_Setting.jsp'},2000);");
	        out.println("</script>");
         }
         %>
    </body>
</html>
