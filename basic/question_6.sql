-- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
SELECT *
FROM cd.facilities
WHERE facid = 1
UNION
SELECT *
FROM cd.facilities
WHERE facid = 5;
-- Or
SELECT *
FROM cd.facilities
WHERE facid in (1, 5);