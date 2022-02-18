<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dto.Answer"%>
<%@page import="dao.AnswerDAO"%>
<%@page import="dto.Question"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>All Answers By Expert</title>
    </head>
    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> <b>Answers Posted By You</b></h2>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Question Title</th>
                        <th>Question Description</th>
                        <th>Your Answer</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            QuestionDAO dao = new QuestionDAO();
                            AnswerDAO ado = new AnswerDAO();
                            ArrayList<Answer> anslist = ado.getAllQuestionsAndAnswersByExpert(
                                    (String)session.getAttribute("expertid"));

                            if(anslist != null)
                            {
                            for (Answer ans : anslist) {
                            Question qs = dao.getQuestionById(ans.getQuestionID());
                    %>
                    <tr>

                        <td><%=qs.getQuestionTitle()%></td>

                        <td><%=qs.getQuestionDescription()%></td>
                        
                        <td><%=ans.getAnswerDescription()%> <br> <%=ans.getPostedDate()%> </td>
                    </tr>
                <%}}%>

                </tbody>
            </table>
        </div>
    </div>
    
        
    </body>
</html>
