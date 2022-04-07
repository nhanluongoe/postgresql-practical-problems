-- Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version, include output rows containing totals for all months per facility, AND a total for all months for all facilities. The output table should consist of facility id, month AND slots, sorted by the id AND month. When calculating the aggregated values for all months AND all facids, return NULL values in the month AND facid columns.

-- Method 1: Cubersome
SELECT
  facid,
  EXTRACT(MONTH FROM starttime) AS month,
  SUM(slots) AS slots
FROM
  cd.bookings
WHERE
  starttime >= '2012-01-01'
  AND starttime < '2013-01-01'
GROUP BY
  facid,
  month
UNION ALL
SELECT
  facid,
  NULL,
  SUM(slots) AS slots
FROM
  cd.bookings
WHERE
  starttime >= '2012-01-01'
  AND starttime < '2013-01-01'
GROUP BY
  facid
UNION ALL
SELECT
  NULL,
  NULL,
  sum(slots) AS slots
FROM
  cd.bookings
WHERE
  starttime >= '2012-01-01'
  AND starttime < '2013-01-01'
ORDER BY
  facid,
  month

-- Method 2: Reusable
WITH bookings AS (
	SELECT facid, extract(MONTH FROM starttime) AS month, slots
	FROM cd.bookings
	WHERE
		starttime >= '2012-01-01'
		AND starttime < '2013-01-01'
)
SELECT facid, month, sum(slots) FROM bookings GROUP BY facid, month
UNION ALL
SELECT facid, NULL, sum(slots) FROM bookings GROUP BY facid
UNION ALL
SELECT NULL, NULL, sum(slots) FROM bookings
ORDER BY facid, month;

-- Method 3: Using built-in aggregate functions ROLLUP
SELECT facid, EXTRACT (MONTH from starttime) AS month, SUM(slots) AS slots
FROM cd.bookings
WHERE starttime >= '2012-01-01' AND starttime < '2013-01-01'
GROUP BY ROLLUP(facid, month)
ORDER BY facid, month