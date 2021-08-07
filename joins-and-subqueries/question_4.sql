-- How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).
SELECT mems.firstname AS memfname,
  mems.surname AS memsname,
  recs.firstname AS recfname,
  recs.surname AS recsname
FROM cd.members mems
  LEFT JOIN cd.members recs ON mems.recommendedby = recs.memid
ORDER BY mems.surname,
  mems.firstname