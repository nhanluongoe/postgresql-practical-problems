-- Work out the utilisation percentage for each facility by month, sorted by name and month, rounded to 1 decimal place. Opening time is 8am, closing time is 8.30pm. You can treat every month as a full month, regardless of if there were some dates the club was not open.

SELECT
  name,
  month,
  round(100 * slots / cast(25 * (cast((month + interval '1 month') AS date) - cast(month AS date)) AS numeric), 1) AS utilization
FROM (
  SELECT
    facs.name,
    date_trunc('month', bks.starttime) AS month,
    sum(bks.slots) AS slots
  FROM
    cd.bookings bks
    INNER JOIN cd.facilities facs ON bks.facid = facs.facid
  GROUP BY
    facs.facid,
    month) AS inner_table
ORDER BY
  name,
  month
