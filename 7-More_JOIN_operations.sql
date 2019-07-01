/*1*/
SELECT id, title
 FROM movie
 WHERE yr=1962

/*2*/
SELECT yr
 FROM movie
 WHERE title='Citizen Kane'

/*3*/
SELECT id,title,yr
 FROM movie
 WHERE title LIKE '%Star Trek%'
ORDER BY yr

/*4*/
SELECT id FROM actor
WHERE name='Glenn Close'

/*5*/
SELECT id FROM movie
WHERE title='Casablanca'

/*6*/
SELECT name FROM casting JOIN actor ON actorid = id
WHERE movieid=11768

/*7*/
SELECT name FROM casting JOIN actor ON actorid = id
WHERE movieid = (SELECT id FROM movie WHERE title='Alien')

/*8*/
SELECT title FROM movie JOIN casting ON id=movieid
WHERE actorid = (SELECT id FROM actor WHERE name='Harrison Ford')

/*9*/
SELECT title FROM movie JOIN casting ON id=movieid
WHERE actorid = (SELECT id FROM actor WHERE name='Harrison Ford') AND ord!=1

/*10*/
SELECT title,name FROM movie JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE yr=1962 AND ord=1

/*11*/
/*
Which were the busiest years for 'John Travolta', 
show the year and the number of movies he made each year for any year in which he made more than 2 movies.
*/
SELECT yr,COUNT(title) FROM movie 
    JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
        where name='John Travolta'
        GROUP BY yr
            HAVING COUNT(title)=(SELECT MAX(c) FROM
                (SELECT yr,COUNT(title) AS c FROM movie JOIN casting ON movie.id=movieid
                    JOIN actor   ON actorid=actor.id
                        where name='John Travolta'
                        GROUP BY yr) AS t
)

/*12*/
/* List the film title and the leading actor for all of the films 'Julie Andrews' played in. */
SELECT title, name FROM movie 
    JOIN casting ON movieid=movie.id AND ord=1 
    JOIN actor on actorid=actor.id
    WHERE movie.id IN (
        SELECT movieid FROM casting 
            WHERE actorid IN (
                SELECT id FROM actor
                    WHERE name='Julie Andrews')
)

/*13*/
SELECT name FROM casting JOIN actor on actorid=id
    WHERE ord=1
        GROUP by name
            Having count(movieid) >= 30
    ORDER by name

/*14*/
SELECT title,count(actorid) FROM movie 
    JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE yr=1978
GROUP BY title
ORDER BY count(actorid) desc,title

/*15*/
SELECT DISTINCT(name) FROM casting 
JOIN actor ON actorid=actor.id
WHERE movieid IN
    (SELECT movieid FROM movie 
        JOIN casting ON movie.id=movieid
        JOIN actor ON actorid=actor.id
    WHERE name = 'Art Garfunkel') 
AND name!='Art Garfunkel'