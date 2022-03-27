-- Produce a count of the number of recommendations each member has made. Order by member ID.
SELECT recommendedby,
  COUNT(*)
FROM cd.members
GROUP BY recommendedby
WHERE recommendedby IS NOT NULL
ORDER BY recommendedby;