-- In our previous exercises, we deleted a specific member who had never made a booking. How can we make that more general, to delete all members who have never made a booking?

-- Method 1
DELETE FROM cd.members
WHERE memid = (
    SELECT mem.memid
    FROM cd.members mem
      LEFT JOIN cd.bookings boo ON mem.memid = boo.memid
    WHERE boo.memid IS NULL
  ) 

-- Method 2
DELETE FROM cd.members
WHERE memid NOT IN (
    SELECT memid
    FROM cd.bookings
  ) 

-- Method 3
DELETE FROM cd.members mems
WHERE NOT EXISTS (
    SELECT 1
    FROM cd.bookings
    WHERE memid = mems.memid
  )