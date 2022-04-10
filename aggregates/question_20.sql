-- Based on the 3 complete months of data so far, calculate the amount of time each facility will take to repay its cost of ownership. Remember to take into account ongoing monthly maintenance. Output facility name and payback time in months, order by facility name. Don't worry about differences in month lengths, we're only looking for a rough value here!
SELECT
  facs.name AS name,
  facs.initialoutlay / ((sum(
      CASE WHEN memid = 0 THEN
        bks.slots * facs.guestcost
      ELSE
        bks.slots * facs.membercost
      END) / 3) - monthlymaintenance) AS months
FROM
  cd.bookings bks
  INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY
  facs.facid
ORDER BY
  name
