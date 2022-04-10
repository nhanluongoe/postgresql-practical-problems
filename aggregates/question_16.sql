-- Output the facility id that has the highest number of slots booked. Ensure that in the event of a tie, all tieing results get output.

-- Method 1
SELECT
  *
FROM (
  SELECT
    facid,
    sum(slots)
  FROM
    cd.bookings
  GROUP BY
    facid) AS temp
ORDER BY
  sum DESC
LIMIT 1

-- Method 2
SELECT
  facid,
  total
FROM (
  SELECT
    facid,
    sum(slots) total,
    rank() OVER (ORDER BY sum(slots) DESC) rank
  FROM cd.bookings
GROUP BY facid) AS ranked
WHERE
  rank = 1
