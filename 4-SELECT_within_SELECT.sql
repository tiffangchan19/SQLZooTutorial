/*1*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/*2*/
SELECT name FROM world
WHERE (gdp/population) >
(SELECT (gdp/population) from world
WHERE name = 'United Kingdom')
AND continent = 'Europe'

/*3*/
SELECT name,continent FROM world
    WHERE continent = 
            (SELECT continent FROM world WHERE name = 'Argentina') 
        OR continent = 
            (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name

/*4*/
SELECT name,population FROM world
WHERE population > 
(SELECT population FROM world WHERE name='Canada') 
AND population <
(SELECT population FROM world WHERE name='Poland') 

/*5*/
SELECT name,concat(ROUND(population/(SELECT population FROM world WHERE name='Germany')*100,0),'%') FROM world
WHERE continent='Europe'

/*6*/
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent='Europe'
AND gdp != 'NULL')

/*7*/
/* Largest in each continent */ 
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)


/*8*/
SELECT continent, name from world y
Where name <= ALL(SELECT name FROM world x where x.continent = y.continent order by name)
ORDER BY continent


/*9*/
SELECT name,continent,population FROM world x
WHERE 25000000 >= ALL(SELECT population FROM world y
WHERE x.continent = y.continent) 

/*10*/
SELECT name,continent FROM world x
WHERE population >= ALL(SELECT (3*population) FROM world y
WHERE x.continent = y.continent
AND x.name != y.name) 