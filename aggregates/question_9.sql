-- Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

-- Method 1: Good for clarity, bad for performance
SELECT facs.name,
  SUM(
    slots * CASE
      WHEN bks.memid = 0 THEN facs.guestcost
      ELSE facs.membercost
    END
  ) AS revenue
FROM cd.bookings bks
  INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.name
HAVING SUM(
    slots * CASE
      WHEN bks.memid = 0 THEN facs.guestcost
      ELSE facs.membercost
    END
  ) < 1000
ORDER BY revenue;

-- Method 2: Good for performance, bad for clarity
SELECT name,
  revenue
FROM (
    SELECT facs.name,
      sum(
        CASE
          WHEN memid = 0 THEN slots * facs.guestcost
          ELSE slots * membercost
        END
      ) AS revenue
    FROM cd.bookings bks
      INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    GROUP BY facs.name
  ) AS agg
WHERE revenue < 1000
ORDER BY revenue;