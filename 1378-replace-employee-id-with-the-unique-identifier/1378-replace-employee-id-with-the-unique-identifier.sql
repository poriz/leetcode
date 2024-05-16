# Write your MySQL query statement below

SELECT uni.unique_id, es.name
FROM Employees as es left JOIN EmployeeUNI as uni ON es.id = uni.id
