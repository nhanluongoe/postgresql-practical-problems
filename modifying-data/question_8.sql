-- We want to remove member 37, who has never made a booking, from our database. How can we achieve that?
DELETE FROM cd.members
WHERE memid = (
    SELECT mem.memid
    FROM cd.members mem
      LEFT JOIN cd.bookings boo ON mem.memid = boo.memid
    WHERE boo.memid IS NULL
  )