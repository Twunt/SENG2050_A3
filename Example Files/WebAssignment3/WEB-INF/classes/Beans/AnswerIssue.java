package Beans;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.*;
import java.sql.*;
import java.util.*;
@
WebServlet(name = "AnswerIssue", urlPatterns = {
    "/AnswerIssue"
})
public class AnswerIssue extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
    }
    

/*
    }
    	public static List<Issue>  getIssues(String state){
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
	}*/
}