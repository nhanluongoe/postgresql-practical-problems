-- In the previous exercise, you learned how to add a facility. Now you're going to add multiple facilities in one command. Use the following values:
-- facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
-- facid: 10, Name: 'Squash Court 2', membercost: 3.5, guestcost: 17.5, initialoutlay: 5000, monthlymaintenance: 80.
INSERT INTO cd.facilities (
    facid,
    name,
    membercost,
    guestcost,
    initialoutlay,
    monthlymaintenance
  )
VALUES (9, 'Spa', 20, 30, 100000, 800),
  (10, 'Squash Court 2', 3.5, 17.5, 5000, 80)