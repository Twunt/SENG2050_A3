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
WebServlet(name = "Auth", urlPatterns = {
    "/Auth"
})
public class Auth extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	String enterID = request.getParameter("userID");
    	String enterPass = request.getParameter("userPassword");
    	User logInUser=null;
    	try{
			logInUser = logIn(enterPass, enterID);
		}catch(SQLException e){
			System.out.println(e);
		}
		if (logInUser!=null){
			request.getSession().setAttribute("user", logInUser);
			response.sendRedirect("Home");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
			//dispatcher.forward(request, response); 
		} else{
			request.getSession().invalidate();
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/loginError.jsp");
			dispatcher.forward(request, response);
		}
	}

     	public User logIn(String pass, String uID) throws SQLException{
		String query = "SELECT * FROM irsUser WHERE userID = ? AND userPassword = ?";
		try(Connection connection = Config.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);) {
        	statement.setString(1, uID);
        	statement.setString(2, pass);
        	try(ResultSet rs = statement.executeQuery();){
		if (rs.next()){
			User logInUser = new User();
			logInUser.setID(rs.getString(1));
			logInUser.setName(rs.getString(2));
			logInUser.setRole(rs.getString(4));
			return logInUser;
		} else {
		}
    }
}
return null;
}
}
