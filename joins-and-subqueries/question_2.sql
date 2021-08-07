-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
SELECT bks.starttime AS start,
  facs.name AS name
FROM cd.bookings bks
  INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE facs.name LIKE '%Tennis Court%'
  AND bks.starttime >= '2012-09-21'
  AND bks.starttime < '2012-09-22'
ORDER BY start