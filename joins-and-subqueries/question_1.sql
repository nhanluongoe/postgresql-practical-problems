-- How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT bks.starttime
FROM cd.bookings bks
  INNER JOIN cd.members mems ON mems.memid = bks.memid
WHERE mems.firstname = 'David'
  AND mems.surname = 'Farrell'