-- Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining. Remember that member IDs are not guaranteed to be sequential.

-- Method 1
SELECT COUNT(*) OVER(ORDER BY joindate) AS row_number, firstname, surname
FROM cd.members
ORDER BY joindate

-- Method 2
SELECT ROW_NUMBER() OVER(ORDER BY joindate) , firstname, surname
FROM cd.members
ORDER BY joindate