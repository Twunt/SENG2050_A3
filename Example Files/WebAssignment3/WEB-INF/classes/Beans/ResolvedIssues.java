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

@WebServlet(urlPatterns = {"/ResolvedIssues"})
public class ResolvedIssues extends HttpServlet {
	String query= "SELECT title,issueID FROM issue";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
			query = "SELECT title,issueID, state FROM issue where state='resolved'";
		try{
	    	request.setAttribute("articles",getArticles(query));
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ResolvedIssues.jsp");
		dispatcher.forward(request, response);
	}

	public List<Issue> getArticles(String query) throws SQLException{
		List<Issue> articles = new LinkedList<>();
		try(Connection connection = Config.getConnection();
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(query);){
				while(result.next()){
					Issue article = new Issue();
					article.setTitle(result.getString(1));
					article.setIssueID(result.getInt(2));
					article.setStateID(result.getString(3));
					articles.add(article);
				}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return articles;
	}

}
