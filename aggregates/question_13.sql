-- Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.
SELECT
  mems.surname,
  mems.firstname,
  mems.memid,
  MIN(boks.starttime)
FROM
  cd.bookings boks
  INNER JOIN cd.members mems ON boks.memid = mems.memid
WHERE
  boks.starttime > '2012-09-01'
GROUP BY
  mems.surname,
  mems.firstname,
  mems.memid
ORDER BY
  mems.memid
