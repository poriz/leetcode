WITH
CTE AS (
    SELECT requester_id AS id, COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY requester_id
),
CTE2 AS(
    SELECT accepter_id AS id, COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
),
CTE3 AS (
    SELECT * FROM CTE
    UNION ALL
    SELECT * FROM CTE2
)
SELECT id, SUM(num) AS num
FROM CTE3
GROUP BY id
ORDER BY SUM(num) DESC
LIMIT 1