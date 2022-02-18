<%-- 
    Author     : Prateek Haryani
--%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.QuestionSubCategory"%>
<%@page import="dao.QuestionSubCategoryDAO"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="application/json" %>
<%
		
           int catid = Integer.parseInt(request.getParameter("catid"));
           
           QuestionSubCategoryDAO obj = new QuestionSubCategoryDAO();
           
           ArrayList<QuestionSubCategory> lst = obj.getQuestionSubCategoriesByQuestionCategoryID(catid);
           
           Gson g = new Gson();
           
           HashMap<String,ArrayList<QuestionSubCategory>> hmap = new HashMap<String,ArrayList<QuestionSubCategory>>();
           
           hmap.put("subcat",lst);
           
           out.print(g.toJson(hmap));
           
/*var jsonData = JSON.parse(myMessage);
for (var i = 0; i < jsonData.counters.length; i++) {
    var counter = jsonData.counters[i];
    console.log(counter.counter_name);
}
           */
%>    
