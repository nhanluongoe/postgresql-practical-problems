-- For each month of the year in 2012, output the number of days in that month. Format the output as an integer column containing the month of the year, and a second column containing an interval data type.

WITH month_table AS (
  SELECT
    generate_series(timestamp '2012-01-01', timestamp '2012-12-31', '1 month') AS month
)

SELECT
  extract(month FROM month_table.month) AS month,
  (month_table.month + interval '1 month' - month_table.month) AS length
FROM
  month_table
