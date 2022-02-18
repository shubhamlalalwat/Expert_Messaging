//    Author     : Prateek Haryani
package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbcon.DatabaseConnection;
import dto.QuestionCategory;
public class QuestionCategoryDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	// Get All Details through question category for Admin  

	public ArrayList<QuestionCategory> getAllQuestionCategories() {
		ArrayList<QuestionCategory> questionCategoryList= null;
		try {
	        con = DatabaseConnection.getConnection();
	        pst = con.prepareStatement("select * from QuestionCategory");
	        rs = pst.executeQuery();

	        if(rs.isBeforeFirst())
	        {
	        	questionCategoryList = new ArrayList<>();
	            
	            while(rs.next())
	            {
	                QuestionCategory obj = new QuestionCategory();
	                obj.setId(rs.getInt(1));
	                obj.setCategoryName(rs.getString(2));
	                questionCategoryList.add(obj);
	            }
	        }
	        
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return questionCategoryList;
	}
// DISPLAY EXPERT DETAILS FOR ADMIN 
	public String getCategoryName(int categoryID) {
		String categoryName= "";
		try {
		       con = DatabaseConnection.getConnection();
	            
		        pst = con.prepareStatement("select categoryName from QuestionCategory "
		                    + "where id = ?");
		            
		            pst.setInt(1, categoryID);
		            
		            rs = pst.executeQuery();
		            
		            if(rs.isBeforeFirst())
		            {
		                rs.next();
		                
		                categoryName =  rs.getString("categoryName");
		            }
		            
		            con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return categoryName;
	}
	

public int addQuestionCategory(String categoryName) {
	int categoryID= 0;
	try {
        con = DatabaseConnection.getConnection();
        
        pst=con.prepareStatement("SELECT COUNT(categoryName) FROM questioncategory WHERE categoryName=?");
        pst.setString(1, categoryName);
        rs = pst.executeQuery();
        int count=0;
        if(rs.isBeforeFirst())
         {
             rs.next();
             count = rs.getInt("COUNT(categoryName)");
         }

        if(count==0) {
        pst = con.prepareStatement("insert into QuestionCategory(categoryName) values(?)");
        
        pst.setString(1, categoryName);
        
        count = pst.executeUpdate();
        
        if(count <= 0)
            return 0;
        }
        
        
        pst = con.prepareStatement("select * from questionCategory where categoryName = ?");
        pst.setString(1, categoryName);
        
        rs = pst.executeQuery();
        if(rs.isBeforeFirst())
        {
            rs.next();
            categoryID = rs.getInt(1);
        }
       
        
        con.close();
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return categoryID;
}

}

