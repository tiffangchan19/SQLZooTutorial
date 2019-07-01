/*1*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

/*2*/
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

/*3*/
SELECT yr,subject
FROM nobel
WHERE winner = 'Albert Einstein'

/*4*/
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000

/*5*/
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989

/*6*/
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')

/*7*/
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

/*8*/
SELECT yr,subject,winner
FROM nobel
WHERE (yr=1980 and subject='Physics') 
OR (yr=1984 and subject='Chemistry')

/*9*/
SELECT yr,subject,winner
FROM nobel
WHERE subject <> 'Chemistry' 
AND subject <> 'Medicine' 
AND yr =1980

/*10*/
SELECT yr,subject,winner
FROM nobel
WHERE (subject = 'Medicine' AND yr<1910)
OR (subject = 'Literature' AND yr>=2004)

/*11*/
SELECT yr,subject,winner
FROM nobel
WHERE winner='Peter Grünberg'

/*12*/
SELECT *
FROM nobel
WHERE winner='EUGENE O''NEILL'

/*13*/
SELECT winner,yr,subject
FROM nobel
WHERE winner like 'Sir%'
ORDER BY yr desc,winner

/*14*/
/*

The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

*/
SELECT winner, subject
  FROM nobel
 WHERE yr=1984 
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner
