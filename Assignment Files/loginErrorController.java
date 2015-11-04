import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "loginError", urlPatterns = {"/loginError"})

public class Home extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/loginError.jsp");
		dispatcher.forward(request,response);
	}
}