<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dao.ExpertDAO"%>
<%@page import="dto.Expert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expert_DB</title>
    </head>
    <body>
        <%
            
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            Expert e=new Expert();
            e.setId(id);
            e.setPassword(password);
            
            ExpertDAO obj = new ExpertDAO();
            boolean i=obj.checkExpertCredentials(e);
                              
                    if(i)
                    {
                        session.setAttribute("expertid", e.getId());
				        %>
				        <jsp:forward page="Expert_Index.jsp"></jsp:forward>
				        <%
                    }
                    else
                    {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				        out.println("<script>");
				        out.println("$(document).ready(function(){");
				        out.println("swal ( 'Warning' ,  'invalid user-id or password !!!' ,'warning' );");
				        out.println("});");
				        out.write("setTimeout(function(){window.location.href='Login.jsp'},2000);");
				        out.println("</script>");
            		}
            %>
    </body>
</html>
