//    Author     : Prateek Haryani
package dao;
import dto.QuestionSubCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbcon.DatabaseConnection;

// DISPLAY ALL EXPERT DETAILS FOR ADMIN ---------------------------
public class QuestionSubCategoryDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	public String getSubCategoryName(int subCategoryID) {
		String subCategoryName= "";
		try {
	        con = DatabaseConnection.getConnection();
            
	        pst = con.prepareStatement("select subCategoryName from QuestionSubCategory "
	                    + "where id = ?");
	            
	            pst.setInt(1, subCategoryID);
	            
	            rs = pst.executeQuery();
	            
	            if(rs.isBeforeFirst())
	            {
	                rs.next();
	                
	                subCategoryName =  rs.getString("subCategoryName");
	            }
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return subCategoryName;
	}

	public boolean subCategoryOccupied(int subCategoryID) {
		boolean b= false;
		try {
			
			con = DatabaseConnection.getConnection();
            
            pst=con.prepareStatement("update questionsubcategory set occupied = 1 where id=?");
            pst.setInt(1, subCategoryID);
            int i= pst.executeUpdate();
            if(i==1) {
            	b= true;
            }
            con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public ArrayList<QuestionSubCategory> getQuestionSubCategoriesByCategoryID(int categoryID){
		ArrayList<QuestionSubCategory> subCategoryList= null;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select * from QuestionSubCategory where categoryID = ? AND occupied = 0");
	        
	        pst.setInt(1, categoryID);
	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	        	subCategoryList = new ArrayList<>();
	            
	            while(rs.next())
	            {
	                QuestionSubCategory obj = new QuestionSubCategory();
	                obj.setId(rs.getInt(1));
	                obj.setSubCategoryName(rs.getString(2));
	                obj.setCategoryID(rs.getInt(3));
	                subCategoryList.add(obj);
	            }
	        }
	        
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return subCategoryList;
		
	}

	public boolean existingSubCategory(String subCategoryName) {
		boolean b= false;
		try {
			
			con = DatabaseConnection.getConnection();
            
            pst=con.prepareStatement("SELECT COUNT(subCategoryName) FROM questionsubcategory WHERE subCategoryName=?");
            pst.setString(1, subCategoryName);
            rs = pst.executeQuery();
            
            int count=0;
            
            if(rs.isBeforeFirst())
	         {
	             rs.next();
	             count = rs.getInt("COUNT(subCategoryName)");
	         }

            if(count==0) {
            	b= true;
            }
            
            con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public boolean addQuestionSubCategory(String subCategoryName , int categoryID) {
		boolean b= false;
		try {
            con = DatabaseConnection.getConnection();
            
            
            pst = con.prepareStatement("insert into QuestionSubCategory(subCategoryName,"
                    + "categoryID) values(?,?)");
            
            pst.setString(1, subCategoryName);
            pst.setInt(2, categoryID);
            
            int count = pst.executeUpdate();
            
            if(count > 0)
                b = true;
            
            con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public ArrayList<QuestionSubCategory> getQuestionSubCategoriesByQuestionCategoryID(int categoryID){
		ArrayList<QuestionSubCategory> subCategoryList= null;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select * from QuestionSubCategory"
	                + " where categoryID = ?");
	        
	        pst.setInt(1, categoryID);
	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	        	subCategoryList = new ArrayList<>();
	            
	            while(rs.next())
	            {
	                QuestionSubCategory obj = new QuestionSubCategory();
	                obj.setId(rs.getInt(1));
	                obj.setSubCategoryName(rs.getString(2));
	                obj.setCategoryID(rs.getInt(3));
	                subCategoryList.add(obj);
	            }
	        }
	        
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return subCategoryList;
		
	}
	public ArrayList<QuestionSubCategory> getSubCategoriesByQuestionCategoryID(int categoryID){
		ArrayList<QuestionSubCategory> subCategoryList= null;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select * from QuestionSubCategory where categoryID = ? and occupied = 1");
	        
	        pst.setInt(1, categoryID);
	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	        	subCategoryList = new ArrayList<>();
	            
	            while(rs.next())
	            {
	                QuestionSubCategory obj = new QuestionSubCategory();
	                obj.setId(rs.getInt(1));
	                obj.setSubCategoryName(rs.getString(2));
	                obj.setCategoryID(rs.getInt(3));
	                subCategoryList.add(obj);
	            }
	        }
	        
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return subCategoryList;
		
	}
	public String getSubCategoryByQuestionSubCategoryID(int subCategoryID){
		String subCategoryName= null;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("select * from QuestionSubCategory where ID = ?");
	        
	        pst.setInt(1, subCategoryID);
	    	        
	        rs = pst.executeQuery();
	        
	        if(rs.isBeforeFirst())
	        {
	        	rs.next();
	        	subCategoryName = rs.getString(2);
	        }
	        
	        con.close();

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return subCategoryName;
		
	}




}
