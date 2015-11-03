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
@
WebServlet(name = "allMovies", urlPatterns = {
    "/allMovies"
})
public class allMovies extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	request.setAttribute("movies", Movie.getAllMovies());
    	request.setAttribute("maintenance", Maintenance.getMessages());
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/movies.jsp");
		dispatcher.forward(request, response);
}
    

    }

