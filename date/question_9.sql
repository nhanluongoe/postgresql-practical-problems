-- Return a count of bookings for each month, sorted by month

select date_trunc('month', starttime) as month, count(*) as endtime
from cd.bookings
group by month
order by month