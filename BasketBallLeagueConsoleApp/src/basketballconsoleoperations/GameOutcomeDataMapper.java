package basketballconsoleoperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GameOutcomeDataMapper {
	
	private DatabaseConnectionInfo connectionInfo; 
	
	public GameOutcomeDataMapper(DatabaseConnectionInfo connectionInfo) {
		this.connectionInfo = connectionInfo; 
	}
	
	public void viewGameOutcome(int gameID) throws Exception {
		Connection connection = DriverManager.getConnection(connectionInfo.getURL(), 
				connectionInfo.getUser(), connectionInfo.getPassword());
		
		String sql = "SELECT GAME_TEAM.score, GAME_TEAM.match, TEAM.teamName " + 
				"FROM GAME_TEAM " + 
				"INNER JOIN TEAM ON GAME_TEAM.team = TEAM.idTEAM " + 
				"WHERE GAME_TEAM.score IS NOT NULL && GAME_TEAM.match = ?;";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, gameID);
		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.first() == false) {
			throw new Exception(); 
		} else {	
			
			System.out.println("GAMEID: " + gameID);
			for (int i = 1; i <= 2; i++) {
				System.out.println("Team " + i + ": " + resultSet.getString("teamName") + "  Score: " + resultSet.getString("score"));
				resultSet.next();
			}
			System.out.println();
		}
	}
	
	
}
