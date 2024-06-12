WITH CTE AS(
    SELECT *,
        SUM(weight) OVER (ORDER BY turn) AS Total_weight 
    FROM Queue
)
SELECT person_name
FROM CTE
WHERE Total_weight <=1000
ORDER BY Total_weight DESC
limit 1
