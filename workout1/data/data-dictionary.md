## Data Dictionary

+ team_name: NBA team that this player was on which will be the Golden State Warriors (character)
+ game_date: date that the game took place (character)
+ season: year of the season that the game counts for which will be 2016 (integer)
+ period: one of the 4 periods in the game; possible values are 1, 2, 3, and 4 (integer)
+ minutes_remaining: minutes remaining in the period (integer)
+ seconds_remaining: seconds remaining in the period, not counting minutes (time mod number of minutes) (integer)
+ shot_made_flag: indicates whether a shot was made (y) or missed (n) (character)
+ action_type: the moves used by players either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer (character)
+ shot_type: indicates whether the shot was a 2-point field goal or a 3-point field goal (character)
+ shot_distance: distance to the basket measured in feet (integer)
+ opponent: the team that the player was playing against (character)
+ x: x coordinate from where the shot was thrown in inches (integer)
+ y: y coordinate from where the shot was thrown in inches (integer)

Variables exclusive to shots-data.csv

+ name: player name which is one of the five players (character)
+ minute: minutes of the game that have passed (double)