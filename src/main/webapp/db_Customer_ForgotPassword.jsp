<%@page import="dao.MailDAO"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="dto.Customer"%>
<%@page import="servercon.WebServer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String custid = request.getParameter("custid");
	System.out.println(custid);
	Customer  c = new Customer();
	CustomerDAO cdo = new CustomerDAO();
	boolean b = cdo.forgotPassword(custid);
	if(b)
	out.print("success");
	else
	out.print("failure");

%>