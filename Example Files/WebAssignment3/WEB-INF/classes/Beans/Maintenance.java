package Beans;

import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable; 
import java.text.SimpleDateFormat;
public class Maintenance implements Serializable{
	private String maintString;
	private Calendar startTime;
	private Calendar endTime;
	private Calendar currTime;
	public Maintenance(){
		maintString = "";
		currTime = Calendar.getInstance();
		startTime = Calendar.getInstance();
		endTime = Calendar.getInstance();
	}
		public void setMessage(String s){
			maintString = s;
		}
		public void setSTime(Timestamp st){
			startTime.setTimeInMillis(st.getTime());
		}
		public void setETime(Timestamp et){
			endTime.setTimeInMillis(et.getTime());
		}
	public static List<Maintenance>  getMessages(){
		String query = "SELECT * FROM maintenance";
		List<Maintenance> maintList = new LinkedList<>();
		try(Connection connection = Config.getConnection();
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);){ //step 3 and 4
			while(result.next()){ //step 5
				Maintenance maint = new Maintenance();
				maint.setMessage(result.getString(2));
				maint.setSTime(result.getTimestamp(3));
				maint.setETime(result.getTimestamp(4));
				maintList.add(maint);
			}
		}		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return maintList;
	}
	public String getMessage(){
		return maintString;
	}
	public String getStart(){
		String sTime = new SimpleDateFormat("dd-MM-yy ss-mm-HH").format(startTime.getTime());
		return sTime;
	}
	public String getEnd(){
		String eTime = new SimpleDateFormat("dd-MM-yy ss-mm-HH").format(endTime.getTime());
		return eTime;
	}

	}