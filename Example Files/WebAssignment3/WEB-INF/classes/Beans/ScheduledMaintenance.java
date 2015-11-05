package Beans;
import java.io.*;
import javax.servlet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.*;
import java.util.Calendar;
import javax.sql.*;
import java.sql.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = {"/ScheduledMaintenance"})
public class ScheduledMaintenance extends HttpServlet {
	String currentTime = getCurrentTime();
	String query;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {	
	System.out.println(currentTime);
		query = "SELECT message,startTime,endTime FROM maintenance "+
		"where '"+currentTime+"' between startTime and endTime ";
		try{
	    	request.setAttribute("maintenances",getMaintenance(query));
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LogInPage.jsp");
		dispatcher.forward(request, response);
	}

	public List<MaintMessage> getMaintenance(String query) throws SQLException{
		List<MaintMessage> maintenances = new LinkedList<>();
		try(Connection connection = Config.getConnection();
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(query);){
				while(result.next()){
					MaintMessage maintenance = new MaintMessage();
					maintenance.setMessage(result.getString(1));
					maintenance.setStartTime(result.getString(2));
					maintenance.setEndTime(result.getString(3));
					maintenances.add(maintenance);
				}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return maintenances;
	}

	public String getCurrentTime(){
		
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
      return time;
    }

}
