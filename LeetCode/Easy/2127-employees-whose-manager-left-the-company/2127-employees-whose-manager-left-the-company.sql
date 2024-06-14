WITH temp AS (
    SELECT *
    FROM Employees
    WHERE manager_id is not null AND salary < 30000
)
select employee_id
FROM temp
WHERE manager_id not in (select employee_id from Employees)
ORDER BY 1
