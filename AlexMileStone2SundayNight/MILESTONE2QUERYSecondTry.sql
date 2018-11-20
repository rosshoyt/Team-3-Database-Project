
-- 1) obtains the names of seasons with scheduled matches and the date of the first match of the season
SELECT 
basketballleagueproject.GAME.season AS SeasonID,
basketballleagueproject.SEASON.seasonName AS SeasonName, 
MIN(basketballleagueproject.GAME.matchdateTimeStart) AS FirstMatch,
MAX(basketballleagueproject.GAME.matchdateTimeStart) AS LastMatch
FROM 
basketballleagueproject.GAME
INNER JOIN 
basketballleagueproject.SEASON ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON
GROUP BY 
basketballleagueproject.GAME.season;

-- 2) Show roster for specific team (team 1 in this case)
SELECT sportsleagueproject.PLAYER.idPLAYER, sportsleagueproject.PLAYER.firstName, sportsleagueproject.PLAYER.lastName,
sportsleagueproject.TEAM.idTEAM, sportsleagueproject.TEAM.teamName
FROM ((sportsleagueproject.PLAYER_TEAM 
INNER JOIN sportsleagueproject.PLAYER ON sportsleagueproject.PLAYER_TEAM.player = sportsleagueproject.PLAYER.idPLAYER)
INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.PLAYER_TEAM.team = sportsleagueproject.TEAM.idTEAM)
WHERE sportsleagueproject.TEAM.idTEAM = 1
ORDER BY sportsleagueproject.PLAYER.idPLAYER;


-- 3) Team schedule for team 1 (all future games) 
SELECT T1.seasonName, T1.matchdateTimeStart, T1.facilityName, T1.matchNumber, T2.OpposingTeam FROM
(SELECT basketballleagueproject.SEASON.seasonName, basketballleagueproject.GAME.matchdateTimeStart, 
basketballleagueproject.FACILITY.facilityName, basketballleagueproject.GAME_TEAM.match AS matchNumber
FROM  ((((basketballleagueproject.GAME_TEAM 
INNER JOIN basketballleagueproject.TEAM ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM) 
INNER JOIN basketballleagueproject.GAME ON basketballleagueproject.GAME_TEAM.match = basketballleagueproject.GAME.idGAME) 
INNER JOIN basketballleagueproject.FACILITY ON basketballleagueproject.GAME.facility = basketballleagueproject.FACILITY.idFACILITY) 
INNER JOIN basketballleagueproject.SEASON ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON) 
WHERE basketballleagueproject.TEAM.idTEAM = 1 && basketballleagueproject.GAME.matchdateTimeStart >= NOW()) AS T1
INNER JOIN
-- get the id of the team opposing team one each game
(SELECT basketballleagueproject.GAME_TEAM.match AS matchNumber2, basketballleagueproject.TEAM.teamName AS OpposingTeam FROM
(((SELECT basketballleagueproject.GAME_TEAM.match AS matchNumber FROM basketballleagueproject.GAME_TEAM WHERE basketballleagueproject.GAME_TEAM.team = 1) AS T1
INNER JOIN basketballleagueproject.GAME_TEAM ON T1.matchNumber = basketballleagueproject.GAME_TEAM.match) 
INNER JOIN basketballleagueproject.TEAM ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM)
WHERE basketballleagueproject.GAME_TEAM.team != 1 ) AS T2
ON T1.matchNumber = T2.matchNumber2; 

-- 4) Player's personal schedule (includes multiple teams)

SELECT T2.seasonName, T2.matchDateTimeStart as MatchStartTime, T2.facilityName AS Facility,
T1.teamName as PlayingAs FROM
(SELECT basketballleagueproject.SEASON.seasonName, basketballleagueproject.TEAM.idTEAM, basketballleagueproject.GAME.matchdateTimeStart, 
basketballleagueproject.FACILITY.facilityName, basketballleagueproject.GAME_TEAM.match AS matchNumber
FROM  
((((basketballleagueproject.GAME_TEAM 
INNER JOIN basketballleagueproject.TEAM ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM) 
INNER JOIN basketballleagueproject.GAME ON basketballleagueproject.GAME_TEAM.match = basketballleagueproject.GAME.idGAME) 
INNER JOIN basketballleagueproject.FACILITY ON basketballleagueproject.GAME.facility = basketballleagueproject.FACILITY.idFACILITY) 
INNER JOIN basketballleagueproject.SEASON ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON)
WHERE basketballleagueproject.GAME.matchdateTimeStart >= Now()) AS T2 
INNER JOIN 
(SELECT basketballleagueproject.TEAM.teamName, basketballleagueproject.TEAM.idTEAM FROM
((basketballleagueproject.PLAYER_TEAM
INNER JOIN basketballleagueproject.PLAYER ON basketballleagueproject.PLAYER_TEAM.player = basketballleagueproject.PLAYER.idPLAYER) 
INNER JOIN basketballleagueproject.TEAM ON basketballleagueproject.PLAYER_TEAM.team = basketballleagueproject.TEAM.idTEAM)
WHERE basketballleagueproject.PLAYER.idPLAYER = 40) AS T1
ON T2.idTEAM = T1.idTEAM; 

-- 5) show schedule of all games for a season 

SELECT basketballleagueproject.GAME.idGAME, basketballleagueproject.SEASON.seasonName,
basketballleagueproject.FACILITY.facilityName, basketballleagueproject.GAME.matchDateTimeStart AS DateTimeStart
FROM basketballleagueproject.GAME 
INNER JOIN basketballleagueproject.SEASON
ON basketballleagueproject.GAME.season = basketballleagueproject.SEASON.idSEASON
INNER JOIN basketballleagueproject.FACILITY
ON basketballleagueproject.GAME.facility = basketballleagueproject.FACILITY.idFACILITY
WHERE basketballleagueproject.GAME.season = 1; 


-- SELECT sportsleagueproject.GAME_TEAM.match, GROUP_CONCAT(sportsleagueproject.GAME_TEAM.team SEPARATOR ', ') AS Teams 
-- FROM sportsleagueproject.GAME_TEAM 
-- GROUP BY sportsleagueproject.GAME_TEAM.match; 

-- 6) all female players

SELECT * FROM basketballleagueproject.PLAYER 
WHERE basketballleagueproject.PLAYER.sex = 'F';

-- 7)  all male players

SELECT * FROM basketballleagueproject.PLAYER 
WHERE basketballleagueproject.PLAYER.sex = 'M'; 

-- 8) player stats for individual game (assumption is particular game is known) 

SELECT * FROM basketballleagueproject.PLAYER_PERFORMANCE WHERE 
basketballleagueproject.PLAYER_PERFORMANCE.player = 16 
&& basketballleagueproject.PLAYER_PERFORMANCE.team_match = 13; 

--  9) player stats for all time

SELECT SUM(basketballleagueproject.PLAYER_PERFORMANCE.FGM) AS 'FGM: All-Time',
SUM(basketballleagueproject.PLAYER_PERFORMANCE.FGA) AS 'FGA: All-Time',
(SUM(basketballleagueproject.PLAYER_PERFORMANCE.FGM) / SUM(basketballleagueproject.PLAYER_PERFORMANCE.FGA) * 100.0) AS 'Field Goal %: All-Time',
-- SUM(sportsleagueproject.PLAYER_PERFORMANCE.3PM) AS '3PM: All-Time', 
SUM(basketballleagueproject.PLAYER_PERFORMANCE.FTM) AS 'FTM: All-Time',
SUM(basketballleagueproject.PLAYER_PERFORMANCE.FTA) AS 'FTA: All-Time',
(100.0 * SUM(basketballleagueproject.PLAYER_PERFORMANCE.FTM) / SUM(basketballleagueproject.PLAYER_PERFORMANCE.FTA)) AS 'Free Throw %: All Time', 
SUM(basketballleagueproject.PLAYER_PERFORMANCE.OFF_REB) AS 'OFF_REB: All Time', 
SUM(basketballleagueproject.PLAYER_PERFORMANCE.DEF_REB) AS 'DEF_REB: All Time',
SUM(basketballleagueproject.PLAYER_PERFORMANCE.AST) AS 'Assists: All Time',
SUM(basketballleagueproject.PLAYER_PERFORMANCE.TOV) AS 'TOV: All Time', 
SUM(basketballleagueproject.PLAYER_PERFORMANCE.STL) AS 'Steals: All Time'
FROM basketballleagueproject.PLAYER_PERFORMANCE 
WHERE basketballleagueproject.PLAYER_PERFORMANCE.player = 16; 

-- 10) Record of each score each team got in each game played. 

SELECT basketballleagueproject.GAME_TEAM.score, basketballleagueproject.GAME_TEAM.match, 
basketballleagueproject.TEAM.teamName 
FROM basketballleagueproject.GAME_TEAM 
INNER JOIN basketballleagueproject.TEAM ON basketballleagueproject.GAME_TEAM.team = basketballleagueproject.TEAM.idTEAM
WHERE basketballleagueproject.GAME_TEAM.score IS NOT NULL;

-- 11) All names and email addresses of players for league-wide communications

SELECT basketballleagueproject.PLAYER.firstName, basketballleagueproject.PLAYER.lastName,
basketballleagueproject.PLAYER.email FROM basketballleagueproject.PLAYER; 




