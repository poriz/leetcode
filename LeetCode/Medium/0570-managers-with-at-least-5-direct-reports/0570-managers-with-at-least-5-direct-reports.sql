WITH table1 AS (
    SELECT e2.name AS manager, COUNT(e1.managerId) AS cnt_manage
    FROM Employee AS e1
    JOIN Employee AS e2
        ON e1.managerId = e2.id
    GROUP BY e1.managerId
    )
SELECT manager AS name
FROM table1
WHERE cnt_manage > 4;