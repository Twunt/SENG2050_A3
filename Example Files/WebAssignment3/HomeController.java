import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Home", urlPatterns = {"/Home"})

public class Home extends HttpServlet {
	User thisUser = (User)request.getSession.getAttribute("user");
	string userID = thisUser.getID();
	String query = "SELECT title,issueID FROM issue where userID ='"+userID+"'";
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setAttribute("issues", user.getArticles(query));
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Home.jsp");
		dispatcher.forward(request,response);

		// User thisUser = (User)request.getSession.getAttribute("user");
		// string userRole = thisUser.getRole();
		// if (userRole.equals("user")){
		// 	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Home.jsp");
		// 	dispatcher.forward(request,response);
		// }
		// else{
		// 	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/staffHome.jsp");
		// 	dispatcher.forward(request,response);
		// }
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