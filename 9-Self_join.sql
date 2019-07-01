/*1*/
SELECT count(*) FROM stops

/*2*/
SELECT id FROM stops
WHERE name='Craiglockhart'

/*3*/
SELECT id,name FROM stops JOIN route ON id=stop
WHERE num=4 AND company='LRT'

/*4*/
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING count(*)=2

/*5*/
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

/*6*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

/*7*/
SELECT distinct a.company, a.num 
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137

/*8*/
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=(SELECT id FROM stops WHERE name='Craiglockhart') 
AND b.stop=(SELECT id FROM stops WHERE name='Tollcross') 

/*9*/
SELECT stopB.name,b.company,b.num 
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopA ON stopA.id=a.stop
JOIN stops stopB ON stopB.id=b.stop
WHERE a.stop=(SELECT id FROM stops WHERE name='Craiglockhart')

/*10*/