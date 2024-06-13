WITH temp AS (
    SELECT 
        *,
        CASE WHEN income < 20000 THEN 1 ELSE 0 END AS "Low_S",
        CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END AS "Average_S",
        CASE WHEN income > 50000 THEN 1 ELSE 0 END AS "High_S"

    FROM Accounts
)
SELECT 'High Salary' AS category, SUM(High_S) AS accounts_count 
FROM temp
UNION ALL
SELECT 'Low Salary' AS category, SUM(Low_S) AS accounts_count 
FROM temp
UNION ALL
SELECT 'Average Salary' AS category, SUM(Average_S) AS accounts_count 
FROM temp