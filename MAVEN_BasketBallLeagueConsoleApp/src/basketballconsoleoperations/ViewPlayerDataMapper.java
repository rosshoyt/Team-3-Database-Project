package basketballconsoleoperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ViewPlayerDataMapper {
	
	private DatabaseConnectionInfo connectionInfo; 
	
	public ViewPlayerDataMapper(DatabaseConnectionInfo connectionInfo) {
		this.connectionInfo = connectionInfo; 
	}
	
	public void viewPlayer(int playerID) throws Exception {
		
		
		Connection connection = DriverManager.getConnection(connectionInfo.getURL(), 
				connectionInfo.getUser(), connectionInfo.getPassword());
		
		String sql = "SELECT * FROM PLAYER WHERE idPLAYER = ?"; 
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, playerID);
		
		ResultSet resultSet = statement.executeQuery();	
		
		if (resultSet.first() == false) {
			throw new Exception(); 
		} else {
			System.out.println("PlayerID: " + playerID);
			System.out.println("Name: " + resultSet.getString("firstName") + " " + resultSet.getString("lastName"));
			System.out.println("Sex: " + resultSet.getString("sex"));
			System.out.println("Date of Birth: " + resultSet.getDate("dateOfBirth").toString());
			System.out.println("Email: " +  resultSet.getString("email"));
			System.out.println();
		}
	}

	/*
	try {
		// get connection to database
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportsleagueproject", "root", "GrandSonOfAinsley1922!");
		
		// create a statement
		Statement statement = conn.createStatement();
		// execute sql query
		ResultSet rs = statement.executeQuery("SELECT * FROM PLAYER"); 
		
		// process result set
		while (rs.next()) {
			System.out.println(rs.getString("lastName") + ", " + rs.getString("firstName"));
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	*/
}
