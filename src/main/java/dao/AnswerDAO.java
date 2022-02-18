//    Author     : Prateek Haryani

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Answer;
import dbcon.DatabaseConnection;
public class AnswerDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	public ArrayList<Answer> getAllAnswersForCustomerQuestions(String customerID){
		ArrayList<Answer> answerlist= null;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select Answer.id,Answer.answerDescription,Answer.postedDate,"
	                + "Answer.questionID,Answer.expertID from Question Right Outer Join Answer "
	                + "ON Question.id = Answer.questionID WHERE Question.customerID = ? and Question.id not in (select questionID from reportedincidentsbycustomers)");
	        
	        pst.setString(1, customerID);
	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	            answerlist = new ArrayList<>();
	            
	            while(rs.next())
	            {
	                Answer a = new Answer();
	                a.setId(rs.getInt(1));
	                a.setAnswerDescription(rs.getString(2));
	                a.setPostedDate(rs.getTimestamp(3)+"");
	                a.setQuestionID(rs.getInt(4));
	                a.setExpertID(rs.getString(5));
	                
	                answerlist.add(a);
	            }
	        }
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return answerlist;
		
	}

public ArrayList<Answer> getAllQuestionsAndAnswersByExpert(String expertID){
	ArrayList<Answer> answerList= null;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select Answer.id,Answer.answerDescription,Answer.postedDate,"
                + "Answer.questionID,Answer.expertID from Question Right Outer Join Answer "
                + "ON Question.id = Answer.questionID WHERE Question.expertID = ?");
        
        pst.setString(1, expertID);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            answerList = new ArrayList<>();
            
            while(rs.next())
            {
                Answer a = new Answer();
                a.setId(rs.getInt(1));
                a.setAnswerDescription(rs.getString(2));
                a.setPostedDate(rs.getTimestamp(3)+"");
                a.setQuestionID(rs.getInt(4));
                a.setExpertID(rs.getString(5));
                
                answerList.add(a);
            }
        }
        con.close();

		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return answerList;
}
public boolean addAnswer(Answer obj) {
	boolean b= false;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("insert into Answer(answerDescription,questionID,expertID) "
                + "values(?,?,?)");
        
        pst.setString(1, obj.getAnswerDescription());
        pst.setInt(2, obj.getQuestionID());
        pst.setString(3, obj.getExpertID());
        
        int count = pst.executeUpdate();
        
        if(count > 0)
            b = true;
        
        con.close();

		
	}
	catch(Exception ex){
		ex.printStackTrace();
	}
	return b;
}
public ArrayList<Answer> getAnswerSearchResult(ArrayList<Integer> qidlist)
{
    ArrayList<Answer> anslist = new ArrayList<>();
    try
    {
    	for(Integer id : qidlist)
        {
            Answer a = getAnswerByQuestion(id);
            if(a != null)
            {
                anslist.add(a);
            }
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    
    return anslist;
}
public Answer getAnswerByQuestion(int questionID) {
	Answer answer= null;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select * From Answer WHERE questionID = ?");
        
        pst.setInt(1, questionID);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            answer = new Answer();
            
            if(rs.next())
            {
                answer.setId(rs.getInt(1));
                answer.setAnswerDescription(rs.getString(2));
                answer.setPostedDate(rs.getTimestamp(3)+"");
                answer.setQuestionID(rs.getInt(4));
                answer.setExpertID(rs.getString(5));
            }
        }
        con.close();
		
		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return answer;
}




}
