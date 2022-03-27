-- Output the facility id that has the highest number of slots booked. For bonus points, try a version without a LIMIT clause. This version will probably look messy!
SELECT facid,
  SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) = (
    SELECT MAX(temp.totalslots) AS "Total Slots"
    FROM (
        SELECT facid,
          SUM(slots) AS totalslots
        FROM cd.bookings
        GROUP BY facid
      ) AS temp
  ) 
  
-- Simplify using Table Expression(CTEs)
WITH sum AS (
  SELECT facid, SUM(slots) AS totalslots
  FROM cd.bookings
  GROUP BY facid
)

SELECT facid,
  totalslots AS "Total Slots"
FROM sum
WHERE totalslots = (
    SELECT MAX(sum.totalslots)
    FROM sum
  )