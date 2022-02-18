<%-- 
    Author     : Prateek Haryani
--%>

<%@page import="dao.CustomerDAO"%>
<%@page import="dao.ExpertDAO"%>
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
        <title>Expert Incident</title>
        
        <script>
         function clickAndDisable(link) {
     // disable subsequent clicks
     link.onclick = function(event) {
        event.preventDefault();
     }
   }  
        </script>
        
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
    </head>
    <body>
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8">
                        <h2><b>Incident Raised By Expert To Customer</b></h2><br>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hovers">
                <thead>
                    <tr>
                          <th>Expert ID</th>
                          <th>Customer Id</th>
                        <th>Question<br> Title</th>
                        <th>Question<br> Description</th>
                        <th>Description<br> of Incident</th>
                        <th>Posted Date<br> of Incident</th>
                        <th>Blocked </th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                            QuestionDAO qd = new QuestionDAO();
                            ReportedIncidentsByExpertDAO dao = new ReportedIncidentsByExpertDAO();
                            
                            ArrayList<ReportedIncidentsByExpert> lst = dao.getAllIncidentsByExpert();

                            for (ReportedIncidentsByExpert rs : lst) {
                           
                                Question qs = qd.getQuestionById(rs.getQuestionID());
                    %>

                    <tr>
                        <td><%=qs.getExpertID()%></td>
                        <td><%=qs.getCustomerID()%></td>
                        <td><%=qs.getQuestionTitle()%></td>
                        <td><div id="myDIV1"><%=qs.getQuestionDescription()%></div></td>
                        <td><div id="myDIV2"><%=rs.getIncidentDescription()%></div></td>
                        <td><%=rs.getPostedDate()%></td>
                        <td>
                            <a href="db_Admin_BlockCustomer.jsp?id=<%=qs.getCustomerID()%>" onclick="clickAndDisable(this);" class="delete"  data-toggle="modal"><img title="BLOCK" style="height: 30px; width: 30px;"  src="images/33.png"></a>
                        </td>
                        
                    </tr>

                <%
                        }
                    } catch (Exception e) {

                    }
                %>
                </tbody>
            </table>
        </div>
  
        
    </body>
</html>

