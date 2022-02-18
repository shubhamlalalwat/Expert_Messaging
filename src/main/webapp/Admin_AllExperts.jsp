<%-- 
    Author     : Prateek Haryani
--%>



<%@page import="dao.QuestionSubCategoryDAO"%>
<%@page import="dao.QuestionCategoryDAO"%>
<%@page import="dao.ExpertDAO"%>
<%@page import="dto.Expert"%>
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
        <title>Registered Expert List</title>
    </head>
    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> Registered <b>Experts List</b></h2>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category</th>
                        <th>Sub-Category</th>
                       <th>Blocked </th>
                        <th>Change</th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                            ExpertDAO dao = new ExpertDAO();
                            
                            QuestionCategoryDAO qcdo = new QuestionCategoryDAO();
                            QuestionSubCategoryDAO qscdo = new QuestionSubCategoryDAO();
                            
                            ArrayList<Expert> lst = dao.getAllExpertsDetails();

                            for (Expert s : lst) {

                    %>
                    <tr>
                        <td><%=s.getId()%></td>
                        <td><%=qcdo.getCategoryName(s.getCategoryID())%></td>
                        <td><%=qscdo.getSubCategoryName(s.getSubCategoryID())%></td>
                        <td><%=s.isBlocked()%></td>
                        <td><%  if (!s.isBlocked()){%>
                            <a href="db_Admin_BlockExpert.jsp?id=<%=s.getId()%>" class="delete"  data-toggle="modal" onsubmit="myclick()"><img title="BLOCK" style="height: 30px; width: 30px;"  src="images/33.png"></a>
                        </td>
                        <%}%>
                    </tr>
<!--                <script>
                    function myclick()
                    {
                        swal({
                            title: "Are you sure?",
                            text: "Your will not be able to recover this imaginary file!",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonClass: "btn-danger",
                            confirmButtonText: "Yes, delete it!",
                            closeOnConfirm: false
                        },
                                function () {
                                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                                });

                    }
                </script>-->
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
