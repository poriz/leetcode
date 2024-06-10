WITH temp AS (
    SELECT id,num,
    LEAD(id) OVER (ORDER BY id) AS id1,
    LEAD(num) OVER (ORDER BY id) AS num1,
    LEAD(id,2) OVER (ORDER BY id) AS id2,
    LEAD(num,2) OVER (ORDER BY id) AS num2
    FROM Logs
)
SELECT DISTINCT(num) AS ConsecutiveNums
FROM temp
WHERE (id1 - id) = 1 AND (id2 - id1) = 1 AND num = num1 AND num1 = num2;