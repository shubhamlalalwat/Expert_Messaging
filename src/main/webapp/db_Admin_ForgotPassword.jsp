<%@page import="dao.AdminDAO"%>
<%@page import="dto.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String adminid = request.getParameter("adminid");
	System.out.println(adminid+"30");
	AdminDAO ado = new AdminDAO();
    
    boolean b = ado.forgotPassword(adminid);
    
    if(b)
    out.print("success");
    else
    out.print("failure");
%>