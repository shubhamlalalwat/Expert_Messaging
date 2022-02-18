<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="dto.Question"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="dto.ReportedIncidentsByExpert"%>
<%@page import="dao.ReportedIncidentsByExpertDAO"%>
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
        <title>Incident By Expert</title>
    </head>
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
    

    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2><b>Incident Raised</b></h2><br>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Question Title</th>
                       <th>Question Description</th>
                        <th>Description of Incident</th>
                        <th>Posted Date of Incident</th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                        QuestionDAO qd = new QuestionDAO();
                            ReportedIncidentsByExpertDAO dao = new ReportedIncidentsByExpertDAO();
                            
                            ArrayList<ReportedIncidentsByExpert> lst = dao.getAllIncidentsByExpertID((String)
                            session.getAttribute("expertid"));

                            for (ReportedIncidentsByExpert rs : lst) {
                            Question qs = qd.getQuestionById(rs.getQuestionID());
                    %>

                    <tr>
                        <td><%=qs.getQuestionTitle()%></td>
                        <td><div id="myDIV1"><%=qs.getQuestionDescription()%></div></td>
                        <td><div id="myDIV2"><%=rs.getIncidentDescription()%></div></td>
                        <td><%=rs.getPostedDate()%></td>
                    </tr>

                <%
                        }
                    } catch (Exception e) {

                    }
                %>

                </tbody>
            </table>
        </div>
    </div>
   
        
    </body>
</html>

