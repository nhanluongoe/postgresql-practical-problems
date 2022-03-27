-- Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!
SELECT facs.name,
  SUM(
    bks.slots * CASE
      WHEN bks.memid = 0 THEN facs.guestcost
      ELSE facs.membercost
    END
  ) AS revenue
FROM cd.bookings bks
  INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.name
ORDER BY revenue