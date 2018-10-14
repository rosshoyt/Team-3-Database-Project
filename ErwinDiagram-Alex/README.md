# Summary #

Alrighty, here is my first attempt at a modeling an amateur sports league. Here
are the main features that this model supports. 

1) Multiple sport types 
2) Multiple leagues (here I define a league as essentially one season of one 
sport)
3) Teams & players. 
4) Scheduling and playing regular season games. 
5) Scheduling and playing play-offs (single or double-elimination)
6) Locations for gameplay. Locations are defined by an address and what kind 
of sports they can support.

## How scoring works ##

One of the problems that I ran into while trying to model a league with 
multiple sport types was that different sports keep score using different 
methods. If we were going to model the different methods for each sport, we 
could end up with a huge number of tables. 

This is probably the biggest downside to modeling a league that can support an
arbitrary number of sport types, because there is no way to really capture the 
nuanced differences in scoring methods without having an enormous table 
structure. 

For the purposes of this model, I decided that match outcomes would be tracked
using a simple Win/Loss/Tie method. Basically wherever you see an attribute 
called teamAOutcome or teamBOutcome either a 'W', 'L', or 'T' will be 
entered. While this isn't great, it's a trade-off that we have to make if we 
decide to model a league that supports multiple sport types. 

Alternatively, if we decide to model a league that can only support one type 
of sport, we can put more effort into modeling some scoring nuances for that
sport, as well as player stats potentially.

## Table Groups ##

The model is fairly complex, so I will try to explain how it works by 
describing various groups of tables that are closely related. 

#### TEAM, PLAYER, TEAM_PLAYER, LEAGUE, TEAM_LEAGUE, SPORT ####

This group is pretty self-explanatory. A team is defined by the sport it plays, 
the players, and the league it is in. A player can play in multiple teams 
(though we probably want to put some kind of restriction on playing on multiple
teams of the same sport type) and a team consists of many players. A team can
play in multiple leagues and a league has multiple teams in it. A league is 
defined by the sport type, the gender make-up (men's, women's, co-ed, open, 
etc.), and the playoff type (single-elimination, double-elimination, or no 
playoffs). 

#### LOCATION, SPORT, LOCATION_SPORT ####

Locations are defined by an address and the types of sports they can support. 
(perhaps location should be called 'facility'). Since a facility can potentially
support multiple sport types, and sport types cn be supported at multiple 
facilities, this is a many-to-many relationship. Additionally, the capacity of
the facility for that sport type (number of courts, playing fields, baseball 
diamonds, pools, etc) is embedded in the LOCATION_SPORT table. 

#### MATCH_REGULAR_SEASON ####

One of the main utilities of the app will be scheduling game play. The schedule 
for regular season games is embedded in MATCH_REGULAR_SEASON (ignore the 
italicized text). The schedule of games describes the dates/times, location(s), 
and team lineups. One of the featuers of our app could be making sure that 
scheduling conflicts between different matches don't occur, and optimizing
the scheduling to fit as many matches into as short a time as possible. 

#### SINGLE_ELIMINATION_PLAYOFF, TEAM_SINGLE_ELIMINATION_PLAYOFF ####

If a league opts to go with a single-elimination playoff, these tables
exist to schedule those playoffs. SINGLE_ELIMINATION_PLAYOFF is a self-
-referencing table b/c each game (except for the final game) references 
the game it feeds into (its parentGame). 

TEAM_SINGLE_ELIMINATION_PLAYOFF references the game scheduled in 
SINGLE_ELIMINATION_PLAYOFF and describes the actual teams and outcomes of a 
playoff match. The reason this information is not included in the 
SINGLE_ELIMINATION_PLAYOFF table is because it isn't known until the playoff
game actually starts so rows would be filled with a bunch of NULL values, at 
least initially until the teams/scores are known. 

#### DOUBLE_ELIMINATION_WINNER_BRACKET, TEAM_DOUBLE_ELIMINATION_WINNER_BRACKET, DOUBLE_ELIMINATION_LOSER_BRACKET, TEAM_DOUBLE_ELIMINATION_LOSER_BRACKET, DOUBLE_ELIMINATION_FINAL, TEAM_DOUBLE_ELIMINATION_FINAL ####

Much like the single elimination playoff scheme, except double elimination 
(go figure). 

This was kind of tricky to model. Basically, there are two self-referencing
tables that descibe the winner's bracket and the loser's bracket. The only 
difference is that each entry in the winner's brackett also references an
entry in the loser's brackett (b/c if a team loses a game in the winner's
bracket they get moved to the loser's bracket). 

TEAM_DOUBLE_ELIMINATION_WINNER_BRACKET and TEAM_DOUBLE_ELIMINATION_LOSER
_BRACKET_ do the exact same that that TEAM_SINGLE_ELIMINATION_PLAYOFF does
in the single elimination playoff. 

One of the tricky things about modeling a double-elimination playoff is that
there are essentially two different brackets (the winner's and loser's bracket, 
respectively) that link up at the final match. Since these brackets are modeled
in two different tables, a third table called DOUBLE_ELIMINATION_FINAL was 
added. This table describes the final game of a double elimination bracket and 
references the respective child games of the winner's and loser's brackets. 
TEAM_DOUBLE_ELIMINATION_FINAL does the same thing as TEAM_DOUBLE_ELIMINATION_WINNER_BRACKET 
and TEAM_DOULBE_ELIMINATION_LOSER_BRACKET. 

