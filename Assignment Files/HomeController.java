import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Home", urlPatterns = {"/Home"})

public class Home extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		User thisUser = (User)request.getSession.getAttribute("user");
		string userRole = thisUser.getRole();
	}
}