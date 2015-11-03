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

@WebServlet(urlPatterns = {"/SubmitIssue"})
public class SubmitIssue extends HttpServlet {
	int issueID;
	String submitterID;
	String staffID;
	String state;
	String body;
	String title;
	String issueType;
	String subType;
	String location;
	boolean haveRestarted;
	boolean cableConnected;
	boolean similarIssues;
	String hardwareType;
	String macOrPc;
	String operatingSystem;
	String compType;
	String compName;
	String softwareName;
	String softwareVersion;
	String emailAddress;
	String timeOccured;
	String browser;
	String accountType;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		

		Issue myIssue = (Issue)request.getSession().getAttribute("issue");
		
		try{
	    	issueID = getIssueID();
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
		String category = request.getParameter("issueType");
		if(category.equals("hardware")){
			submitterID= request.getParameter("submitterID");//VARCHAR(16) NOT NULL
			staffID= request.getParameter("staffID");// VARCHAR(16),
			state= request.getParameter("state");// VARCHAR(10),
			body= request.getParameter("body");// text,
			title= request.getParameter("title");// VARCHAR(30),
			issueType= request.getParameter("issueType");// VARCHAR(30),
			subType= request.getParameter("subType");// VARCHAR(30),
			location= request.getParameter("location");// varchar(10),
			haveRestarted= Boolean.valueOf(request.getParameter("haveRestarted"));// boolean,
			cableConnected= Boolean.valueOf(request.getParameter("cableConnected"));// boolean,
			similarIssues= Boolean.valueOf(request.getParameter("similarIssues"));// boolean,
			hardwareType= request.getParameter("hardwareType");// varchar(20),
			macOrPc= request.getParameter("macOrPc");// varchar(3),
			operatingSystem= request.getParameter("operatingSystem");// varchar(20),
			compType= request.getParameter("compType");// varchar(10),
			compName= request.getParameter("compName");// varchar(20),
			softwareName= request.getParameter("softwareName");// varchar(30),
			softwareVersion= request.getParameter("softwareVersion");// varchar(30),
			emailAddress= request.getParameter("emailAddress");// varchar(50),
			timeOccured= getCurrentTime();// timestamp,
			browser= request.getParameter("browser");// varchar(30),
			accountType= request.getParameter("accountType");// varchar(10),
		}else if(category.equals("account")){
			submitterID= request.getParameter("submitterID");//VARCHAR(16) NOT NULL
			staffID= request.getParameter("staffID");// VARCHAR(16),
			state= request.getParameter("state");// VARCHAR(10),
			body= request.getParameter("body");// text,
			title= request.getParameter("title");// VARCHAR(30),
			issueType= request.getParameter("issueType");// VARCHAR(30),
			subType= request.getParameter("subType");// VARCHAR(30),
			location= request.getParameter("location");// varchar(10),
			haveRestarted= Boolean.valueOf(request.getParameter("haveRestarted"));// boolean,
			cableConnected= Boolean.valueOf(request.getParameter("cableConnected"));// boolean,
			similarIssues= Boolean.valueOf(request.getParameter("similarIssues"));// boolean,
			hardwareType= request.getParameter("hardwareType");// varchar(20),
			macOrPc= request.getParameter("macOrPc");// varchar(3),
			operatingSystem= request.getParameter("operatingSystem");// varchar(20),
			compType= request.getParameter("compType");// varchar(10),
			compName= request.getParameter("compName");// varchar(20),
			softwareName= request.getParameter("softwareName");// varchar(30),
			softwareVersion= request.getParameter("softwareVersion");// varchar(30),
			emailAddress= request.getParameter("emailAddress");// varchar(50),
			timeOccured= getCurrentTime();// timestamp,
			browser= request.getParameter("browser");// varchar(30),
			accountType= request.getParameter("accountType");// varchar(10),
		}else if(category.equals("email")){
			submitterID= request.getParameter("submitterID");//VARCHAR(16) NOT NULL
			staffID= request.getParameter("staffID");// VARCHAR(16),
			state= request.getParameter("state");// VARCHAR(10),
			body= request.getParameter("body");// text,
			title= request.getParameter("title");// VARCHAR(30),
			issueType= request.getParameter("issueType");// VARCHAR(30),
			subType= request.getParameter("subType");// VARCHAR(30),
			location= request.getParameter("location");// varchar(10),
			haveRestarted= Boolean.valueOf(request.getParameter("haveRestarted"));// boolean,
			cableConnected= Boolean.valueOf(request.getParameter("cableConnected"));// boolean,
			similarIssues= Boolean.valueOf(request.getParameter("similarIssues"));// boolean,
			hardwareType= request.getParameter("hardwareType");// varchar(20),
			macOrPc= request.getParameter("macOrPc");// varchar(3),
			operatingSystem= request.getParameter("operatingSystem");// varchar(20),
			compType= request.getParameter("compType");// varchar(10),
			compName= request.getParameter("compName");// varchar(20),
			softwareName= request.getParameter("softwareName");// varchar(30),
			softwareVersion= request.getParameter("softwareVersion");// varchar(30),
			emailAddress= request.getParameter("emailAddress");// varchar(50),
			timeOccured= getCurrentTime();// timestamp,
			browser= request.getParameter("browser");// varchar(30),
			accountType= request.getParameter("accountType");// varchar(10),
		}else if(category.equals("network")){
			submitterID= request.getParameter("submitterID");//VARCHAR(16) NOT NULL
			staffID= request.getParameter("staffID");// VARCHAR(16),
			state= request.getParameter("state");// VARCHAR(10),
			body= request.getParameter("body");// text,
			title= request.getParameter("title");// VARCHAR(30),
			issueType= request.getParameter("issueType");// VARCHAR(30),
			subType= request.getParameter("subType");// VARCHAR(30),
			location= request.getParameter("location");// varchar(10),
			haveRestarted= Boolean.valueOf(request.getParameter("haveRestarted"));// boolean,
			cableConnected= Boolean.valueOf(request.getParameter("cableConnected"));// boolean,
			similarIssues= Boolean.valueOf(request.getParameter("similarIssues"));// boolean,
			hardwareType= request.getParameter("hardwareType");// varchar(20),
			macOrPc= request.getParameter("macOrPc");// varchar(3),
			operatingSystem= request.getParameter("operatingSystem");// varchar(20),
			compType= request.getParameter("compType");// varchar(10),
			compName= request.getParameter("compName");// varchar(20),
			softwareName= request.getParameter("softwareName");// varchar(30),
			softwareVersion= request.getParameter("softwareVersion");// varchar(30),
			emailAddress= request.getParameter("emailAddress");// varchar(50),
			timeOccured= getCurrentTime();// timestamp,
			browser= request.getParameter("browser");// varchar(30),
			accountType= request.getParameter("accountType");// varchar(10),
		}else if(category.equals("software")){
			submitterID= request.getParameter("submitterID");//VARCHAR(16) NOT NULL
			staffID= request.getParameter("staffID");// VARCHAR(16),
			state= request.getParameter("state");// VARCHAR(10),
			body= request.getParameter("body");// text,
			title= request.getParameter("title");// VARCHAR(30),
			issueType= request.getParameter("issueType");// VARCHAR(30),
			subType= request.getParameter("subType");// VARCHAR(30),
			location= request.getParameter("location");// varchar(10),
			haveRestarted= Boolean.valueOf(request.getParameter("haveRestarted"));// boolean,
			cableConnected= Boolean.valueOf(request.getParameter("cableConnected"));// boolean,
			similarIssues= Boolean.valueOf(request.getParameter("similarIssues"));// boolean,
			hardwareType= request.getParameter("hardwareType");// varchar(20),
			macOrPc= request.getParameter("macOrPc");// varchar(3),
			operatingSystem= request.getParameter("operatingSystem");// varchar(20),
			compType= request.getParameter("compType");// varchar(10),
			compName= request.getParameter("compName");// varchar(20),
			softwareName= request.getParameter("softwareName");// varchar(30),
			softwareVersion= request.getParameter("softwareVersion");// varchar(30),
			emailAddress= request.getParameter("emailAddress");// varchar(50),
			timeOccured= getCurrentTime();// timestamp,
			browser= request.getParameter("browser");// varchar(30),
			accountType= request.getParameter("accountType");// varchar(10),
		}else {
			submitterID= request.getParameter("submitterID");//VARCHAR(16) NOT NULL
			staffID= request.getParameter("staffID");// VARCHAR(16),
			state= request.getParameter("state");// VARCHAR(10),
			body= request.getParameter("body");// text,
			title= request.getParameter("title");// VARCHAR(30),
			issueType= request.getParameter("issueType");// VARCHAR(30),
			subType= request.getParameter("subType");// VARCHAR(30),
			location= request.getParameter("location");// varchar(10),
			haveRestarted= Boolean.valueOf(request.getParameter("haveRestarted"));// boolean,
			cableConnected= Boolean.valueOf(request.getParameter("cableConnected"));// boolean,
			similarIssues= Boolean.valueOf(request.getParameter("similarIssues"));// boolean,
			hardwareType= request.getParameter("hardwareType");// varchar(20),
			macOrPc= request.getParameter("macOrPc");// varchar(3),
			operatingSystem= request.getParameter("operatingSystem");// varchar(20),
			compType= request.getParameter("compType");// varchar(10),
			compName= request.getParameter("compName");// varchar(20),
			softwareName= request.getParameter("softwareName");// varchar(30),
			softwareVersion= request.getParameter("softwareVersion");// varchar(30),
			emailAddress= request.getParameter("emailAddress");// varchar(50),
			timeOccured= getCurrentTime();// timestamp,
			browser= request.getParameter("browser");// varchar(30),
			accountType= request.getParameter("accountType");// varchar(10),
		}
		try{
	    	addIssue();
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
	}

	public int getIssueID() throws SQLException {
  		int numberOfIssues =0;
    	String query = "SELECT COUNT(*) FROM issue";
    	try(Connection connection = Config.getConnection();
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);){
      	result.next();
        numberOfIssues = result.getInt(1);
      }catch (SQLException e){
    System.out.println(e);
    }
        
    return numberOfIssues + 1;
  }
  
	public void addIssue() throws SQLException {
    String query = "INSERT INTO issue VALUES(?,'?','?','?','?','?','?','?','?',?,?,?,'?','?','?','?','?','?','?','?','?','?','?');";
		try(Connection connection = Config.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);) {
        	statement.setInt(1, issueID);
        	statement.setString(2, submitterID);
        	statement.setString(3, staffID);
        	statement.setString(4, state);
        	statement.setString(5, body);
        	statement.setString(6, title);
        	statement.setString(7, issueType);
        	statement.setString(8, subType);
        	statement.setString(9, location);
        	statement.setBoolean(10, haveRestarted);
        	statement.setBoolean(11, cableConnected);
        	statement.setBoolean(12, similarIssues);
        	statement.setString(13, hardwareType);
        	statement.setString(14, macOrPc);
        	statement.setString(15, operatingSystem);
        	statement.setString(16, compType);
        	statement.setString(17, compName);
        	statement.setString(18, softwareName);
        	statement.setString(19, softwareVersion);
        	statement.setString(20, emailAddress);
        	statement.setString(21, timeOccured);
        	statement.setString(22, browser);
        	statement.setString(23, accountType);
        	try(ResultSet rs = statement.executeQuery();){

          }catch (Exception e){
            System.out.println(e);}
    }catch (SQLException e){
    System.out.println(e);
    }
    	
	}

	public String getCurrentTime(){
		
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
      return time;
    }

}
