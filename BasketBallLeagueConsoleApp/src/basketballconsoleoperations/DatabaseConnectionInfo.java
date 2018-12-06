package basketballconsoleoperations;

public class DatabaseConnectionInfo {
	
	private String url;  
	private String user; 
	private String password; 
	
	public DatabaseConnectionInfo(String user, String password) {
		this.user = user; 
		this.password = password; 
		this.url = "jdbc:mysql://localhost:3306/amateurbasketballleagueproject";
	}
	
	public String getURL() {
		return url; 
	}
	
	public String getUser() {
		return user; 
	}
	
	public String getPassword() {
		return password; 
	}
}


