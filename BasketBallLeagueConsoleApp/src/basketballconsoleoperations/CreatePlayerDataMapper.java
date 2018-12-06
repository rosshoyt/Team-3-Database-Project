package basketballconsoleoperations;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.swing.text.DateFormatter;

import com.mysql.cj.util.Util;

public class CreatePlayerDataMapper {
	
	private DatabaseConnectionInfo connectionInfo; 
	
	CreatePlayerDataMapper(DatabaseConnectionInfo connectionInfo) {
		this.connectionInfo = connectionInfo; 
	}
	
	// Attempts to insert a new player into the database
	public int addPlayer(String firstName, String lastName, String DOB, String sex, String email) throws SQLException, ParseException {
				
		// convert string DOB to sql date type 
		SQLDateFormatter sqlDateFormatter = new SQLDateFormatter();
		java.sql.Date dateOfBirth = sqlDateFormatter.getJavaSqlDate(DOB);
		
		// create connection to database
		Connection connection = DriverManager.getConnection(connectionInfo.getURL(), 
				connectionInfo.getUser(), connectionInfo.getPassword());
		
		// sql query
		String sql = "INSERT INTO PLAYER (firstName, lastName, dateOfBirth, sex, email) VALUES (?,?,?,?,?)";
		
		// add parameters to query
		PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, firstName);
		statement.setString(2, lastName);
		statement.setDate(3, dateOfBirth);
		statement.setString(4, sex);
		statement.setString(5, email);
		
		// execute query
		statement.executeUpdate();
		
		// return id of inserted row 
		ResultSet resultSet = statement.getGeneratedKeys();
		if (resultSet.next()) {
			return resultSet.getInt(1);
		} 
			
		return -1; // should not get here; this means that insert wasn't successful, and no sql errors 
	}
	

}
