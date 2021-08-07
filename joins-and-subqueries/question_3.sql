-- How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
SELECT DISTINCT recs.firstname AS firstname,
  recs.surname AS surname
FROM cd.members mems
  INNER JOIN cd.members recs ON mems.recommendedby = recs.memid
ORDER BY recs.surname,
  recs.firstname