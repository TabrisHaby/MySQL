# SQLZoo

# The JOIN operation

# http://sqlzoo.net/wiki/The_JOIN_operation



# 1.
#The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of #saying matchid, teamid, player, gtime

#Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

select matchid,player
from goal
where teamid = 'GER'


#2.
#From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.

#Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 #by finding that row in the game table.

#Show id, stadium, team1, team2 for just game 1012


SELECT id,stadium,team1,team2
FROM game
where id = 1012


#3.
#You can combine the two steps into a single query with a JOIN.

#The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with #which rows in goal - the id from goal must match matchid from game. (If we wanted to be more clear/specific we could say 
#ON (game.id=goal.matchid)

SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
where teamid = 'Ger'


#4.
#Use the same JOIN as in the previous question.

#Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

select ga.team1,ga.team2,go.player
from game as ga inner join goal as go
on ga.id = go.matchid
where go.player like 'Mario%'


#5.
#The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

#Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT go.player, go.teamid, e.coach, go.gtime
FROM goal as go inner join eteam as e
on go.teamid = e.id 
WHERE gtime<=10


#6.
#To JOIN game with eteam you could use either
#game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

#Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

#List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

select ga.mdate,e.teamname
from game as ga inner join eteam as e
on ga.team1 = e.id
where e.coach = 'Fernando Santos'


#7.
#List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

select go.player
from goal as go inner join game as ga
on go.matchid = ga.id
where ga.stadium = 'National Stadium, Warsaw'


#8.
#The example query shows all goals scored in the Germany-Greece quarterfinal.
#Instead show the name of all players who scored a goal against Germany.

SELECT distinct player
FROM game JOIN goal ON matchid = id 
WHERE ((team1='GER' and team2!='GER') or (team1!='GER' and team2='GER')) and goal.teamid != 'GER'


#9.
#Show teamname and the total number of goals scored.

SELECT teamname, count(teamid)
FROM eteam JOIN goal ON id=teamid
group by teamname


#10.
#Show the stadium and the number of goals scored in each stadium.

select stadium,count(teamid)
from game as ga inner join goal as go
on ga.id = go.matchid
group by stadium


#11.
#For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid,mdate, count(goal.teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate


#12.
#For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

select matchid,mdate,count(teamid)
from game as ga inner join goal as go
on ga.id = go.matchid
where (team1 = 'GER' or team2 = 'GER') and teamid = 'GER'
group by matchid,mdate


#13.
#List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
#mdate	team1	score1	team2	score2
#1 July 2012	ESP	4	ITA	0
#10 June 2012	ESP	1	ITA	1
#10 June 2012	IRL	1	CRO	3
#...
#Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this #column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.

SELECT mdate,team1,
sum((CASE WHEN teamid=team1 THEN 1 ELSE 0 END)) as score1,team2,
sum((case when teamid = team2 then 1 else 0 end)) as score2
FROM game JOIN goal ON matchid = id
group by mdate,team1,team2
order by mdate,matchid,team1,team2













