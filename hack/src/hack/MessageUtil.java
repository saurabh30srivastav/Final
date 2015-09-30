package hack;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

public class MessageUtil {

	 String user="",pass="",msg="";
	
	 public MessageUtil(String user,String pass) {
   this.user=user;
   this.pass=pass;
  
   }
	
	
	public String check() throws SQLException
	{	try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
			return("false");

		}

		System.out.println("Oracle JDBC Driver Registered!");

		Connection connection = null;

		try {

			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");

		} catch (SQLException e) {

			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return("false");

		}
         System.out.println("Test Case Result");
		if (connection != null) {
			//System.out.println("hackathon");
			PreparedStatement st= connection.prepareStatement("select *  from hemp where empid=? and pswd=?");
			st.setString(1,user);
			st.setString(2,pass);
			ResultSet rs=st.executeQuery();
			
			
			while(rs.next())
			{
				msg="true";
				connection.close();
				return(msg);
			}
			System.out.println("You made it, take control your database now!");
		} else {
			System.out.println("Failed to make connection!");
		}
		connection.close();
		return ("false");
		
	}

}
