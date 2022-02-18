//    Author     : Prateek Haryani

package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

import dbcon.DatabaseConnection;
import dto.Admin;
import dto.Expert;
public class AdminDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

// LOGIN -------------------------------------------------------------
	public boolean checkAdminCredentials(Admin object) {
		boolean b= false;
		try {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("SELECT * FROM Admin WHERE "
                    + "id = ? and password = ?");
            
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

public boolean forgotPassword(String adminID)
{
    boolean b = false;
    
    try
    {
        con = DatabaseConnection.getConnection();
        
        String genpass = UUID.randomUUID().toString().substring(0, 5);
        
            pst = con.prepareStatement("UPDATE Admin SET password = ? WHERE id = ?");
            pst.setString(1, genpass);
            pst.setString(2, adminID);
            
            int count = pst.executeUpdate();
            
            if(count > 0)
            {
            boolean mailSent = MailDAO.sendMail(adminID, "New password from ExpertMessaging", "This is your new password  : "+genpass);
            
            if(mailSent) {
                System.out.println("new password mail has been sent to "+adminID);
                b =true;
            }
            else
                System.out.println("Mail has not been sent to "+adminID);
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