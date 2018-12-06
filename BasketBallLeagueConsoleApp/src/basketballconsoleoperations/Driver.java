package basketballconsoleoperations;

import java.sql.*;

import java.util.*;

import javax.naming.InitialContext;

import java.io.Console;

public class Driver {
	public static void main(String[] args) {
		
		String userCommand = ""; 
		Scanner scanner = new Scanner(System.in);
		DatabaseConnectionInfo databaseConnectionInfo = initialSetUp(); // use this to establish database connections 
		
		while (!userCommand.equals("q") && !userCommand.equals("quit")) {
			showMainMenu();
			userCommand = scanner.next();
			DelegateCommand(userCommand, databaseConnectionInfo);
		}
	}
	
	// Sets up the console session by obtaining 
	// database connection info 
	public static DatabaseConnectionInfo initialSetUp() {
		boolean connectionSuccessful = false; 
		String validUserName = ""; 
		String validPassword = ""; 
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Welcome to the amateur basketball league demo! Lets get set up.");
		System.out.println();
		
		while (!connectionSuccessful) {
			
			// obtain username and password 
			
			System.out.print("Enter username for database (hint: enter 'root'): ");
			String userName = scanner.next();
			System.out.print("Enter password: ");
			//Console console = System.console();
			//char[] passwordHidden = console.readPassword();
			String password = scanner.next();
			
			try {
				
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/amateurbasketballleagueproject", userName, password);
				
				// if connection succeeds, do this stuff
				// if it fails, these lines of code will not execute
				System.out.println("Connection successful!");
				System.out.println();
				connectionSuccessful = true; 
				validUserName = userName; 
				validPassword = password; 
				
			} catch (Exception ex) {
				System.out.println("Connection unsuccessful. Try again?");
				System.out.print("('y' for yes, anything else to quit application)");
				String input = scanner.next();
				if (!input.equals("y")) {
					System.exit(0);
				}
			}
		}
		return new DatabaseConnectionInfo(validUserName, validPassword);
	}
	
	// Simply displays main menu of app 
	public static void showMainMenu() {
		System.out.println("MAIN MENU: Please select one of the options below to continue:");
		System.out.println();
		System.out.println("1) Create New Player"); 
		System.out.println("2) View Player Info");
		System.out.println("3) View Game Outcome");
		System.out.println("4) View Team Roster"); 
		System.out.println();
		System.out.print("Type '1', '2', '3', or '4' to continue. Type 'q' or 'quit' to quit: ");
	}
	
	// parses out command from user and then delegates action
	public static void DelegateCommand(String s, DatabaseConnectionInfo connectionInfo) {
		if (s.equals("1")) {
			createNewPlayer(connectionInfo);
		} else if (s.equals("2")) {
			viewPlayerInfo(connectionInfo);
		} else if (s.equals("3")) {
			viewGameOutcome(connectionInfo);
		} else if (s.equals("4")) {
			viewTeamRoster(connectionInfo);
		} else if (s.equals("q") || s.equals("quit")) {
			System.out.println();
			System.out.println("Goodbye");
			System.exit(0);
		} else { // bad command
			System.out.println();
			System.out.println("Bad command, please try again.");
			System.out.println();
		}
	}
	
	
	public static void createNewPlayer(DatabaseConnectionInfo connectionInfo) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.println();
		System.out.println("You will be asked to enter the first name, last name, "
				+ "date of birth, sex, and email for the new player");
		System.out.println();
		
		while (true) {
			System.out.print("First name (45 characters max): ");
			String firstName = scanner.next();
			
			System.out.print("Last name (45 characters max): "); 
			String lastName = scanner.next();
			
			System.out.print("Date of birth (yyyy-MM-dd); ");
			String DOB = scanner.next(); 
			
			System.out.print("Sex ('M' or 'F'): ");
			String sex = scanner.next();
			
			System.out.print("Email (90 characters max): "); 
			String email = scanner.next();
			
			try {
				CreatePlayerDataMapper createPlayerDataMapper = new CreatePlayerDataMapper(connectionInfo);
				int newPlayerID = createPlayerDataMapper.addPlayer(firstName, lastName, DOB, sex, email);
				System.out.println();
				System.out.println("New Player successfully added! Id = " + newPlayerID);
				System.out.print("Type anything and press 'enter' to return to main menu.");
				scanner.next();
				System.out.println();
				break; 
			} catch (Exception ex) {
				System.out.print("Something went wrong. Try again? ");
				System.out.print("('y' for yes, anything else to return to main menu) ");
				String input = scanner.next();
				System.out.println();
				if (!input.equals("y")) {
					break; 
				}
			}
		}
	}
	
	public static void viewPlayerInfo(DatabaseConnectionInfo connectionInfo) {
		Scanner scanner = new Scanner(System.in);
		String id = "";
		while (true) {
			try {
				System.out.println();
				System.out.print("Please enter a player id to view their profile: ");
				id = scanner.next();	
				int playerID = Integer.parseInt(id);
				System.out.println();
				ViewPlayerDataMapper viewPlayerDataMapper = new ViewPlayerDataMapper(connectionInfo);
				viewPlayerDataMapper.viewPlayer(playerID);
				System.out.print("Type anything and press 'enter' to continue: ");
				scanner.next(); 
				System.out.println();
				break; 
			} catch (Exception ex) {
				System.out.println("Player with id " + id + " not found. Try again? ");
				System.out.println("('y' for yes, anything else to return to main menu) ");
				String input = scanner.next(); 
				System.out.println();
				if (!input.equals("y")) {
					break; 
				}
			}
		}
	}

	public static void viewGameOutcome(DatabaseConnectionInfo connectionInfo) {
		Scanner scanner = new Scanner(System.in);
		String id = ""; // initialize variable
		while (true) {
			try {
				System.out.println();
				System.out.print("Please enter GameID to view match outcome: ");
				id = scanner.next();
				int gameID = Integer.parseInt(id);
				System.out.println();
				GameOutcomeDataMapper gameOutcomeDataMapper = new GameOutcomeDataMapper(connectionInfo);
				gameOutcomeDataMapper.viewGameOutcome(gameID);
				System.out.print("Type anything and press 'enter' to continue: ");
				scanner.next(); 
				System.out.println();
				break;
			} catch (Exception ex) {
				
				System.out.println("GameID " + id + " not found. Try again? ");
				System.out.print("('y' for yes, anything else to return to main menu) ");
				String input = scanner.next(); 
				System.out.println();
				if (!input.equals("y")) {
					break; 
				}
			}
		}
	}
	
	public static void viewTeamRoster(DatabaseConnectionInfo connectionInfo) {
		Scanner scanner = new Scanner(System.in);
		String input = "";
		while (true) {
			try {
				System.out.println();
				System.out.print("Please enter Team ID to view Team Roster: ");
				input = scanner.next();
				int teamID = Integer.parseInt(input);
				System.out.println();
				TeamRosterDataMapper teamRosterDataMapper = new TeamRosterDataMapper(connectionInfo);
				teamRosterDataMapper.viewTeamRoster(teamID);
				System.out.print("Type anything and press 'enter' to continue: ");
				scanner.next(); 
				System.out.println();
				break;
			} catch (Exception ex) {
				System.out.println("Team ID " + input + " not found. Try again? ");
				System.out.println("('y' for yes, anything else to return to main menu) ");
				String action = scanner.next(); 
				System.out.println();
				if (!action.equals("y")) {
					break; 
				}
			}
		}
	}
}
