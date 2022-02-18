//    Author     : Prateek Haryani

package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	public static Connection getConnection() {
		Connection con = null;
		try {
			
			Class.forName(DatabaseDetails.DRIVER);
			con = DriverManager.getConnection(DatabaseDetails.CONSTR,DatabaseDetails.USER,DatabaseDetails.PASS);
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return con;
	}

}
