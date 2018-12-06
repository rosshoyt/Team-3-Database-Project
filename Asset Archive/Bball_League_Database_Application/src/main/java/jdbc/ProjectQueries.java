package jdbc;

/**
 * Queries used in Basketball datbase project. As of Nov 23, these queries are 
 * from milestone 2 submission
 * @author Team3CSSU
 * @author RossHoyt
 */
public class ProjectQueries {

	/**
	 * -- 1) obtains the names of seasons with scheduled matches and the date of the first match of the season 
	 */
	public final static String QUERY1 = "SELECT " +
			"basketballleagueproject.GAME.season AS SeasonID,"+
			"basketballleagueproject.SEASON.seasonName AS SeasonName,"+ 
			"MIN(basketballleagueproject.GAME.matchdateTimeStart) AS FirstMatch,"+
			"MAX(basketballleagueproject.GAME.matchdateTimeStart) AS LastMatch "+
			"FROM "+
			"basketballleagueproject.GAME " + 
			"INNER JOIN "+
			"basketballleagueproject.SEASON ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON "+
			"GROUP BY "+
			"basketballleagueproject.GAME.season;";


	/**
	 * -- 2) - Shows roster for specific team (team 1 in this case)
	 */
	public final static String QUERY2 = "SELECT " +
			"sportsleagueproject.PLAYER.idPLAYER, sportsleagueproject.PLAYER.firstName, sportsleagueproject.PLAYER.lastName,"+
			"sportsleagueproject.TEAM.idTEAM, sportsleagueproject.TEAM.teamName "+
			"FROM ((sportsleagueproject.PLAYER_TEAM "+ 
			"INNER JOIN sportsleagueproject.PLAYER ON sportsleagueproject.PLAYER_TEAM.player = sportsleagueproject.PLAYER.idPLAYER) " +
			"INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.PLAYER_TEAM.team = sportsleagueproject.TEAM.idTEAM) "+
			"WHERE sportsleagueproject.TEAM.idTEAM = 1 " +
			"ORDER BY sportsleagueproject.PLAYER.idPLAYER;";
	/**
	 * -- 3) Team schedule for given team (team 1 in this example). Displays all future scheduled games for team 1.
	 */
	public final static String QUERY3 =	 " SELECT​"
			+ " T1.seasonName, T1.matchdateTimeStart, T1.facilityName, T1.matchNumber, T2.OpposingTeam ​FROM"
			+"(​SELECT​ basketballleagueproject.SEASON.seasonName, basketballleagueproject.GAME.matchdateTimeStart, basketballleagueproject.FACILITY.facilityName, basketballleagueproject.GAME_TEAM.match ​AS​ matchNumber"
			+"FROM​ ((((basketballleagueproject.GAME_TEAM INNER​ ​JOIN​ basketballleagueproject.TEAM ​ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM)"
			+"INNER​ ​JOIN​ basketballleagueproject.GAME ​ON basketballleagueproject.GAME_TEAM.match = basketballleagueproject.GAME.idGAME)"
			+"INNER​ ​JOIN​ basketballleagueproject.FACILITY ​ON basketballleagueproject.GAME.facility = basketballleagueproject.FACILITY.idFACILITY)"
			+"INNER​ ​JOIN​ basketballleagueproject.SEASON ​ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON)"
			+"WHERE​ basketballleagueproject.TEAM.idTEAM = 1 && basketballleagueproject.GAME.matchdateTimeStart >= ​NOW​()) ​AS​ T1 INNER​ ​JOIN"
			+"(​SELECT​ basketballleagueproject.GAME_TEAM.match ​AS​ matchNumber2, basketballleagueproject.TEAM.teamName ​AS​ OpposingTeam ​FROM"
			+"(((​SELECT​ basketballleagueproject.GAME_TEAM.match ​AS​ matchNumber ​FROM basketballleagueproject.GAME_TEAM ​WHERE basketballleagueproject.GAME_TEAM.team = 1) ​AS​ T1"
			+"INNER​ ​JOIN​ basketballleagueproject.GAME_TEAM ​ON​ T1.matchNumber = basketballleagueproject.GAME_TEAM.match)"
			+"INNER​ ​JOIN​ basketballleagueproject.TEAM ​ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM)"
			+"WHERE​ basketballleagueproject.GAME_TEAM.team != 1 ) ​AS​ T2"
			+"ON​ T1.matchNumber = T2.matchNumber2;";
	/**
	 * -- 4) Player's schedule for all upcoming games (playerid 16 in this example).  
	 */
	public final static String QUERY4 = "SELECT​" 
			+" T2.seasonName, T2.matchDateTimeStart ​as​ MatchStartTime, T2.facilityName ​AS​ Facility,"
			+" T1.teamName ​as​ PlayingAs ​FROM"
			+" (​SELECT​ basketballleagueproject.SEASON.seasonName, basketballleagueproject.TEAM.idTEAM, basketballleagueproject.GAME.matchdateTimeStart, basketballleagueproject.FACILITY.facilityName,"
			+" basketballleagueproject.GAME_TEAM.match ​AS​ matchNumber FROM"
			+" ((((basketballleagueproject.GAME_TEAM"
			+" INNER​ ​JOIN​ basketballleagueproject.TEAM ​ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM)"
			+" INNER​ ​JOIN​ basketballleagueproject.GAME ​ON basketballleagueproject.GAME_TEAM.match = basketballleagueproject.GAME.idGAME)"
			+"INNER​ ​JOIN​ basketballleagueproject.FACILITY ​ON basketballleagueproject.GAME.facility = basketballleagueproject.FACILITY.idFACILITY)"
			+"INNER​ ​JOIN​ basketballleagueproject.SEASON ​ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON)"
			+"WHERE​ basketballleagueproject.GAME.matchdateTimeStart >= ​Now​()) ​AS​ T2 INNER​ ​JOIN"
			+"(​SELECT​ basketballleagueproject.TEAM.teamName, basketballleagueproject.TEAM.idTEAM ​FROM ((basketballleagueproject.PLAYER_TEAM"
			+"INNER​ ​JOIN​ basketballleagueproject.PLAYER ​ON basketballleagueproject.PLAYER_TEAM.player = basketballleagueproject.PLAYER.idPLAYER) INNER​ ​JOIN​ basketballleagueproject.TEAM ​ON basketballleagueproject.PLAYER_TEAM.team = basketballleagueproject.TEAM.idTEAM)"
			+"WHERE​ basketballleagueproject.PLAYER.idPLAYER = 40) ​AS​ T1 ON​ T2.idTEAM = T1.idTEAM;";
	/**
	 * -- 5) Show schedule of all games (date/time and location) for a given season (season id 1 in this example). 
	 */
	public final static String QUERY5 = "SELECT"
			+" basketballleagueproject.GAME.idGAME, basketballleagueproject.SEASON.seasonName, basketballleagueproject.FACILITY.facilityName, basketballleagueproject.GAME.matchDateTimeStart ​AS​ DateTimeStart FROM​ basketballleagueproject.GAME"
			+" INNER​ ​JOIN​ basketballleagueproject.SEASON"
			+" ON​ basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON"
			+" INNER​ ​JOIN​ basketballleagueproject.FACILITY"
			+" ON​ basketballleagueproject.GAME.facility = basketballleagueproject.FACILITY.idFACILITY WHERE​ basketballleagueproject.GAME.season = 1;";
	/**
	 * -- 6) Retrieves list of all female players.
	 */
	public final static String QUERY6 = "SELECT​"
			+ " * ​FROM​ basketballleagueproject.PLAYER WHERE​ basketballleagueproject.PLAYER.sex = ​'F'​;";

	/**
	 * -- 7) Retrieves all male players in league. 
	 */
	public final static String QUERY7 = "SELECT​"
			+" * ​FROM​ basketballleagueproject.PLAYER WHERE​ basketballleagueproject.PLAYER.sex = ​'M'​;";
	/**
	 * -- 8) Player stats for individual game (assumption is that particular game is known)
	 */
	public final static String QUERY8 = "SELECT​"
			+" * ​FROM​ basketballleagueproject.PLAYER_PERFORMANCE ​WHERE basketballleagueproject.PLAYER_PERFORMANCE.player = 16"
			+" && basketballleagueproject.PLAYER_PERFORMANCE.team_match = 13;";
	/**
	 * -- 9) Player stats for all time. 
	 */
	public final static String QUERY9 = "SELECT​ "
			+" ​SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FGM) ​AS​ ​'FGM: All-Time'​,"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FGA) ​AS​ ​'FGA: All-Time'​, (​SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FGM) / SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FGA) * 100.0) ​AS​ ​'Field Goal %: All-Time'​,"
			+" -- SUM(sportsleagueproject.PLAYER_PERFORMANCE.3PM) AS '3PM: All-Time',"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FTM) ​AS​ ​'FTM: All-Time'​, SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FTA) ​AS​ ​'FTA: All-Time'​, (100.0 * ​SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FTM) / SUM​(basketballleagueproject.PLAYER_PERFORMANCE.FTA)) ​AS​ ​'Free Throw %: All Time'​,"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.OFF_REB) ​AS​ ​'OFF_REB: All Time'​,"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.DEF_REB) ​AS​ ​'DEF_REB: All Time'​,"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.AST) ​AS​ ​'Assists: All Time'​,"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.TOV) ​AS​ ​'TOV: All Time'​,"
			+" SUM​(basketballleagueproject.PLAYER_PERFORMANCE.STL) ​AS​ ​'Steals: All Time'"
			+" FROM​ basketballleagueproject.PLAYER_PERFORMANCE"
			+" WHERE​ basketballleagueproject.PLAYER_PERFORMANCE.player = 16;"
			+" Output (not all columns shown):";
	/**
	 * -- 10) Retrieves each score that every team got in every game played. 
	 */
	public final static String QUERY10 = "SELECT​"
			+" basketballleagueproject.GAME_TEAM.score, basketballleagueproject.GAME_TEAM.match, basketballleagueproject.TEAM.teamName"
			+" FROM​ basketballleagueproject.GAME_TEAM"
			+" INNER​ ​JOIN​ basketballleagueproject.TEAM ​ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM"
			+" WHERE​ basketballleagueproject.GAME_TEAM.score ​IS​ ​NOT​ ​NULL​;";
	/**
	 * -- 11) All names and email addresses of players for league-wide communications. 
	 */
	public final static String QUERY11 = "SELECT"
			+" basketballleagueproject.PLAYER.firstName, basketballleagueproject.PLAYER.lastName, basketballleagueproject.PLAYER.email ​FROM basketballleagueproject.PLAYER;";



}
