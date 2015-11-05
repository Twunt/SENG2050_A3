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

@WebServlet(urlPatterns = {"/SubmitComment"})
public class SubmitComment extends HttpServlet {
	private int issueID;
	private int commentID;
	private String userID;
	private String body;
	private String time;
	private String currentPage;

	public SubmitComment(){
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try{
			currentPage = request.getParameter("currentPage");
			issueID= Integer.parseInt(request.getParameter("issueID"));// VARCHAR(30),
			commentID = getCommentID();
			userID= request.getParameter("userID");
			body = request.getParameter("commentBody");
			time = getCurrentTime();
	    }catch (SQLException e){
	    	System.out.println(e);
	    }

		try{
	    	addComment();
<<<<<<< HEAD
=======
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/"+currentPage+"?issueID="+issueID);
			dispatcher.forward(request, response);
>>>>>>> 5b7f8496b494054d1feb6398a75a53d313bc9637
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
	}

	public List<Comment> getComments(String query) throws SQLException{
		List<Comment> comments = new LinkedList<>();
		try(Connection connection = Config.getConnection();
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(query);){
				while(result.next()){
					Comment comment = new Comment();
					comment.setUserName(result.getString(1));
					comment.setBody(result.getString(2));
					comment.setTime(result.getString(3));
					comments.add(comment);
				}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return comments;
	}

	public int getCommentID() throws SQLException {
  		int numberOfIssues =0;
    	String query = "SELECT COUNT(*) FROM userComment";
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

  public void addComment() throws SQLException {
    String update = "INSERT INTO userComment VALUES(?,?,?,?,?);";
		try(Connection connection = Config.getConnection();
        PreparedStatement statement = connection.prepareStatement(update);) {
        	statement.setInt(1, commentID);
        	statement.setString(2, userID);
        	statement.setInt(3, issueID);
        	statement.setString(4, body);
        	statement.setString(5, time);
	        try{
				statement.executeUpdate();
	        }catch (Exception e){
	           	System.out.println(e);
	        }
    	}catch (SQLException e){
    		System.out.println(e);
    	}
	}

	public String getCurrentTime(){
		
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
      return time;
    }

}
