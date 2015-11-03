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
	private Issue thisIssue = new Issue();
	private int isID = 0;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
    	//isID = request.getParameter("issue");
    	isID=8;
    	try {
    		Issue thisIssue = new Issue();
    		System.out.println(thisIssue.getTitle());
    		thisIssue = getThisIssue();
    		request.setAttribute("issue", thisIssue);
    		System.out.println(thisIssue.getTitle());
    		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AnswerIssue.jsp");
		dispatcher.forward(request, response);
    	}catch (SQLException e){
    		System.out.println(e);
    		//redirect to error page
    	}

    }
    	public Issue getThisIssue() throws SQLException{
		String query = "SELECT * FROM issue WHERE issueID = ?";
		try(Connection connection = Config.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);) {
        	statement.setInt(1, isID);
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
			System.out.println("GETS TO HERE OKAY");
			;
			return thisIssue;
		} else {
		}
    }
}
return null;
}
	public List<Comment>
}