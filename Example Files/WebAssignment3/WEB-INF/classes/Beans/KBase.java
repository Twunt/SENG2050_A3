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

@WebServlet(urlPatterns = {"/KBase"})
public class KBase extends HttpServlet {
	String issueType;
	String subType;
	String query= "SELECT title,issueID FROM issue";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		issueType= request.getParameter("issueType");// VARCHAR(30),
		subType= request.getParameter("subType");// VARCHAR(30),
		if((issueType.equals("null"))&&((issueType.equals("null")))){
			query = "SELECT title,issueID FROM issue where state='kBase'";
		}else if(!(issueType.equals("null"))){
			query = "SELECT title,issueID FROM issue where state='kBase' and issueType='"+issueType+"'";
		}else {
			query = "SELECT title,issueID FROM issue where state='kBase' and subType='"+subType+"'";
		}
		try{
	    	request.setAttribute("articles",getArticles(query));
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/KnowledgeBase.jsp");
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
					articles.add(article);
				}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return articles;
	}

}
