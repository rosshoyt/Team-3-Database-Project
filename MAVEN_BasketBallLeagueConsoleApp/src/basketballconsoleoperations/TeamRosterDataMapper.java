package basketballconsoleoperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

public class TeamRosterDataMapper {
	
	private DatabaseConnectionInfo connectionInfo; 
	
	public TeamRosterDataMapper(DatabaseConnectionInfo connectionInfo) {
		this.connectionInfo = connectionInfo; 
	}
	
	public void viewTeamRoster(int teamID) throws Exception {
		Connection connection = DriverManager.getConnection(connectionInfo.getURL(), 
				connectionInfo.getUser(), connectionInfo.getPassword());
		
		String sql = "SELECT PLAYER.idPLAYER, PLAYER.firstName, PLAYER.lastName, TEAM.teamName " + 
				"FROM ((PLAYER_TEAM " + 
				"INNER JOIN PLAYER ON PLAYER_TEAM.player = PLAYER.idPLAYER) " + 
				"INNER JOIN TEAM ON PLAYER_TEAM.team = TEAM.idTEAM) " + 
				"WHERE TEAM.idTEAM = ? " + 
				"ORDER BY PLAYER.idPLAYER;";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, teamID);
		
		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.first() == false) {
			throw new Exception();
		} else {
			System.out.println("Team Roster for " + resultSet.getString("teamName"));
			
			do {
				System.out.println(resultSet.getString("firstName") + resultSet.getString("lastName"));
			} while (resultSet.next());
			
			System.out.println();
		}
	}
}
