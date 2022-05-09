-- Produce a list of all the dates in October 2012. They can be output as a timestamp (with time set to midnight) or a date.

select generate_series(timestamp '2012-10-01', timestamp '2012-10-31', '1 day') as ts