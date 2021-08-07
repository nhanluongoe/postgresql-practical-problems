-- How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member,
  (
    SELECT recs.firstname || ' ' || recs.surname AS recommender
    FROM cd.members recs
    WHERE mems.recommendedby = recs.memid
  )
FROM cd.members mems
ORDER BY member