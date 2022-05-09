-- Produce a timestamp for 1 a.m. on the 31st of August 2012.

-- Method 1
select timestamp '2012-08-31 01:00:00'

-- Method 2
select '2012-08-31 01:00:00'::timestamp

-- Method 3
select cast('2012-08-31 01:00:00' as timestamp)

