<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dao.ExpertDAO"%>
<%@page import="dto.Expert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Expert Profile</title>
    </head>
    <body>
      <%
          String id=(String)session.getAttribute("expertid");
          String pass=request.getParameter("password");
/*           int cat=Integer.parseInt(request.getParameter("categoryID"));
          int subcat=Integer.parseInt(request.getParameter("subCategoryID"));
 */         
          Expert e=new Expert();
          
          e.setPassword(pass);
/*           e.setCategoryID(cat);
          e.setSubCategoryID(subcat);
 */          e.setId(id);
          
          ExpertDAO edo=new ExpertDAO();
          boolean i=edo.updateExpert(e);
          if(i)
          {
          	out.println("<script src='js/sweetalert2.all.js' type='text/javascript'></script>");
	        out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
	        out.println("<script>");
	        out.println("$(document).ready(function(){");
	        out.println("swal('Verification Message', 'Your record has been updated successfully !! ', 'success');");
	        out.println("});");
	        out.write("setTimeout(function(){window.location.href='Expert_Index.jsp'},2000);");
	        out.println("</script>");
          }
          else
          {
        	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	        out.println("<script>");
	        out.println("$(document).ready(function(){");
	        out.println("swal ( 'Warning' ,  'Your information not updated ,try again' ,'warning' );");
	        out.println("});");
	        out.write("setTimeout(function(){window.location.href='Expert_Profile_Setting.jsp'},2000);");
	        out.println("</script>");
         }
         %>
     
    </body>
</html>
