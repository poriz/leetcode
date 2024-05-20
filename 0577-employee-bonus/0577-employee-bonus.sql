# Write your MySQL query statement below
SELECT e.name,b.bonus

FROM Employee as e left Join Bonus as b ON e.empId = b.empId
WHERE b.bonus < 1000 or b.bonus is null