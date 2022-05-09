-- Return a list of the start and end time of the last 10 bookings (ordered by the time at which they end, followed by the time at which they start) in the system.

select starttime, starttime + slots * (interval '30 minutes') as endtime
from cd.bookings
order by endtime desc, starttime desc
limit 10;