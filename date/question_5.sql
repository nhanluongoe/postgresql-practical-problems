-- Work out the number of seconds between the timestamps '2012-08-31 01:00:00' and '2012-09-02 00:00:00'

-- Method 1: PostgreSQL trick
select extract(epoch from (timestamp '2012-09-02 00:00:00' - timestamp '2012-08-31 01:00:00'))

-- Method 2
select 	extract(day from ts.int)*60*60*24 +
	extract(hour from ts.int)*60*60 + 
	extract(minute from ts.int)*60 +
	extract(second from ts.int)
from
		(select timestamp '2012-09-02 00:00:00' - '2012-08-31 01:00:00' as int) ts

