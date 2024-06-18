WITH
CTE AS (
    SELECT *,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY Salary DESC) AS rk
    FROM Employee
),
CTE2 AS (
    SELECT d.name AS Department, c.name AS Employee, c.salary AS Salary,c.rk
    FROM CTE AS c
    JOIN Department AS d ON c.departmentId = d.id
    ORDER BY d.name,c.rk
)
SELECT Department, Employee, Salary
FROM CTE2
WHERE rk <4