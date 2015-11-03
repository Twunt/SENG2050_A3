package Beans;

import javax.sql.*;
import java.sql.*;
import javax.naming.InitialContext;

public class Config{
    private static DataSource dataSource;

    public static Connection getConnection() throws SQLException{
        return getDataSource().getConnection();
    }

    private static DataSource getDataSource(){
      if(dataSource == null){
        try{
          dataSource = (DataSource)new InitialContext().lookup("java:/comp/env/SENG2050_2015");
        }
        catch(Exception e){
          System.err.println("Could not load DataSource");
          System.err.println(e.getMessage());
        }
      }
      return dataSource;
    }
}