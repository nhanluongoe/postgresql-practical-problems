-- Produce a list of members (including guests), along with the number of hours they've booked in facilities, rounded to the nearest ten hours. Rank them by this rounded figure, producing output of first name, surname, rounded hours, rank. Sort by rank, surname, and first name.

SELECT
  mems.firstname,
  mems.surname,
  ((sum(bks.slots) + 10) / 20) * 10 hours,
  rank() OVER (ORDER BY ((sum(bks.slots) + 10) / 20) * 10 DESC)
rank
FROM
  cd.bookings bks
  INNER JOIN cd.members mems ON bks.memid = mems.memid
GROUP BY
  mems.firstname,
  mems.surname
ORDER BY
  rank,
  surname,
  firstname
