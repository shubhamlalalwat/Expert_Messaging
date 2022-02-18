<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dao.ReportedIncidentsByCustomerDAO"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="dto.ReportedIncidentsByCustomer"%>
<%
    String customerid = (String) session.getAttribute("customerID");
        
    int questionid = Integer.parseInt(request.getParameter("questionid"));
    
    String incDesc = request.getParameter("incDesc");
    
    ReportedIncidentsByCustomer obj = new ReportedIncidentsByCustomer();
    obj.setCustomerID(customerid);
    obj.setIncidentDescription(incDesc);
    obj.setQuestionID(questionid);
    obj.setExpertID(new QuestionDAO().getExpertByQuestion(questionid));
    
    ReportedIncidentsByCustomerDAO cdao = new ReportedIncidentsByCustomerDAO();
    
    boolean b = cdao.addIncidentByCustomer(obj);
    if(b)
        out.print("success");
        else
        out.print("error");
%>