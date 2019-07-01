/*1*/
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

/*2*/
SELECT DISTINCT(game.id),stadium,team1,team2 FROM game
JOIN goal ON game.id =goal.matchid
WHERE game.id = 1012

/*3*/
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

/*4*/
SELECT team1,team2,player
FROM goal JOIN game ON (matchid=id)
WHERE player LIKE 'Mario%'

/*5*/
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id) 
 WHERE gtime<=10

/*6*/
SELECT mdate,teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach='Fernando Santos'

/*7*/
SELECT player
FROM goal JOIN game ON (matchid=id)
WHERE stadium='National Stadium, Warsaw'

/*8*/
SELECT DISTINCT(player)
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND (team1!=team2) AND (teamid<>'GER')

/*9*/
SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

/*10*/
SELECT stadium,count(player)
FROM goal JOIN game on matchid=id
GROUP BY stadium

/*11 For every match involving 'POL', show the matchid, date and the number of goals scored. */
SELECT game.id,game.mdate,count(teamid)
  FROM game JOIN goal ON goal.matchid = game.id 
 WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
GROUP BY game.id,game.mdate

/*12*/
SELECT game.id,game.mdate,count(teamid)
FROM goal JOIN game on game.id=goal.matchid
WHERE goal.teamid='GER'
GROUP BY game.id,game.mdate

/*13*/
/*
List every match with the goals scored by each team as shown. 
This will use "CASE WHEN" which has not been explained in any previous exercises.
*/
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id 
GROUP BY mdate,matchid,team1,team2

