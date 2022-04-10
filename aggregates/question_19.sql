-- Classify facilities into equally sized groups of high, average, and low based on their revenue. Order by classification and facility name.

SELECT
  name,
  (
    CASE WHEN class = 1 THEN
      'high'
    WHEN class = 2 THEN
      'low'
    ELSE
      'average'
    END) revenue
FROM (
  SELECT
    facs.name AS name,
    ntile(3) OVER (ORDER BY sum( CASE WHEN memid = 0 THEN
        slots * guestcost
      ELSE
        slots * membercost
      END) DESC) AS class
  FROM
    cd.bookings bks
    INNER JOIN cd.facilities facs ON bks.facid = facs.facid
  GROUP BY
    facs.name) AS subquery
ORDER BY
  revenue DESC
