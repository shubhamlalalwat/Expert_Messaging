//    Author     : Prateek Haryani
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import dto.ReportedIncidentsByExpert;
import dbcon.DatabaseConnection;
// DISPLAY EXPERT INCIDENTS FOR ADMIN
public class ReportedIncidentsByExpertDAO {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public ArrayList<ReportedIncidentsByExpert> getAllIncidentsByExpert(){
		ArrayList<ReportedIncidentsByExpert> ExpertIncidentList= null;
		try {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select * from ReportedIncidentsByExperts");
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst())
            {
                ExpertIncidentList = new ArrayList<>();
                
                while(rs.next())
                {
                    ReportedIncidentsByExpert obj = new ReportedIncidentsByExpert();
                    obj.setId(rs.getInt(1));
                    obj.setIncidentDescription(rs.getString(2));
                    obj.setPostedDate(rs.getTimestamp(6)+"");
                    obj.setExpertID(rs.getString(3));
                    obj.setCustomerID(rs.getString(4));
                    obj.setQuestionID(rs.getInt(5));
                    ExpertIncidentList.add(obj);
                }
            }
            
            con.close();

			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return ExpertIncidentList;
	}
	public ArrayList<ReportedIncidentsByExpert> getAllIncidentsByExpertID(String expertID){
		ArrayList<ReportedIncidentsByExpert> ExpertIncidentList= null;
		try {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select * from ReportedIncidentsByExperts"
                    + " where expertID = ?");
            
            pst.setString(1, expertID);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst())
            {
                ExpertIncidentList = new ArrayList<>();
                
                while(rs.next())
                {
                    ReportedIncidentsByExpert obj = new ReportedIncidentsByExpert();
                    obj.setId(rs.getInt(1));
                    obj.setIncidentDescription(rs.getString(2));
                    obj.setPostedDate(rs.getTimestamp(6)+"");
                    obj.setExpertID(rs.getString(3));
                    obj.setCustomerID(rs.getString(4));
                    obj.setQuestionID(rs.getInt(5));
                    ExpertIncidentList.add(obj);
                }
            }
            
            con.close();

			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return ExpertIncidentList;
	}
	public boolean addIncidentByExpert(ReportedIncidentsByExpert object) {
		boolean b=false;
		try {
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("insert into ReportedIncidentsByExperts(incidentDescription,"
                    + "expertID,customerID,questionID) values(?,?,?,?)");
            
            pst.setString(1, object.getIncidentDescription());
            pst.setString(2, object.getExpertID());
            pst.setString(3, object.getCustomerID());
            pst.setInt(4, object.getQuestionID());
            
            int count = pst.executeUpdate();
            
            
            if(count > 0)
                b = true;
            
            con.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return b;
	}


}