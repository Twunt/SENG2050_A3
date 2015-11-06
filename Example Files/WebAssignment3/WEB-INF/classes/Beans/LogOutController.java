package Beans;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.sql.*;
import java.sql.*;
@WebServlet(name = "LogOut", urlPatterns = {"/LogOut"})

public class LogOutController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("Index");		
	}

}