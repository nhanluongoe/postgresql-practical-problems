-- Produce a list of the top three revenue generating facilities (including ties). Output facility name and rank, sorted by rank and facility name.

SELECT
  *
FROM (
  SELECT
    facs.name AS name,
    rank() OVER (ORDER BY sum( CASE WHEN memid = 0 THEN
        slots * facs.guestcost
      ELSE
        slots * facs.membercost
      END) DESC) AS rank
  FROM
    cd.facilities facs
    INNER JOIN cd.bookings bks ON facs.facid = bks.facid
  GROUP BY
    facs.name) AS temp
WHERE
  rank <= 3
ORDER BY
  rank
