# Write your MySQL query statement below
SELECT c.name
FROM Customer as c
WHERE c.referee_id != 2 or c.referee_id is NULL