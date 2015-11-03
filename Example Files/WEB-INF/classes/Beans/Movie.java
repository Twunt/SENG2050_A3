package Beans;

import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable;

public class Movie implements Serializable{
	private String name;
	private int year;
	private String url;
	public Movie(){
		name="";
		year=0;
		url="";
	}

	public void setName(String s){
		name = s;
	}
	public void setYear(int y){
		year = y;
	}
	public void setUrl(String u){
		url = u;
	}
	public String getName(){
		return name;
	}
	public String getUrl(){
		return url;
	}
	public int getYear(){
		return year;
	}
	public static List<Movie> getAllMovies(){
		String query = "SELECT * FROM movie";
		List<Movie> movies = new LinkedList<>();
		try(Connection connection = Config.getConnection(); //step 1
		Statement statement = connection.createStatement(); //step 2
		ResultSet result = statement.executeQuery(query);){ //step 3 and 4
			while(result.next()){ //step 5
				Movie movie = new Movie();
				// you should be validating the following,
				// this is just an example to get you started
				movie.setName(result.getString(1));
				movie.setYear(result.getDate(2).getYear());
				movie.setUrl(result.getString(3));
				movies.add(movie);
			}
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		
		return movies;
	}
	
}