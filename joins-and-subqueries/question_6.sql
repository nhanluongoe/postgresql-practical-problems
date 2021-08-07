-- How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.
SELECT mems.firstname || ' ' || mems.surname as member,
  facs.name AS facility,
  CASE
    WHEN mems.memid = 0 THEN bks.slots * facs.guestcost
    ELSE bks.slots * facs.membercost
  END AS cost
FROM cd.members mems
  INNER JOIN cd.bookings bks ON mems.memid = bks.memid
  INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE bks.starttime >= '2012-09-14'
  AND bks.starttime < '2012-09-15'
  AND (
    (
      mems.memid = 0
      AND bks.slots * facs.guestcost > 30
    )
    OR (
      mems.memid != 0
      AND bks.slots * facs.membercost > 30
    )
  )
ORDER BY cost DESC