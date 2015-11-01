package Beans;

import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable; 

public class Maintenance implements Serializable{
	private String maintString;
	private Calendar startTime;
	private Calendar endTime;
	private Calendar currTime;
	public Maintenance(){
		maintString = "";
		currTime = Calendar.getInstance();
	}
		public void setMessage(String s){
			maintString = s;
		}
		public void setSTime(Time st){
			startTime.setTimeInMillis(st.getTime());
		}
		public void setETime(Time et){
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
				// you should be validating the following,
				// this is just an example to get you started
				maint.setMessage(result.getString(2));
				maint.setSTime(result.getTime(3));
				maint.setETime(result.getTime(4));
				maintList.add(maint);
			}
		}		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return maintList;
	}



	}