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

@WebServlet(urlPatterns = {"/ChangeState"})
public class ChangeState extends HttpServlet {
	private int issueID;
	private String nextState;
	private String currentPage;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		currentPage = request.getParameter("currentPage");
		issueID= Integer.parseInt(request.getParameter("issueID"));// VARCHAR(30),
		nextState= request.getParameter("nextState");

		try{
	    	ChangeState();

	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/"+currentPage+"?issueID="+issueID);
			dispatcher.forward(request, response);
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
	}

	public void ChangeState() throws SQLException{
		String query = "UPDATE issue SET state = '"+nextState+"'' WHERE issueID = '"+issueID+"'";
		try(Connection connection = Config.getConnection();
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(query);){
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
	}

}
