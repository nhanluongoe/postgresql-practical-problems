-- Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.
SELECT facid,
  EXTRACT (
    MONTH
    FROM starttime
  ) AS month,
  SUM(slots) AS "Total Slots"
FROM cd.bookings
WHERE EXTRACT (
    YEAR
    FROM starttime
  ) = 2012
GROUP BY facid,
  month
ORDER BY facid,
  month