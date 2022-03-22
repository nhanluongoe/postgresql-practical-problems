-- As part of a clearout of our database, we want to delete all bookings from the cd.bookings table. How can we accomplish this?

-- Method 1: Using DELETE
DELETE FROM cd.bookings

-- Method 2: Using TRUNCATE
TRUNCATE cd.bookings
