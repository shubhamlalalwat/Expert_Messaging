//    Author     : Prateek Haryani
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dbcon.DatabaseConnection;

import dto.Question;

public class QuestionDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public Question getQuestionById(int questionID) {
		Question question= null;
		try {
		    con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select * from Question where id = ?");
	        
	        pst.setInt(1, questionID);
	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	            if(rs.next())
	            {  
	                question = new Question();
	                question.setId(rs.getInt(1));
	                question.setQuestionTitle(rs.getString(2));
	                question.setQuestionDescription(rs.getString(3));
	                question.setPostedDate(rs.getTimestamp(4)+"");
	                question.setStatus(rs.getBoolean(5));
	                question.setVisibility(rs.getBoolean(6));
	                question.setCategoryID(rs.getInt(7));
	                question.setSubCategoryID(rs.getInt(8));
	                question.setCustomerID(rs.getString(9));
	                question.setExpertID(rs.getString(10)); 
	            }
	        }
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return question;
	}
	
	public ArrayList<Question> getAllUnAnsweredQuestionsForCustomer(String customerID){
		ArrayList<Question> questionList= null;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select * from Question where customerID = ? and "
	                + "status = false");
	        
	        pst.setString(1, customerID);
	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	        	questionList = new ArrayList<>();
	            
	            while(rs.next())
	            {
	                Question object = new Question();
	                object.setId(rs.getInt(1));
	                object.setQuestionTitle(rs.getString(2));
	                object.setQuestionDescription(rs.getString(3));
	                object.setPostedDate(rs.getTimestamp(4)+"");
	                object.setStatus(rs.getBoolean(5));
	                object.setVisibility(rs.getBoolean(6));
	                object.setCategoryID(rs.getInt(7));
	                object.setSubCategoryID(rs.getInt(8));
	                object.setCustomerID(rs.getString(9));
	                object.setExpertID(rs.getString(10));
	                
	                questionList.add(object);
	            }
	        }
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return questionList;
	}

public boolean addQuestion(Question obj) {
	boolean b= false;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("insert into Question(questionDescription,status,visibility,"
                + "categoryID,subCategoryID,customerID,expertID,questionTitle) values(?,?,?,?,?,?,?,?)");
        
        pst.setString(1, obj.getQuestionDescription());
        pst.setBoolean(2, false);
        pst.setBoolean(3, obj.isVisibility());
        pst.setInt(4, obj.getCategoryID());
        pst.setInt(5, obj.getSubCategoryID());
        pst.setString(6, obj.getCustomerID());
        pst.setString(7, obj.getExpertID());
        pst.setString(8, obj.getQuestionTitle());
        
        int count = pst.executeUpdate();
        
        if(count > 0)
            b = true;
        
        con.close();

		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return b;
}

public ArrayList<Question> getAllUnAnsweredQuestionsForExpert(String expertID){
	ArrayList<Question> questionList= null;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select * from Question where expertID = ? and "
                + "status = false and id not in (select questionID from reportedincidentsbyexperts)");
        
        pst.setString(1, expertID);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            questionList = new ArrayList<>();
            
            while(rs.next())
            {
                Question q = new Question();
                q.setId(rs.getInt(1));
                q.setQuestionTitle(rs.getString(2));
                q.setQuestionDescription(rs.getString(3));
                q.setPostedDate(rs.getTimestamp(4)+"");
                q.setStatus(rs.getBoolean(5));
                q.setVisibility(rs.getBoolean(6));
                q.setCategoryID(rs.getInt(7));
                q.setSubCategoryID(rs.getInt(8));
                q.setCustomerID(rs.getString(9));
                q.setExpertID(rs.getString(10));
                
                questionList.add(q);
            }
        }
        con.close();

		
	}
	catch (Exception ex) {
		ex.printStackTrace();
	}
	return questionList;
}
public boolean changeQuestionStatus(int questionID) {
	boolean b= false;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("update Question set status = true where id = ?");
        
        pst.setInt(1, questionID);
        
        int count = pst.executeUpdate();
        
        if(count > 0)
            b = true;
        
        con.close();
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return b;
}
public String getExpertByQuestion(int questionID) {
	String expertID= "";
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select expertID from Question where id = ?");
        pst.setInt(1,questionID);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            rs.next();
            expertID = rs.getString(1);
        }
        
        con.close();
		
		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return expertID;
	
}
public String getCustomerByQuestion(int questionID) {
	String customerID= "";
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select customerID from Question where id = ?");
        pst.setInt(1,questionID);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            rs.next();
            customerID = rs.getString(1);
        }
        
        con.close();

		
		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return customerID;
	
}

public ArrayList<Integer> getQuestionSearcResult(String searchTerm){
	ArrayList<Integer> answerList= null;
	try {
	      con = DatabaseConnection.getConnection();
	      
	      Statement st=con.createStatement();
	      
	      //pst.setString(1, searchTerm);
	      //pst.setString(2, searchTerm);
	      
	      rs=st.executeQuery("SELECT id FROM question WHERE  Visibility = 1 and ( QuestionDescription LIKE '%"+ searchTerm +"%' OR "
	              + "questionTitle LIKE '%"+ searchTerm +"%' )");
	      
	      if(rs.isBeforeFirst())
	        {
	            answerList = new ArrayList<>();
	            
	             while(rs.next())
	             {
	                answerList.add(rs.getInt("id"));
	             }
	        }
	       
	      con.close();

		
	}
	catch(Exception ex) {
		
	}
	return answerList;
}




}
