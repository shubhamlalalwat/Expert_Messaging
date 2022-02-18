<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dao.QuestionDAO"%>
<%@page import="dto.Answer"%>
<%@page import="dao.AnswerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String desc = request.getParameter("ans");
  String questionId = request.getParameter("questionId");
  String expertid = request.getParameter("expertId");
  String customerid = request.getParameter("customerID");
    AnswerDAO ado = new AnswerDAO();
    
    Answer obj = new Answer();
    obj.setAnswerDescription(desc);
    obj.setExpertID(expertid);
    obj.setQuestionID(Integer.parseInt(questionId));
   
    
    boolean b = ado.addAnswer(obj);
    
    if(b)
    {
        QuestionDAO qd = new QuestionDAO();
        qd.changeQuestionStatus(Integer.parseInt(questionId));
        
        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        out.println("<script src='js/jquery.min.js' type='text/javascript'></script>");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("swal ( 'Message From Server' ,  'Answer Posted Successfully' ,'success' );");
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
        out.println("swal ( 'Message From Server' ,  'Answer not posted !!!' ,'warning' );");
        out.write("setTimeout(function(){window.location.href='Expert_Index.jsp'},2000);");
        out.println("});");
        out.println("</script>");
    }
%>