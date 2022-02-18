<%-- 
    Author     : Prateek Haryani
--%>

<%@page import="dao.QuestionSubCategoryDAO"%>
<%@page import="dao.ExpertDAO"%>
<jsp:useBean id="u"  class="dto.Expert" scope="request"></jsp:useBean>
<jsp:setProperty name="u" property="*"></jsp:setProperty>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%   
                
  			boolean i= false;
	         if((request.getParameter("subCategoryID"))== null){
					i = false;
	         }
	         else{
		         ExpertDAO obj=new ExpertDAO();
		         i=obj.registerExpert(u);
	             int subCategoryID= Integer.parseInt(request.getParameter("subCategoryID"));
		         if(i==true){
		        	 QuestionSubCategoryDAO object = new QuestionSubCategoryDAO();
		        	 i=object.subCategoryOccupied(subCategoryID);
		         }
	         }
	         if(i)
	         {
	             out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	             out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
	             out.println("<script>");
	             out.println("$(document).ready(function(){");
	             out.println("swal ( 'Message From Server' ,  'You have been successfully Registered Expert ' ,"
	                     + "  'success' );");
	             out.println("});");
	             out.write("setTimeout(function(){window.location.href='Admin_Index.jsp'},2000);");
	             out.println("</script>");
	         }
	         else 
	         {
	             out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	             out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	             out.println("<script>");
	             out.println("$(document).ready(function(){");
	             out.println("swal ( 'Message From Server' ,  'Either Duplicate Data Or Some Technical Error' ,'warning' );");
	             out.println("});");
	             out.write("setTimeout(function(){window.location.href='Admin_ExpertRegister.jsp'},2000);");
	             out.println("</script>");
	         }
	     	%>
    </body>
</html>
