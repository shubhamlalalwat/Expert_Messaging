<%-- 
    Author     : Prateek Haryani
--%>
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
        <style> 
	#myDIV2 {
	  border: 1px solid black;
	  background-color: lightblue;
	  width: 170px;
	  height: 170px
	  overflow: auto;
	}
	#myDIV1 {
	  border: 1px solid black;
	  width: 200px;
	  height: 200px
	  overflow: auto;
	}
</style>  
        
        <title>Question List For Customer</title>
    </head>
    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> <b>Questions By You</b></h2><br>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Question Title</th>
                        <th>Description</th>
                        <th>Posted Date</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                            QuestionDAO dao = new QuestionDAO();
                    ArrayList<Question> lst = dao.getAllUnAnsweredQuestionsForCustomer((String)
                            session.getAttribute("customerID"));

                            if(lst != null)
                            {
                            for (Question qs : lst) {
                    %>
		                    <tr>
		                        <td><%=qs.getQuestionTitle()%></td>
		                        <td><div id="myDIV1"><%=qs.getQuestionDescription()%></div></td>
		                        <td>
		                            <%=qs.getPostedDate()%>
		                        </td>
		                    </tr>
		                <%}}%>
                </tbody>
            </table>
        </div>
         </div>

 
        
    </body>
</html>
