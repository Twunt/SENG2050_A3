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

@WebServlet(urlPatterns = {"/AddToKB"})
public class AddToKB extends HttpServlet {
	private int issueID;
	private int commentID;
	private String userID;
	private String body;
	private String time;
	private String currentPage;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		 
			issueID= Integer.parseInt(request.getParameter("issueID"));// VARCHAR(30),
			String query = "UPDATE issue SET state= 'kBase' where issueID ='"+issueID+"'"; 


		try{
	    	add(query);

	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home");
			dispatcher.forward(request, response);
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
	}

	public void add(String query) throws SQLException{
		
		try(Connection connection = Config.getConnection();
			Statement statement = connection.createStatement();
			){
			statement.executeUpdate(query);
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
	}
}
