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

@WebServlet(urlPatterns = {"/KBArticle"})
public class KBArticle extends HttpServlet {
	private int issueID;
	private String query;
	private Issue thisIssue = new Issue();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		issueID= Integer.parseInt(request.getParameter("issueID"));// VARCHAR(30),
		query = "SELECT u.userName,c.commentBody,c.timePosted FROM userComment c INNER JOIN irsUser u ON u.userID=c.userID AND c.issueID='"+issueID+"'";
		try {
    		Issue thisIssue = new Issue();
    		thisIssue = getThisIssue();
    		User currentUser = (User)request.getSession().getAttribute("user");
    		System.out.println(currentUser.getID());
    		request.setAttribute("user", currentUser);
    		request.setAttribute("issue", thisIssue);
    	}catch (SQLException e){
    		System.out.println(e);
    		//redirect to error page
    	}

		try{
	    	request.setAttribute("comments",getComments(query));
	    }catch (SQLException e){
	    	System.out.println(e);
	    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/KBArticle.jsp");
		dispatcher.forward(request, response);
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

	public Issue getThisIssue() throws SQLException{
		String query = "SELECT * FROM issue WHERE issueID = ?";
		try(Connection connection = Config.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);) {
        	statement.setInt(1, issueID);
        	try(ResultSet rs = statement.executeQuery();){
		if (rs.next()){
			thisIssue.setIssueID(rs.getInt(1));
			thisIssue.setSubmitterID(rs.getString(2));
			thisIssue.setStaffID(rs.getString(3));
			thisIssue.setStateID(rs.getString(4));
			thisIssue.setBody(rs.getString(5));
			thisIssue.setTitle(rs.getString(6));
			thisIssue.setIssueType(rs.getString(7));
			thisIssue.setSubType(rs.getString(8));
			thisIssue.setLocation(rs.getString(9));
			thisIssue.setRestarted(rs.getBoolean(10));
			thisIssue.setCableConnected(rs.getBoolean(11));
			thisIssue.setSimilarIssues(rs.getBoolean(12));
			thisIssue.setHardwareType(rs.getString(13));
			thisIssue.setSystem(rs.getString(14));
			thisIssue.setOS(rs.getString(15));
			thisIssue.setCompType(rs.getString(16));
			thisIssue.setCompName(rs.getString(17));
			thisIssue.setSoftwareName(rs.getString(18));
			thisIssue.setSoftwareVersion(rs.getString(19));
			thisIssue.setEmailAddress(rs.getString(20));
			thisIssue.setTimeOccurred(rs.getTimestamp(21));
			thisIssue.setBrowser(rs.getString(22));
			thisIssue.setAccountType(rs.getString(23));
				return thisIssue;
				}else {
				}
		    }
		}
		return null;
	}

}
