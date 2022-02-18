<%@page import="dao.ExpertDAO"%>
<%@page import="dto.Expert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String expertid = request.getParameter("expertid");
    
    Expert exp = new Expert();
    exp.setId(expertid);
    
    ExpertDAO edo = new ExpertDAO();
    
    boolean b = edo.forgotPassword(exp);
    
    if(b)
    out.print("success");
    else
    out.print("failure");
%>