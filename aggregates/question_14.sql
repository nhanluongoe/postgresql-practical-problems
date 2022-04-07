-- Produce a list of member names, with each row containing the total member count. Order by join date, and include guest members.

--Method 1: Naive
SELECT (SELECT COUNT(*) FROM cd.members) AS count, firstname, surname
FROM cd.members
ORDER BY joindate

-- Method 2: Using window functions
SELECT COUNT(*) OVER() AS count, firstname, surname
FROM cd.members
ORDER BY joindate