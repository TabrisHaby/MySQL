-- # SQLZoo
--
-- # Using Null
--
-- # http://sqlzoo.net/wiki/Self_join
--
-- # TEXT EDITOR : ATOM v 1.23.3


-- 1.
-- How many stops are in the database.

select count(distinct stop)
from route


-- 2.
-- Find the id value for the stop 'Craiglockhart'

select id
from stops
where name =  'Craiglockhart'


-- 3.
-- Give the id and the name for the stops on the '4' 'LRT' service.

select id,name
from stops inner join route
on stops.id = route.stop
where num = 4 and company = 'LRT'


-- 4.
-- The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.

SELECT company, num, COUNT(*) as N
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) = 2


-- 5.
-- Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53


-- 6.
-- The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'


-- 7.
-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

select distinct a.company,a.num
from route as a inner join route as b
on a.company = b.company and a.num = b.num
where a.stop = 115 and b.stop = 137


-- 8.
-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

select distinct a.company,a.num
from route as a inner join route as b
on a.company = b.company and a.num = b.num
where a.stop = (select id from stops where name = 'Craiglockhart')
and b.stop = (select id from stops where name = 'Tollcross')


-- 9.
-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.

select stops.name, a.company,a.num
from route as a inner join route as b
on a.company = b.company and a.num = b.num
inner join stops
on stops.id = b.stop
where a.stop = (select id from stops where name = 'Craiglockhart')
and a.company = 'LRT'


-- 10.
-- Find the routes involving two buses that can go from Craiglockhart to Sighthill.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.

select distinct ta.num,ta.company,ta.name,tb.num,tb.company
from
(select a.num,a.company,b.stop,stops.name
from route as a inner join route as b
on a.company = b.company and a.num = b.num
inner join stops on stops.id = b.stop
where a.stop = (select id from stops where name = 'Craiglockhart')) as ta
inner join
(select a.num,a.company,a.stop
from route as a inner join route as b
on a.company = b.company and a.num = b.num
where b.stop = (select id from stops where name = 'Sighthill')) as tb
on ta.stop = tb.stop
