-- Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. The output table should consist of the facility id, name, and hours booked, sorted by facility id. Try formatting the hours to two decimal places.
SELECT
  facs.facid,
  facs.name,
  TRIM(TO_CHAR(SUM(slots) / 2.0, '9999999D99'))
FROM
  cd.bookings bks
  INNER JOIN cd.facilities facs ON facs.facid = bks.facid
GROUP BY
  facs.facid
ORDER BY
  facs.facid
