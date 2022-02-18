//    Author     : Prateek Haryani
package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbcon.DatabaseConnection;
import dto.Customer;
import servercon.WebServer;

public class CustomerDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
// EMAIL ID EXIST  -------------------------------------------------------------

	public boolean checkID(String customerID)
	{
		boolean b= false;
		try {
			con = DatabaseConnection.getConnection();
			
			//-----------  SELECT * FROM customer WHERE ID = 'prateekharyani145@gmail.com';  --------------//
			pst = con.prepareStatement("SELECT * FROM customer WHERE ID = ?");
			
			pst .setString(1, customerID);
			rs = pst.executeQuery();
			if( ! (rs.isBeforeFirst() ) )
				b = true;
			con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("Duplicate Entry Check in CustomerDAO.checkID");
		}
		return b;
		
	}
	
// REGISTRATION ---------------------------------------------------------------------------------
	public boolean registerCustomer(Customer obj)
	{
		boolean b= false;
		try {
			con = DatabaseConnection.getConnection();

				String Verification_Link = WebServer.MYSERVER + "/db_Customer_Verify.jsp?customerID=" + obj.getId() ;
				boolean mailSent = MailDAO.sendMail(obj.getId()," Verification Mail From Slick "," Please click on following link to verify yourself with Slick <a href="+Verification_Link+"> VERIFY</a>");
                
				if(mailSent)
				{
					System.out.println(" Verification Mail Has been Sent to "+obj.getId());
					b= true;
				}
				else
					System.out.println("\n Verification Mail Has Not been Sent to \n"+obj.getId());
			
			
			if(b) {
			
			//INSERT INTO customer VALUES ('prateekharyani145@gmail.com','java@123','Prateek','Haryani','8962162898',0,0);  -------------------------------
			pst = con.prepareStatement("INSERT INTO customer VALUES (?,?,?,?,?,?,?)");
			
			pst.setString(1, obj.getId());
			pst.setString(2, obj.getPassword());
			pst.setString(3, obj.getFirstName());
			pst.setString(4, obj.getLastName());
			pst.setString(5, obj.getMobileNumber());
			pst.setInt(6, 0);
			pst.setInt(7, 0);
			
			int count = pst.executeUpdate();
			if(count>0)
				System.out.println(count+" Customer Updated \n");
			else {
				System.out.println("Customer Not Updated . Please Check in CustomerDAO.registerCustomer");
				b= false;
			}
			con.close();
		}
		}
		catch(Exception ex){
			ex.printStackTrace();
			System.out.println("\n Problem in Registration Check in CustomerDAO.registerCustomer \n");
		}
		return b;

	}
	//VERIFICATION-------------------------------------------------------------------------
	public boolean verifyCustomer(String customerID) {
			boolean b= false;
			try {
	            con = DatabaseConnection.getConnection();

	            // SELECT * FROM customer WHERE ID = 'prateekharyani2018@gmail.com'
	            pst = con.prepareStatement("SELECT * FROM customer WHERE ID = ? ");

	            pst.setString(1, customerID);
	            rs = pst.executeQuery();
	            if(rs.isBeforeFirst())
	            {
	                pst = con.prepareStatement("Update Customer set verified = 1 Where id = ?");
	                pst.setString(1, customerID);
	                int count = pst.executeUpdate();
	                if(count > 0) {
	                    b = true;
	        			System.out.println("Verification Done Successful ");

	                }

	            }
	            con.close();
			}
		catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("Verification Not Done . Please Check CustomerDAO.verifyCustomer");
		}
		return b;
	}
	
	
	// LOGIN ------------------------------------------------------------------------------
	public boolean checkCustomerCredentials(Customer obj) {
		boolean b = false;
		try {
			con = DatabaseConnection.getConnection();
			
			//SELECT ID FROM customer where ID = 'prateekharyani145@gmail.com' AND Password = 'java@123' AND Verified = 1 AND Blocked = 0
			pst = con.prepareStatement("SELECT ID FROM customer where ID = ? AND Password = ? AND Verified = 1 AND Blocked = 0");
			
			pst.setNString(1, obj.getId());
			pst.setString(2, obj.getPassword());
			rs = pst.executeQuery();
			if(rs.isBeforeFirst())
			{
				System.out.println("Login Successfully "+obj.getId());
				b=true;
			}
			con.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
			System.out.println("\n Problem in Login Check in CustomerDAO.checkCustomerCredentials \n");
		}
		return b;
	}
	
	// DISPLAY PROFILE-SETTING ------------------------------------------------------------------------------
	public static Customer getAllCustomerDetailsByID(Customer obj) {
		Customer customerDetails = null;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			
			// SELECT * FROM customer WHERE ID = 'prateekharyani145@gmail.com';
			String sql = "SELECT * FROM customer WHERE ID = '" +obj.getId()+ "' " ;
			
			ResultSet rs = con.prepareStatement(sql).executeQuery();
	        if(rs.next())
	        	customerDetails = new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getBoolean(6),rs.getBoolean(7));
	        con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return customerDetails;
	}

	// UPDATE PROFILE-SETTING ------------------------------------------------------------------------------
	public boolean updateCustomer(Customer obj) {
		boolean b = false;
		try {
			con = DatabaseConnection.getConnection();
			
			// UPDATE customer SET Password = 'Java123' , FirstName = 'PRATEEK' , LastName = 'HARYANI' , MobileNumber = '7000346117' WHERE ID = 'prateekharyani145@gmail.com'
			pst = con.prepareStatement("UPDATE customer SET Password = ? , FirstName = ? , LastName = ? , MobileNumber = ? WHERE ID = ?");
			
	        pst.setString(1, obj.getPassword());
	        pst.setString(2, obj.getFirstName());
	        pst.setString(3, obj.getLastName());
	        pst.setString(4, obj.getMobileNumber());
	        pst.setString(5, obj.getId());
	        
	        int count = pst.executeUpdate();
	        
	        if(count>0) {
	        	b = true;
	        	System.out.println("Profile Updated Successful");
	        }	

		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return b;
	}
	// DISPLAY CUSTOMER DETAILS FOR ADMMIN 
	public ArrayList<Customer> getAllCustomersDetails(){
		ArrayList<Customer> customerList= null;
		try {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select * from Customer where verified = true");
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst())
            {
                customerList = new ArrayList<>();
                
                while(rs.next())
                {
                    Customer obj = new Customer();
                    obj.setId(rs.getString(1));
                    obj.setPassword(rs.getString(2));
                    obj.setFirstName(rs.getString(3));
                    obj.setLastName(rs.getString(4));
                    obj.setMobileNumber(rs.getString(5));
                    obj.setBlocked(rs.getBoolean(6));
                    obj.setVerified(rs.getBoolean(7));
                    
                    customerList.add(obj);
                }
            }
            
            con.close();

			
		}
		catch(Exception ex) {
			
		}
		return customerList;
	}
	public boolean blockCustomer(String customerID) {
		boolean b= false;
		try {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("Update Customer Set blocked = true where id = ?");
            
            pst.setString(1, customerID);
            
            int count = pst.executeUpdate();
            
            if(count > 0)
                b = true;

			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}
    public boolean forgotPassword(String custid)
    {
        boolean b = false;
        
        try
        {
        String verification_link = WebServer.MYSERVER+"/Customer_NewPassword.jsp?customerID="+custid;
      	  boolean mailSent = MailDAO.sendMail(custid," Reset Password Mail From Slick "," Please click on following link to reset password yourself with Slick <a href="+verification_link+"> VERIFY</a>");
      	    if(mailSent)
              System.out.println("new password mail has been "
                  + "sent to "+custid);
          else
              System.out.println("Mail has not been "
                  + "sent to "+custid);
      	   
      	   if(mailSent)
      		   b=true;
 
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return b;
    }

	
	public boolean forgotPassword(String id , String password) {
		boolean b= false;
		try {
	        con = DatabaseConnection.getConnection();
	        
	        pst = con.prepareStatement("update customer set password = ? where id = ?");
	        
	        pst.setString(1, password);
	        pst.setString(2, id);
	        
	        int count = pst.executeUpdate();
	        
	        if(count > 0)
	            b = true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}

	

}
