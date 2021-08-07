-- How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.
SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member,
  facs.name AS facility
FROM cd.members AS mems
  INNER JOIN cd.bookings bks ON mems.memid = bks.memid
  INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE facs.name LIKE '%Tennis Court%'
ORDER BY member,
  facility