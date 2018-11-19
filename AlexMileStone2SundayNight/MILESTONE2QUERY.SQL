
-- 1) obtains the names of seasons with scheduled matches and the date of the first match of the season
SELECT 
sportsleagueproject.GAME.season AS SeasonID,
sportsleagueproject.SEASON.seasonName AS SeasonName, 
MIN(sportsleagueproject.GAME.matchdateTimeStart) AS FirstMatch
FROM 
sportsleagueproject.GAME
INNER JOIN 
sportsleagueproject.SEASON ON sportsleagueproject.GAME.season = sportsleagueproject.SEASON.idSEASON
GROUP BY 
sportsleagueproject.GAME.season;

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
(SELECT sportsleagueproject.SEASON.seasonName, sportsleagueproject.GAME.matchdateTimeStart, 
sportsleagueproject.FACILITY.facilityName, sportsleagueproject.GAME_TEAM.match AS matchNumber
FROM  ((((sportsleagueproject.GAME_TEAM 
INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.GAME_TEAM.team = sportsleagueproject.TEAM.idTEAM) 
INNER JOIN sportsleagueproject.GAME ON sportsleagueproject.GAME_TEAM.match = sportsleagueproject.GAME.idGAME) 
INNER JOIN sportsleagueproject.FACILITY ON sportsleagueproject.GAME.facility = sportsleagueproject.FACILITY.idFACILITY) 
INNER JOIN sportsleagueproject.SEASON ON sportsleagueproject.GAME.season = sportsleagueproject.SEASON.idSEASON) 
WHERE sportsleagueproject.TEAM.idTEAM = 1 && sportsleagueproject.GAME.matchdateTimeStart >= NOW()) AS T1
INNER JOIN
-- get the id of the team opposing team one each game
(SELECT sportsleagueproject.GAME_TEAM.match AS matchNumber2, sportsleagueproject.TEAM.teamName AS OpposingTeam FROM
(((SELECT sportsleagueproject.GAME_TEAM.match AS matchNumber FROM sportsleagueproject.GAME_TEAM WHERE sportsleagueproject.GAME_TEAM.team = 1) AS T1
INNER JOIN sportsleagueproject.GAME_TEAM ON T1.matchNumber = sportsleagueproject.GAME_TEAM.match) 
INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.GAME_TEAM.team = sportsleagueproject.TEAM.idTEAM)
WHERE sportsleagueproject.GAME_TEAM.team != 1 ) AS T2
ON T1.matchNumber = T2.matchNumber2; 


-- 4) Player's personal schedule (includes multiple teams)

SELECT T2.seasonName, T2.matchDateTimeStart as MatchStartTime, T2.facilityName AS Facility,
T1.teamName as PlayingAs FROM
(SELECT sportsleagueproject.SEASON.seasonName, sportsleagueproject.TEAM.idTEAM, sportsleagueproject.GAME.matchdateTimeStart, 
sportsleagueproject.FACILITY.facilityName, sportsleagueproject.GAME_TEAM.match AS matchNumber
FROM  
((((sportsleagueproject.GAME_TEAM 
INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.GAME_TEAM.team = sportsleagueproject.TEAM.idTEAM) 
INNER JOIN sportsleagueproject.GAME ON sportsleagueproject.GAME_TEAM.match = sportsleagueproject.GAME.idGAME) 
INNER JOIN sportsleagueproject.FACILITY ON sportsleagueproject.GAME.facility = sportsleagueproject.FACILITY.idFACILITY) 
INNER JOIN sportsleagueproject.SEASON ON sportsleagueproject.GAME.season = sportsleagueproject.SEASON.idSEASON)
WHERE sportsleagueproject.GAME.matchdateTimeStart >= Now()) AS T2 
INNER JOIN 
(SELECT sportsleagueproject.TEAM.teamName, sportsleagueproject.TEAM.idTEAM FROM
((sportsleagueproject.PLAYER_TEAM
INNER JOIN sportsleagueproject.PLAYER ON sportsleagueproject.PLAYER_TEAM.player = sportsleagueproject.PLAYER.idPLAYER) 
INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.PLAYER_TEAM.team = sportsleagueproject.TEAM.idTEAM)
WHERE sportsleagueproject.PLAYER.idPLAYER = 40) AS T1
ON T2.idTEAM = T1.idTEAM; 

-- 5) show schedule of all games for a season

SELECT sportsleagueproject.GAME.idGAME, sportsleagueproject.SEASON.seasonName,
sportsleagueproject.FACILITY.facilityName, sportsleagueproject.GAME.matchDateTimeStart AS DateTimeStart
FROM sportsleagueproject.GAME 
INNER JOIN sportsleagueproject.SEASON
ON sportsleagueproject.GAME.season = sportsleagueproject.SEASON.idSEASON
INNER JOIN sportsleagueproject.FACILITY
ON sportsleagueproject.GAME.facility = sportsleagueproject.FACILITY.idFACILITY
WHERE sportsleagueproject.GAME.season = 1; 


-- SELECT sportsleagueproject.GAME_TEAM.match, GROUP_CONCAT(sportsleagueproject.GAME_TEAM.team SEPARATOR ', ') AS Teams 
-- FROM sportsleagueproject.GAME_TEAM 
-- GROUP BY sportsleagueproject.GAME_TEAM.match; 

-- 6) all female players

SELECT * FROM sportsleagueproject.PLAYER 
WHERE sportsleagueproject.PLAYER.sex = 'F';

-- 7)  all male players

SELECT * FROM sportsleagueproject.PLAYER 
WHERE sportsleagueproject.PLAYER.sex = 'M'; 

-- 8) player stats for individual game (assumption is particular game is known) 

SELECT * FROM sportsleagueproject.PLAYER_PERFORMANCE WHERE 
sportsleagueproject.PLAYER_PERFORMANCE.player = 16 
&& sportsleagueproject.PLAYER_PERFORMANCE.team_match = 13; 

--  9) player stats for all time

SELECT SUM(sportsleagueproject.PLAYER_PERFORMANCE.FGM) AS 'FGM: All-Time',
SUM(sportsleagueproject.PLAYER_PERFORMANCE.FGA) AS 'FGA: All-Time',
(SUM(sportsleagueproject.PLAYER_PERFORMANCE.FGM) / SUM(sportsleagueproject.PLAYER_PERFORMANCE.FGA) * 100.0) AS 'Field Goal %: All-Time',
-- SUM(sportsleagueproject.PLAYER_PERFORMANCE.3PM) AS '3PM: All-Time', 
SUM(sportsleagueproject.PLAYER_PERFORMANCE.FTM) AS 'FTM: All-Time',
SUM(sportsleagueproject.PLAYER_PERFORMANCE.FTA) AS 'FTA: All-Time',
(100.0 * SUM(sportsleagueproject.PLAYER_PERFORMANCE.FTM) / SUM(sportsleagueproject.PLAYER_PERFORMANCE.FTA)) AS 'Free Throw %: All Time', 
SUM(sportsleagueproject.PLAYER_PERFORMANCE.OFF_REB) AS 'OFF_REB: All Time', 
SUM(sportsleagueproject.PLAYER_PERFORMANCE.DEF_REB) AS 'DEF_REB: All Time',
SUM(sportsleagueproject.PLAYER_PERFORMANCE.AST) AS 'Assists: All Time',
SUM(sportsleagueproject.PLAYER_PERFORMANCE.TOV) AS 'TOV: All Time', 
SUM(sportsleagueproject.PLAYER_PERFORMANCE.STL) AS 'Steals: All Time'
FROM sportsleagueproject.PLAYER_PERFORMANCE 
WHERE sportsleagueproject.PLAYER_PERFORMANCE.player = 16; 

-- 10) Record of each score each team got in each game played. 

SELECT sportsleagueproject.GAME_TEAM.score, sportsleagueproject.GAME_TEAM.match, 
sportsleagueproject.TEAM.teamName 
FROM sportsleagueproject.GAME_TEAM 
INNER JOIN sportsleagueproject.TEAM ON sportsleagueproject.GAME_TEAM.team = sportsleagueproject.TEAM.idTEAM
WHERE sportsleagueproject.GAME_TEAM.score IS NOT NULL;




