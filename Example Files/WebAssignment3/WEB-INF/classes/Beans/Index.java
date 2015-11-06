package Beans;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
@WebServlet(name = "Index", urlPatterns = {"/Index"})

public class Index extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		User currUser = (User)request.getSession().getAttribute("user");
		if (currUser==null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LogInPage.jsp");
			dispatcher.forward(request,response);
		}
		else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home");
			dispatcher.forward(request,response);
		}		
	}
	}