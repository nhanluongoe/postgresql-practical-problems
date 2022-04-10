-- For each day in August 2012, calculate a rolling average of total revenue over the previous 15 days. Output should contain date and revenue columns, sorted by the date. Remember to account for the possibility of a day having zero revenue. This one's a bit tough, so don't be afraid to check out the hint!

SELECT
  dategen.date,
  (
    -- correlated subquery that, for each day fed into it,
    -- finds the average revenue for the last 15 days
    SELECT
      sum(
        CASE WHEN memid = 0 THEN
          slots * facs.guestcost
        ELSE
          slots * membercost
        END) AS rev
    FROM
      cd.bookings bks
      INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    WHERE
      bks.starttime > dategen.date - interval '14 days'
      AND bks.starttime < dategen.date + interval '1 day') / 15 AS revenue
  FROM (
    -- generates a list of days in august
    SELECT
      cast(generate_series(timestamp '2012-08-01', '2012-08-31', '1 day') AS date) AS date) AS dategen
ORDER BY
  dategen.date;

