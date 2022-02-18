//    Author     : Prateek Haryani
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import dbcon.DatabaseConnection;
import dto.Expert;

public class ExpertDAO {
Connection con;
PreparedStatement pst;
ResultSet rs;
public ArrayList<Expert> getAllExpertsDetails(){
	ArrayList<Expert> expertList= null;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("select * from Expert");
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            expertList = new ArrayList<>();
            
            while(rs.next())
            {
                Expert obj = new Expert();
                obj.setId(rs.getString(1));
                obj.setPassword(rs.getString(2));
                obj.setBlocked(rs.getBoolean(3));
                obj.setCategoryID(rs.getInt(4));
                obj.setSubCategoryID(rs.getInt(5));
                
                expertList.add(obj);
            }
        }
        
        con.close();

		
	}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return expertList;
}

public boolean registerExpert(Expert object) {
	boolean b= false;
	try {
        
            con = DatabaseConnection.getConnection();

            String genpass = UUID.randomUUID().toString().substring(0, 5);            
            
            pst = con.prepareStatement("insert into Expert values(?,?,?,?,?)");
            
            pst.setString(1, object.getId());
            pst.setString(2, genpass);
            pst.setBoolean(3, false);
            pst.setInt(4, object.getCategoryID());
            pst.setInt(5, object.getSubCategoryID());
            
            int count = pst.executeUpdate();
            
            if(count > 0)
            {
                boolean mailSent = MailDAO.sendMail(object.getId(), 
"Registration Mail From ExpertMessaging", 
"Congrulations!!! <br> Dear Expert,<br>Your account has been created on Slick. <br>Following is your login id and "
        + "password : <br> "
        + "<b> login-id : "+object.getId()+"</b><br>"+
        "<b> password : "+genpass+"</b>");
                
                if(mailSent)
                {
                    System.out.println("registration mail has been "
                        + "sent to "+object.getId());
                    b = true;
                }
                else
                    System.out.println("registration mail has not been "
                        + "sent to "+object.getId());
            }
            
            con.close();

		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return b;
}
public String getExpertByCategorySubCategory(int categoryID,int subCategoryID) {
	String expertID= "";
	try {
         con = DatabaseConnection.getConnection();
         
         pst = con.prepareStatement("Select id From Expert Where categoryID = ? AND subCategoryID = ?");
         
         pst.setInt(1, categoryID);
         pst.setInt(2, subCategoryID);
         
         rs = pst.executeQuery();
         
         if(rs.isBeforeFirst())
         {
             rs.next();
             expertID = rs.getString("id");
         }

		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return expertID;		
}
public boolean checkExpertCredentials(Expert object) {
	boolean b= false;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("SELECT * FROM Expert WHERE id = ? and password = ? and blocked = false");
        
        pst.setString(1, object.getId());
        pst.setString(2, object.getPassword());
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
            b = true;
        
        con.close();

		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return b;
}

public boolean updateExpert(Expert obj) {
	boolean b= false;
	try {
	    con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("update expert set password = ? where id = ? ");
        
         pst.setString(1, obj.getPassword());
         pst.setString(2, obj.getId());
         
        int count = pst.executeUpdate();
        
        if(count > 0)
            b = true;

		
	}
	catch(Exception ex) {
		ex.printStackTrace();
	}
	return b;
}

public Expert getAllDataById(String expertID) {
	Expert expert= null;
	try {
        con = DatabaseConnection.getConnection(); 
        
        pst = con.prepareStatement("select * from expert where id = ?");
        
        pst.setString(1, expertID);
        
        rs = pst.executeQuery();
        
        if(rs.isBeforeFirst())
        {
            if(rs.next())
            {  
                expert = new Expert();
                expert.setId(rs.getString(1));
                expert.setPassword(rs.getString(2));
                expert.setBlocked(rs.getBoolean(3));
                expert.setCategoryID(rs.getInt(4));
                expert.setSubCategoryID(rs.getInt(5));
             }
        }
		
	}
	catch(Exception ex){
		ex.printStackTrace();
	}
	return expert;
	
}
public boolean blockExpert(String expertID) {
	boolean b= false;
	try {
        con = DatabaseConnection.getConnection();
        
        pst = con.prepareStatement("Update Expert Set blocked = true where id = ?");
        
        pst.setString(1, expertID);
        
        int count = pst.executeUpdate();
        
        if(count > 0)
            b = true;

	}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}
public boolean forgotPassword(Expert obj)
{
    boolean b = false;
    
    try
    {
        con = DatabaseConnection.getConnection();
        
        String genpass = UUID.randomUUID().toString().substring(0, 5);
        
            pst = con.prepareStatement("UPDATE Expert SET password = ?"
                    + " WHERE id = ? and blocked = false");
            pst.setString(1, genpass);
            pst.setString(2, obj.getId());
            
            int count = pst.executeUpdate();
            
            if(count > 0)
            {
            boolean mailSent = MailDAO.sendMail(obj.getId(), 
"New password from ExpertMessaging", "This is your new password  : "+genpass);
            
            if(mailSent)
                System.out.println("new password mail has been "
                    + "sent to "+obj.getId());
            else
                System.out.println("Mail has not been "
                    + "sent to "+obj.getId());
            
            if(mailSent)
                b = true;
            
            }
        con.close();
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    
    return b;
}






}
