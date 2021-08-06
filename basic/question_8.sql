-- How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
SELECT memid,
  surname,
  firstname,
  joindate
FROM cd.members
WHERE joindate >= '2012-09-01';