SELECT member,
  facility,
  cost
FROM (
    SELECT mems.firstname || ' ' || mems.surname AS member,
      facs.name AS facility,
      CASE
        WHEN mems.memid = 0 THEN bks.slots * guestcost
        ELSE bks.slots * membercost
      END as cost
    FROM cd.members mems
      INNER JOIN cd.bookings bks ON mems.memid = bks.memid
      INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    WHERE bks.starttime >= '2012-09-14'
      AND bks.starttime < '2012-09-15'
  ) AS bookings
WHERE cost > 30
ORDER BY cost DESC;