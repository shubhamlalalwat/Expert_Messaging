<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dao.QuestionCategoryDAO" %>
<%@page import="dao.QuestionSubCategoryDAO" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%            
         	String category_Name= request.getParameter("categoryName");
            String subCategoryName= request.getParameter("subCategoryName");
			
            QuestionSubCategoryDAO object= new QuestionSubCategoryDAO();
            boolean i= object.existingSubCategory(subCategoryName);
            if(i== true){
	             QuestionCategoryDAO obj=new QuestionCategoryDAO();
   			     int categoryID=obj.addQuestionCategory(category_Name);
   	   		     i=object.addQuestionSubCategory(subCategoryName,categoryID);
            }
   		     
         if(i)
         {
             out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
             out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
             out.println("<script>");
             out.println("$(document).ready(function(){");
             out.println("swal ( 'Message From Server' ,  'You have been successfully Added Categories ' ,'success' );");
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
	        out.write("setTimeout(function(){window.location.href='Admin_AddCategories.jsp'},2000);");
	        out.println("</script>");
		}
     %>
