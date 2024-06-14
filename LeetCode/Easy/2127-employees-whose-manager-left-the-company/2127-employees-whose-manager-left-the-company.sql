select employee_id
FROM Employees
WHERE salary < 30000 and manager_id not in (select employee_id from Employees)
ORDER BY 1
